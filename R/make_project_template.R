# This function showcases how one might write a function to be used as an
# RStudio project template. This function will be called when the user invokes
# the New Project wizard using the project template defined in the template file
# at:
#
#   inst/rstudio/templates/project/hello_world.dcf
#
# The function itself just echos its inputs and outputs to a file called INDEX,
# which is then opened by RStudio when the new project is opened.
make_project_template <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(path, "R"), recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(path, "R/requests"), recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(path, "data_raw"), recursive = TRUE, showWarnings = FALSE)

  dir.create(file.path(path, "reference"), recursive = TRUE, showWarnings = FALSE)

  # Collect the list of inputs in a list to be called later:
  dots <- list(...)

  # Check selected folder
  if(dots[["createShiny"]]){
    dir.create(file.path(path, "shiny"), recursive = TRUE, showWarnings = FALSE)
  }
  # In the project template we've added 2 choices for the user:
  # * One allows them to select if the project will have a .gitignore file
  # * The other will create a folder, given a select input from the user

  # Change the working directory to the recently created folder:
  setwd(file.path(getwd(), path))
  # Check .gitignore argument
  # if(dots[["createGitignore"]]) {
    git_ignores <-
      c(
        '.Rhistory',
        '.Rapp.history',
        '.RData',
        '.Ruserdata',
        '.Rproj.user/',
        '.Renviron'
      )

    writeLines(paste(git_ignores, sep = '\n'), '.gitignore')
  # }


}
