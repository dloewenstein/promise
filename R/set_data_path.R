#' Set promise data path
#'
#'Setting up symlink for promise data
#'
#'Since promise as of date contains PHI data processed data can't be bundled with
#'the package. If you mount the box.com folder as a local drive, one can symlink
#'the data to the promise data folder.
#'
#' @param path A \code{character} path to and including name and extension of the .rda file.
#' @param .update A \code{logical}, for whether or not to update symlink.
#'
#' @export
#'
set_data_path <- function(path, .update = FALSE) {
    
    stopifnot(is.character(path))
    stopifnot(file.exists(path))
    
    # Set data paths
    destination_dir  <- system.file("data", package = "promise")
    destination_file <- system.file("data", "promise.rda", package = "promise")
    
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
    
    destination_file <- file.path(destination_dir, "promise.rda")
    
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
    
