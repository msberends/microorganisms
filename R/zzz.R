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

.onLoad <- function (libname, pkgname) {
  if (system.file("microorganisms.rds", package = "microorganisms") != "") {
    # an update is available locally
    assign(x = "microorganisms",
           value = readRDS(system.file("microorganisms.rds", package = "microorganisms")),
           envir = asNamespace("microorganisms"))
  }
  check_for_updates()
}
