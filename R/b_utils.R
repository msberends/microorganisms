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


# globalVariables(c(
# ))

format_included_data_number <- function(data) {
  if (is.data.frame(data)) {
    n <- nrow(data)
  } else {
    n <- length(unique(data))
  }
  if (n > 10000) {
    rounder <- -3 # round on thousands
  } else if (n > 1000) {
    rounder <- -2 # round on hundreds
  } else {
    rounder <- -1 # round on tens
  }
  paste0("~", format(round(n, rounder), decimal.mark = ".", big.mark = " "))
}

vector_or <- function(v, quotes = TRUE, reverse = FALSE, sort = TRUE, initial_captital = FALSE, last_sep = " or ") {
  # makes unique and sorts, and this also removed NAs
  v <- unique(v)
  if (isTRUE(sort)) {
    v <- sort(v)
  }
  if (isTRUE(reverse)) {
    v <- rev(v)
  }
  if (isTRUE(quotes)) {
    quotes <- '"'
  } else if (isFALSE(quotes)) {
    quotes <- ""
  } else {
    quotes <- quotes[1L]
  }
  if (isTRUE(initial_captital)) {
    v[1] <- gsub("^([a-z])", "\\U\\1", v[1], perl = TRUE)
  }
  if (length(v) <= 1) {
    return(paste0(quotes, v, quotes))
  }
  if (identical(v, c("I", "R", "S"))) {
    # class 'sir' should be sorted like this
    v <- c("S", "I", "R")
  }
  # oxford comma
  if (last_sep %in% c(" or ", " and ") && length(v) > 2) {
    last_sep <- paste0(",", last_sep)
  }
  # all commas except for last item, so will become '"val1", "val2", "val3" or "val4"'
  paste0(
    paste0(quotes, v[seq_len(length(v) - 1)], quotes, collapse = ", "),
    last_sep, paste0(quotes, v[length(v)], quotes)
  )
}

vector_and <- function(v, quotes = TRUE, reverse = FALSE, sort = TRUE, initial_captital = FALSE) {
  vector_or(
    v = v, quotes = quotes, reverse = reverse, sort = sort,
    initial_captital = initial_captital, last_sep = " and "
  )
}

documentation_date <- function(d) {
  paste0(trimws(format(d, "%e")), " ", month.name[as.integer(format(d, "%m"))], ", ", format(d, "%Y"))
}

nr2char <- function(x) {
  if (x %in% c(1:10)) {
    v <- c(
      "one" = 1, "two" = 2, "three" = 3, "four" = 4, "five" = 5,
      "six" = 6, "seven" = 7, "eight" = 8, "nine" = 9, "ten" = 10
    )
    names(v[x])
  } else {
    x
  }
}
