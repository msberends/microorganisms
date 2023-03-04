# ==================================================================== #
# TITLE                                                                #
# microorganisms: An R Package for Microbial Taxonomy Reference Data   #
#                                                                      #
# SOURCE                                                               #
# https://github.com/msberends/microorganisms                          #
#                                                                      #
# This R package is free software; you can freely use and distribute   #
# it for both personal and commercial purposes under the terms of the  #
# GNU General Public License version 2.0 (GNU GPL-2), as published by  #
# the Free Software Foundation.                                        #
# ==================================================================== #

.onLoad <- function(lib, pkg) {
  # be sure to print tibbles as tibbles
  try(suppressWarnings(requireNamespace("tibble", quietly = TRUE)), silent = TRUE)
}
