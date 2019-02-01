## ---- xml_to_dataframe

#' Read xml ecg to dataframe
#'
#' @param filepath A \code{character} path to the ecg xml files.
#'
#' @return
#' @export
#'
#' @examples

xmlToDataframe <- function(data_dir, filepath, use_progress=TRUE) {

# Update progress
if (use_progress) {
pb$tick()
}

# Read the xml document.

xml <- xml2::read_xml(file.path(data_dir, filepath))

# Use xpath to find precise parameters and get content.

ecg_time <- xml %>%
  xml2::xml_find_first("/RestingECG/TestDemographics/AcquisitionTime") %>%
  xml2::xml_contents() %>%
  xml2::xml_text()

ecg_date <- xml %>%
  xml2::xml_find_first("/RestingECG/TestDemographics/AcquisitionDate") %>%
  xml2::xml_contents() %>%
  xml2::xml_text()

# We want date in one column and formatted as POSIXct

ECGDate <- as.POSIXct(paste(ecg_date,
                            ecg_time,
                            sep = " "),
                      format = "%m-%d-%Y %H:%M:%S",
                      tz = "America/New_York")

demographics <- xml %>%
  xml2::xml_find_all("/RestingECG/PatientDemographics") %>%
  xml2::xml_contents()

ecg <- xml %>%
  xml2::xml_find_all("/RestingECG/RestingECGMeasurements") %>%
  xml2::xml_contents()

# Read the leaf names to use for column names later on.

demo_variables <- xml2::xml_name(demographics)
ecg_variables  <- xml2::xml_name(ecg)

demo_df <- demographics %>%
  xml2::xml_text() %>%
  unlist() %>%
  t() %>%
  data.frame(stringsAsFactors = FALSE)

colnames(demo_df) <- demo_variables

ecg_df <- ecg %>%
  xml2::xml_text() %>%
  unlist() %>%
  t() %>%
  data.frame(stringsAsFactors = FALSE)

colnames(ecg_df) <- ecg_variables

diagnosis <- xml %>%
  xml_find_all("/RestingECG/Diagnosis") %>%
  .cleanedStatement()

original_diagnosis <- xml %>%
  xml_find_all("/RestingECG/OriginalDiagnosis") %>%
  .cleanedStatement()

pat_df <- cbind(demo_df,
                ECGDate,
                ecg_df,
                diagnosis,
                original_diagnosis,
                as.data.frame(filepath,
                              stringsAsFactors = FALSE),
                stringsAsFactors = FALSE)

}

#' Clean the diagnosis statements
#'
#' @param x A xml diagnosis statement node
#'
#' @return
#' @export
#'
#' @examples
.cleanedStatement <- function(x) {

x <-  x %>%
  xml2::xml_text() %>% # Get the text from the node.
  stringr::str_replace_all(.,stringr::regex(("(userinsert)"), ignore_case = TRUE), "") %>%
  stringr::str_split("ENDSLINE") %>% # Split text into vectors.
  unlist() %>%
  stringr::word(1, sep = "\\.") %>%
  stringr::str_split(",") %>%
  unlist() %>%
  subset(stringr::str_detect(.,stringr::regex(("(absent|\\bno\\b|\\bsuggests?\\b|\\bprobabl(e|y)\\b|\\bpossible\\b|\\brecommend\\b|\\bconsider\\b|\\bindicated\\b|resting)"),
                            ignore_case = TRUE)) == FALSE) %>%
  stringr::str_c(collapse = ", ") %>%
  tolower()

}
library(purrr)
library(data.table)
library(stringr)
library(dplyr)

xml_dir <- "/mnt/c/Users/Daniel/Desktop/promise_xml"
data_dir <- "/mnt/z/jolo_projects/promise/inst/extdata"

# List all xml files.

xml_files <- list.files(xml_dir)

# Apply xmlToDataframe function to all xml files.

pb <- progress::progress_bar$new(total = length(xml_files))

pb$tick(0)
ecg <- map(xml_files, ~xmlToDataframe(xml_dir, .x))

# Combine the dataframes in the list to a data.table, fill to replace empty/
#missing data in columns with NA.

ecg <- rbindlist(ecg, fill = TRUE)


# ECG classification patterns. ------------------------------------------------

# | is used to alternate expressions, .* means zero_or_more of any character
# before

lbbb_pattern <- "(.*lbbb|.*left.?.?bundle|(.*bbb|bundle branch block).{1,8}?left)"

rbbb_pattern <- "(.*rbbb|.*right.?.?bundle|(.*bbb|bundle branch block).{1,8}?right)"

ivcd_pattern <- "(.*ivcd|.*int(ra|er).?vent.{1,10}?cond.{1,10}?delay)"

lafb_pattern <- "(.*lafb|.*left.{1,3}?ant.{1,10}?(fasc|hem))"

lpfb_pattern <- "(.*lpfb|.*left.{1,3}?post.{1,10}?(fasc|hem))"

afib_pattern <- ".*fib"

pace_pattern <- "(?<!junctional).(pac(i|e)|fus(ed|ion)|native|capture|sens(e|ing)|tracking|spike|magne?t?|escape)"

wpw_pattern <- ".*(wolf|pree?xc)"

svt_pattern <- "(.*atrial.?reen|.*(svt|flut)|.*supra.?vent|.*atrial.?tach)"

sinus_pattern <- "^.*sinus"

junctional_pattern <- ".*junctional(?!.?.?(escape|beat))"

exclude_pattern <- purrr::map(unlist(read.csv(file.path(data_dir, "exclusion_terms.csv"),
                                header = FALSE,
                                stringsAsFactors = FALSE)),
                       function(x) (sprintf("\\b%s", x)))

exclude_pattern <- paste0("(", paste0(str_c(unlist(exclude_pattern), collapse = "|")), ")", collapse = "")

# ECG classification. ----------------------------------------------------------

# Remove unwanted columns

ecg <- ecg[,.(PatientID,
              ECGDate,
              PRInterval,
              QRSDuration,
              QTCorrected,
              RAxis,
              diagnosis,
              original_diagnosis,
              filepath)]

# Use data.table for faster implementation, `:=` is just funcitonal way of saying
# LHS(left hand side) = RHS, str_detect finds the corresonding pattern in the
# diagnosis statement column, and assign true or false if it detects the pattern.

ecg <- ecg[, `:=` (QRSDuration       = as.numeric(QRSDuration),
                   PRInterval        = as.numeric(PRInterval),
                   QTCorrected       = as.numeric(QTCorrected),
                   RAxis             = as.numeric(RAxis),
                   Normal_conduction = NA,
                   Sinus_rhytm       = as.numeric(str_detect(diagnosis, sinus_pattern)),
                   SVT               = as.numeric(str_detect(diagnosis, svt_pattern)),
                   Junctional_rhythm = as.numeric(str_detect(diagnosis, junctional_pattern)),
                   LBBB              = as.numeric(str_detect(diagnosis, lbbb_pattern)),
                   RBBB              = as.numeric(str_detect(diagnosis, rbbb_pattern)),
                   RBBB_LAFB         = NA,
                   RBBB_LPFB         = NA,
                   IVCD              = as.numeric(str_detect(diagnosis, ivcd_pattern)),
                   LAFB              = as.numeric(str_detect(diagnosis, lafb_pattern)),
                   LPFB              = as.numeric(str_detect(diagnosis, lpfb_pattern)),
                   AFIB              = as.numeric(str_detect(diagnosis, afib_pattern)),
                   PACE              = as.numeric(str_detect(diagnosis, pace_pattern)),
                   WPW               = as.numeric(str_detect(diagnosis, wpw_pattern)),
                   Exclude           = as.numeric(str_detect(diagnosis, exclude_pattern))),
           by = .I]

setnames(ecg, c("PatientID", "QRSDuration", "RAxis"), c("MRN", "QRSDur", "AXIS"))

ecg[, `:=` (diagnosis          = NULL,
            original_diagnosis = NULL)]

ecg <- ecg[!is.na(QRSDur)]

saveRDS(ecg, file.path(DataPackageR::project_path(), "data-raw/promise_xml_ecg-GEN.rds"))

