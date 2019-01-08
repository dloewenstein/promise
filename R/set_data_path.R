#' Set promise data path
#'
#'Setting up symlink for promise data
#'
#'Since promise as of date contains PHI data processed data can't be bundled with
#'the package. If you mount the box.com folder as a local drive, one can symlink
#'the data to the promise data folder.
#'
#' @param path A \code{character} path to and including name and extension of the .rda file.
#'
#' @export
#'
set_data_path <- function(path) {
    if (!is.character(path)) {
        stop("path is not a character!")
    }
    
    r_library_path <- .libPaths()[1]
    promise_data_dir <- paste0(r_library_path, "/promise/data/")
    message("Checking if library data folder exists...")
    
    if (dir.exists(promise_data_dir)) {
        message("folder exists")
    } else {
        message("folder is missing, creating folder...")
        dir.create(promise_data_dir)
        message("folder created ", promise_data_dir)
    }
    
    promise_data_path <- file.path(promise_data_dir, "promise.Rda")
    
    if (file.exists(promise_data_path)) {
        stop("destination file already exists, no need to link")
    } else if (!file.exists(path)) {
        stop("source file doesn't exist, nothing to link")
    } else {
        tryCatch(file.symlink(from = path, to = promise_data_path))
    }
}
