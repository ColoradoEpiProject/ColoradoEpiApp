make_project_template <- function(path, ...) {

  dots <- list(...)

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(path, "R"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "R/requests"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "data_raw"), recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "reference"), recursive = TRUE, showWarnings = FALSE)

  # Check selected folder
  if(dots[["createShiny"]]){
    dir.create(file.path(path, "shiny"), recursive = TRUE, showWarnings = FALSE)
  }

  # create gitignore file
  git_ignores <-
    c('.Rhistory',
      '.Rapp.history',
      '.RData',
      '.Ruserdata',
      '.Rproj.user/',
      '.Renviron'
      )

    writeLines(paste(git_ignores, sep = '\n'), file.path(path, '.gitignore'))

    script_source <- system.file("rstudio/templates", "README.Rmd", package = "ColoradoEpiApp")
    script_dest <- file.path(path, "README.Rmd")
    file.copy(script_source, script_dest, overwrite = TRUE)

}
