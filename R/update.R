# ==================================================================== #
# TITLE                                                                #
# Reference Data for Microbial Taxonomy                                #
#                                                                      #
# SOURCE                                                               #
# https://github.com/msberends/microorganisms                          #
#                                                                      #
# LICENCE                                                              #
# (c) 2021 Berends MS et al.                                           #
# Developed at the University of Groningen, the Netherlands, in        #
# collaboration with non-profit organisations Certe Medical            #
# Diagnostics & Advice, and University Medical Center Groningen.       #
#                                                                      #
# This R package is free software; you can freely use and distribute   #
# it for both personal and commercial purposes under the terms of the  #
# GNU General Public License version 2.0 (GNU GPL-2), as published by  #
# the Free Software Foundation.                                        #
# We created this package for both routine data analysis and academic  #
# research and it was publicly released in the hope that it will be    #
# useful, but it comes WITHOUT ANY WARRANTY OR LIABILITY.              #
#                                                                      #
# Visit our website for the full manual and a complete tutorial about  #
# how to conduct AMR data analysis: https://msberends.github.io/AMR/   #
# ==================================================================== #


check_for_updates <- function() {
  is_new <- FALSE # put the check here, but how??
  if (is_new && interactive()) {
    message("An update of the microbial taxonomic reference data is publicly available on GitHub.\nRun microorganisms::update_data() to download and import it into R automatically.")
  }
}

#' Update Microbial Taxonomic Data
#' @export
update_data <- function() {
  current_version <- attributes(microorganisms)$last_updated

  repo <- "https://github.com/msberends/microorganisms/raw/master/data-raw"

  file1 <- "microorganisms"
  file2 <- "microorganisms.old"
  file3 <- "microorganisms.codes"
  file4 <- "microorganisms.legacy"

  source1 <- paste0(repo, "/", file1, ".rds")
  source2 <- paste0(repo, "/", file2, ".rds")
  source3 <- paste0(repo, "/", file3, ".rds")
  source4 <- paste0(repo, "/", file4, ".rds")
  tmp1 <- tempfile(pattern = file1, fileext = ".rds")
  tmp2 <- tempfile(pattern = file2, fileext = ".rds")
  tmp3 <- tempfile(pattern = file3, fileext = ".rds")
  tmp4 <- tempfile(pattern = file4, fileext = ".rds")
  destination1 <- paste0(find.package("microorganisms"), "/", file1, ".rds")
  destination2 <- paste0(find.package("microorganisms"), "/", file2, ".rds")
  destination3 <- paste0(find.package("microorganisms"), "/", file3, ".rds")
  destination4 <- paste0(find.package("microorganisms"), "/", file4, ".rds")

  answer <- utils::menu(choices = c("Yes", "No"),
              graphics = TRUE,
              title = paste0("This will download the newest microbial taxonomic reference data from GitHub and it will be saved to your local package folder.",
                             "\n\nSource:      ", dirname(source1),
                             "\nDestination: ", find.package("microorganisms"),
                             "\n\nDo you agree that four RDS files from this repository will be saved to your local package folder?"))
  if (answer != 1) {
    return(invisible())
  }

  tryCatch({
    download.file(url = source1, destfile = tmp1)
    download.file(url = source2, destfile = tmp2)
    download.file(url = source3, destfile = tmp3)
    download.file(url = source4, destfile = tmp4)
    new_version <- 1 / a
  }, error = function(e) {
    stop(paste0("An error occurred, run microorganisms::update_data() to try again.\n",
                "Error message: ", e$message),
         call. = FALSE)
  })

  # all downloaded well, now move to package location
  file.rename(from = tmp1, to = destination1)
  file.rename(from = tmp2, to = destination2)
  file.rename(from = tmp3, to = destination3)
  file.rename(from = tmp4, to = destination4)
}
