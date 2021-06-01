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

SNOMED_VERSION <- list(title = "Public Health Information Network Vocabulary Access and Distribution System (PHIN VADS)",
                       current_source = "US Edition of SNOMED CT from 1 September 2020",
                       current_version = 12,
                       current_oid = "2.16.840.1.114222.4.11.1009",
                       value_set_name = "Microorganism",
                       url = "https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.1009")

CATALOGUE_OF_LIFE <- list(
  year = 2019,
  version = "Catalogue of Life: {year} Annual Checklist",
  url_CoL = "http://www.catalogueoflife.org/col/",
  url_LPSN = "https://lpsn.dsmz.de",
  yearmonth_LPSN = "March 2021"
)

.onLoad <- function (libname, pkgname) {
  if (system.file("microorganisms.rds", package = "microorganisms") != "") {
    # an update is available locally
    assign(x = "microorganisms",
           value = readRDS(system.file("microorganisms.rds", package = "microorganisms")),
           envir = asNamespace("microorganisms"))
  }
  if (system.file("microorganisms.old.rds", package = "microorganisms") != "") {
    # an update is available locally
    assign(x = "microorganisms.old",
           value = readRDS(system.file("microorganisms.old.rds", package = "microorganisms")),
           envir = asNamespace("microorganisms"))
  }
  if (system.file("microorganisms.codes.rds", package = "microorganisms") != "") {
    # an update is available locally
    assign(x = "microorganisms.codes",
           value = readRDS(system.file("microorganisms.codes.rds", package = "microorganisms")),
           envir = asNamespace("microorganisms"))
  }

  # more than 365 days ago since last update - show a notice in 10% of the cases
  if (interactive() &&
      runif(1) < 0.1 &&
      isTRUE(as.double(difftime(attributes(microorganisms::microorganisms)$last_updated, Sys.Date(), units = "d")) > 365)) {
    packageStartupMessage("A newer version of the microbial taxonomy data sets might be available on GitHub.\nRun microorganisms::update_data() to download them.")
  }

}
