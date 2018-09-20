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
#' @return
#' @export
#'
#' @examples
set_data_path <- function(path) {
    r_library_path <- .libPaths()
    promise_data_path <- paste0(r_library_path, "/promise/data/promise.rda")
    if (!is.character(path)) {
        stop("path is not a character!")
    } else if (file.exists(promise_data_path)) {
        stop("destination file already exists, no need to link")
    } else if (!file.exists(path)) {
        stop("source file doesn't exist, nothing to link")
    } else {
        tryCatch(file.symlink(from = path, to = promise_data_path))
    }
}