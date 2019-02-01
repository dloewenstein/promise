.onAttach <- function(libname, pkgname){
    
    if (!file.exists(file.path(.libPaths()[1], "promise", "data", "promise.rda"))) {
        
        if(!.Platform$OS.type == "unix") {
            
    packageStartupMessage(cat(crayon::underline(cli::symbol$info, "For first time use start R with adminrights and then run `set_data_path()`")))
        
        } else {
            packageStartupMessage(cat(crayon::underline(cli::symbol$info, "For first time use run `set_data_path()`")))
        }
        
    }
}