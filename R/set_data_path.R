#' Set promise data path
#'
#'Setting up symlink for promise data
#'
#'Since promise as of date contains PHI data processed data can't be bundled with
#'the package. If you mount the box.com folder as a local drive, one can symlink
#'the data to the promise data folder.
#'
#' @param path A \code{character} path to and including name and extension of the .rda file.
#' @param .interactive \code{logical} Use file browser
#' @param .update A \code{logical}, for whether or not to update symlink.
#'
#' @export
#' @examples 
#' \dontrun{
#' #First non-interactive use:
#' set_data_path("C:/Users/usename/Box/jolo_projects/promise/data/promise_v.0.1.3.rda, .interactive = FALSE)
#' 
#' #For interactive use
#' set_data_path()
#' 
#' #For updating path
#' set_data_path(.update = TRUE)
#' }
set_data_path <- function(path = NULL, .interactive = TRUE, .update = FALSE) {
    
    if(.interactive){
        path <- file.choose()
    }
    
    stopifnot(is.character(path))
    stopifnot(file.exists(path))
    stopifnot(tools::file_ext(path) %in% "rda")
    
    filename <-
        tools::file_path_sans_ext(
            basename(path)
        )
    
    # Parse filename for linking to correct file
    filename <- gsub(
        pattern = "([0-9]|_v|v\\.|_|\\.)",
        replacement = "",
        x = filename
    )
    
    filename <- tolower(filename)
    
    filename <- tryCatch(
        match.arg(filename, c("ecg", "promiseData")),
        error = function(e) {
            stop("File ", path, " does not match either ecg or promiseData")
        }
    )
    
    # Set data paths
    destination_dir  <- system.file("data", package = "promise")
    destination_file <- system.file(paste0(filename, ".rda"), "data", package = "promise")
    
    if (.update) {
        stopifnot(file.exists(destination_file))
        message("removing old file", destination_file)
        file.remove(destination_file)
        result <- tryCatch(file.symlink(from = path, to = destination_file))
        
        if (result) 
            message(crayon::green(cli::symbol$tick, "Created symlink", destination_file))
        else
            message("Failed at creating symlink from ",
                    path, 
                    " to ",
                    destination_file)
        
        return(invisible())
    }
    
    # Check if file already exists
    if (file.exists(destination_file)) {
        
        message(crayon::green(cli::symbol$circle_filled, "destination file already exists"))
        
        message(
            crayon::black(
                cli::symbol$info, 
                "trying to update?", 
                sprintf("run `set_data_path(\"%s\", .update = TRUE)", 
                        path)
                )
            )
        
        return(invisible())
    } 
    
    destination_file <- file.path(destination_dir, paste0(filename, ".rda"))
    
    result <- tryCatch(file.symlink(from = path, to = destination_file))
    if (result) 
        message(crayon::green(cli::symbol$tick, "Created symlink", destination_file))
    else
        message("Failed at creating symlink from ",
                path, 
                " to ",
                destination_file)

    return(invisible())
}
    
