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
    if (!is.character(path)) {
        stop("path is not a character!")
    }
    
    # Set data paths
    r_library_path <- .libPaths()[1]
    promise_data_dir <- file.path(r_library_path, "promise", "data")
    promise_data_path <- file.path(promise_data_dir, "promise.rda")
    
    if (.update) {
        
        if (!file.exists(path)) {
            
            stop(cli::symbol$warning," ", path, " doesn't exist, nothing to link")
            
        } else {
            
            if (dir.exists(promise_data_dir)) {
                message(crayon::green(cli::symbol$tick, "folder exists"))
                message("removing old file", promise_data_path)
                file.remove(promise_data_path)
                
            } else {
                
                message(cli::symbol$warning, " folder is missing, creating folder...")
                
                dir.create(promise_data_dir)
                
                message(crayon::green(cli::symbol$tick, "folder created ", promise_data_dir))
            }
            
            result <- tryCatch(file.symlink(from = path, to = promise_data_path))
            
            if (result) {
                
                message(crayon::green(cli::symbol$tick, "Created symlink", promise_data_path))
            }
        }
    }
    
    # Check if file already exists
    if (file.exists(promise_data_path)) {
        
        message(crayon::green(cli::symbol$circle_filled, "destination file already exists, no need to link"))
        
        message(crayon::black(cli::symbol$info, "trying to update?", sprintf("run `set_data_path(\"%s\", .update = TRUE)", path)))
        
    } else {
        
        if (!file.exists(path)) {
            
            stop(cli::symbol$warning," ", path, " doesn't exist, nothing to link")
            
        } else {
            
            if (dir.exists(promise_data_dir)) {
                message(crayon::green(cli::symbol$tick, "folder exists"))
                
            } else {
                
                message(cli::symbol$warning, " folder is missing, creating folder...")
                
                dir.create(promise_data_dir)
                
                message(crayon::green(cli::symbol$tick, "folder created ", promise_data_dir))
            }
            
            result <- tryCatch(file.symlink(from = path, to = promise_data_path))
            
            if (result) {
                
                message(crayon::green(cli::symbol$tick, "Created symlink", promise_data_path))
            }
        }
    }
}
    