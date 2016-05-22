#' Private functions that move or delete a file
#' 
#' @param name
#'   Name of the file (without extension)
#' @param newDir
#'   Directory where to move a file
#' @param subdir
#'   Subdirectory of the file
#' @param extension
#'   Extension of the file
#' @param mainDir
#'   Main directory ("scripts", "data" or "output")
#' @param errorName
#'   Name to display in error messages when file already exists
#' 
#' @noRd
#' 
.prMoveFile <- function(name, newDir, subdir = ".", extension, mainDir, errorName) {
  path <- sprintf("%s/%s/%s.%s", mainDir, subdir, name, extension)
  
  newDir <- file.path(mainDir, newDir)
  newDir <- gsub("/.$", "", newDir)
  if (!dir.exists(newDir)) dir.create(newDir, recursive = TRUE)
  
  newPath <- sprintf("%s/%s.%s", newDir, basename(name), extension)
  
  if (file.exists(newPath)) stop(errorName, " ", newPath, "already exists.")
  
  file.rename(path, newPath)
}

.prDeleteFile <- function(name, subdir = ".", extension, mainDir) {
  path <- sprintf("%s/%s/%s.%s", mainDir, subdir, name, extension)
  file.remove(path)
}