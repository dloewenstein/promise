.onAttach <- function(libname, pkgname){
    
    if (!file.exists(file.path(.libPaths()[1], "promise", "data", "promise.rda"))) {
        
        if(!.Platform$OS.type == "unix") {
            
    packageStartupMessage(cat(crayon::underline(cli::symbol$info, "For first time use start R with adminrights and then run `set_data_path()`")))
        
        } else {
            packageStartupMessage(cat(crayon::underline(cli::symbol$info, "For first time use run `set_data_path()`")))
        }
        
    } else {
        load(file.path(.libPaths()[1], "promise", "data", "promise.rda"))
        old_digest <- read.dcf(file.path(.libPaths()[1], "promise", "DATADIGEST"))
        matching <- old_digest[, "promise"] == digest::digest(promise)
        
        message(cat(crayon::red(cli::symbol$warning, 
                                "current promise data doesn't match package version\nRun `set_data_path()` and reference to", sprintf("promise_v.%s.rda", old_digest[, "DataVersion"]))))
    }
}