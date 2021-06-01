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

#' Data Set with Microorganisms Names
#'
#' A data set containing the microbial taxonomy, last updated in `r CATALOGUE_OF_LIFE$yearmonth_LPSN`, of six kingdoms from the Catalogue of Life (CoL) and the List of Prokaryotic names with Standing in Nomenclature (LPSN).
#' @inheritSection catalogue_of_life Catalogue of Life
#' @format A [data.frame]:
#' - `mo`\cr ID of microorganism as used by this package
#' - `fullname`\cr Full name, like `"Escherichia coli"`
#' - `kingdom`, `phylum`, `class`, `order`, `family`, `genus`, `species`, `subspecies`\cr Taxonomic rank of the microorganism
#' - `rank`\cr Text of the taxonomic rank of the microorganism, like `"species"` or `"genus"`
#' - `ref`\cr Author(s) and year of concerning scientific publication
#' - `species_id`\cr ID of the species as used by the Catalogue of Life
#' - `source`\cr Either `r paste0("'", sort(unique(microorganisms$source)), "'", collapse = ", ")` (see *Source*)
#' - `prevalence`\cr Prevalence of the microorganism, see [as.mo()]
#' - `snomed`\cr Systematized Nomenclature of Medicine (SNOMED) code of the microorganism, according to the `r SNOMED_VERSION$current_source` (see *Source*).
#' @details
#' The contents of this data set are extensively used by the `AMR` package, which allow standardised and reproducible antimicrobial resistance data analysis.
#'
#' Please note that entries are only based on the Catalogue of Life and the LPSN (see below). Since these sources incorporate entries based on (recent) publications in the International Journal of Systematic and Evolutionary Microbiology (IJSEM), it can happen that the year of publication is sometimes later than one might expect.
#'
#' For example, *Staphylococcus pettenkoferi* was described for the first time in Diagnostic Microbiology and Infectious Disease in 2002 (\doi{10.1016/s0732-8893(02)00399-1}), but it was not before 2007 that a publication in IJSEM followed (\doi{10.1099/ijs.0.64381-0}). Consequently, the `AMR` package returns 2007 for `mo_year("S. pettenkoferi")`.
#'
#' ## Manual additions
#' For convenience, some entries were added manually:
#'
#' - 11 entries of *Streptococcus* (beta-haemolytic: groups A, B, C, D, F, G, H, K and unspecified; other: viridans, milleri)
#' - 2 entries of *Staphylococcus* (coagulase-negative (CoNS) and coagulase-positive (CoPS))
#' - 3 entries of *Trichomonas* (*Trichomonas vaginalis*, and its family and genus)
#' - 1 entry of *Candida* (*Candida krusei*), that is not (yet) in the Catalogue of Life
#' - 1 entry of *Blastocystis* (*Blastocystis hominis*), although it officially does not exist (Noel *et al.* 2005, PMID 15634993)
#' - 5 other 'undefined' entries (unknown, unknown Gram negatives, unknown Gram positives, unknown yeast and unknown fungus)
#' - 6 families under the Enterobacterales order, according to Adeolu *et al.* (2016, PMID 27620848), that are not (yet) in the Catalogue of Life
#'
#' ## Direct download
#' This data set is available as 'flat file' for use even without \R - you can find the file here:
#'
#' * <https://github.com/msberends/AMR/raw/master/data-raw/microorganisms.txt>
#'
#' The file in \R format (with preserved data structure) can be found here:
#'
#' * <https://github.com/msberends/AMR/raw/master/data/microorganisms.rda>
#' @section About the Records from LPSN (see *Source*):
#' The List of Prokaryotic names with Standing in Nomenclature (LPSN) provides comprehensive information on the nomenclature of prokaryotes. LPSN is a free to use service founded by Jean P. Euzeby in 1997 and later on maintained by Aidan C. Parte.
#'
#' As of February 2020, the regularly augmented LPSN database at DSMZ is the basis of the new LPSN service. The new database was implemented for the Type-Strain Genome Server and augmented in 2018 to store all kinds of nomenclatural information. Data from the previous version of LPSN and from the Prokaryotic Nomenclature Up-to-date (PNU) service were imported into the new system. PNU had been established in 1993 as a service of the Leibniz Institute DSMZ, and was curated by Norbert Weiss, Manfred Kracht and Dorothea Gleim.
#' @source
#' `r gsub("{year}", CATALOGUE_OF_LIFE$year, CATALOGUE_OF_LIFE$version, fixed = TRUE)` as currently implemented in this package:
#'
#' * Annual Checklist (public online taxonomic database), <http://www.catalogueoflife.org>
#'
#' List of Prokaryotic names with Standing in Nomenclature (`r CATALOGUE_OF_LIFE$yearmonth_LPSN`) as currently implemented in this `AMR` package:
#'
#' * Parte, A.C., Sarda Carbasse, J., Meier-Kolthoff, J.P., Reimer, L.C. and Goker, M. (2020). List of Prokaryotic names with Standing in Nomenclature (LPSN) moves to the DSMZ. International Journal of Systematic and Evolutionary Microbiology, 70, 5607-5612; \doi{10.1099/ijsem.0.004332}
#' * Parte, A.C. (2018). LPSN — List of Prokaryotic names with Standing in Nomenclature (bacterio.net), 20 years on. International Journal of Systematic and Evolutionary Microbiology, 68, 1825-1829; \doi{10.1099/ijsem.0.002786}
#' * Parte, A.C. (2014). LPSN — List of Prokaryotic names with Standing in Nomenclature. Nucleic Acids Research, 42, Issue D1, D613–D616; \doi{10.1093/nar/gkt1111}
#' * Euzeby, J.P. (1997). List of Bacterial Names with Standing in Nomenclature: a Folder Available on the Internet. International Journal of Systematic Bacteriology, 47, 590-592; \doi{10.1099/00207713-47-2-590}
#'
#' `r SNOMED_VERSION$current_source` as currently implemented in this package:
#'
#' * Retrieved from the `r SNOMED_VERSION$title`, OID `r SNOMED_VERSION$current_oid`, version `r SNOMED_VERSION$current_version`; url: <`r SNOMED_VERSION$url`>
#' @seealso [AMR::as.mo()], [AMR::mo_property()]
"microorganisms"

#' Data Set with Previously Accepted Taxonomic Names
#'
#' A data set containing old (previously valid or accepted) taxonomic names according to the Catalogue of Life.
#' @inheritSection catalogue_of_life Catalogue of Life
#' @format A [data.frame]:
#' - `fullname`\cr Old full taxonomic name of the microorganism
#' - `fullname_new`\cr New full taxonomic name of the microorganism
#' - `ref`\cr Author(s) and year of concerning scientific publication
#' - `prevalence`\cr Prevalence of the microorganism, see [as.mo()]
#' @details
#' The contents of this data set are extensively used by the `AMR` package, which allow standardised and reproducible antimicrobial resistance data analysis.
#' @source Catalogue of Life: Annual Checklist (public online taxonomic database), <http://www.catalogueoflife.org>
#'
#' Parte, A.C. (2018). LPSN — List of Prokaryotic names with Standing in Nomenclature (bacterio.net), 20 years on. International Journal of Systematic and Evolutionary Microbiology, 68, 1825-1829; \doi{10.1099/ijsem.0.002786}
#' @seealso [AMR::as.mo()] [AMR::mo_property()] [microorganisms]
"microorganisms.old"

#' Data Set with Common Microorganism Codes
#'
#' A data set containing commonly used codes for microorganisms, from laboratory systems and WHONET.
#' @format A [data.frame]:
#' - `code`\cr Commonly used code of a microorganism
#' - `mo`\cr ID of the microorganism in the [microorganisms] data set
#' @details
#' The contents of this data set are extensively used by the `AMR` package, which allow standardised and reproducible antimicrobial resistance data analysis.
#' @seealso [AMR::as.mo()] [microorganisms]
"microorganisms.codes"


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
  paste0("~", format(round(n, rounder), decimal.mark = ".", big.mark = ","))
}

#' The Catalogue of Life
#'
#' This package contains the complete taxonomic tree of almost all microorganisms from the authoritative and comprehensive Catalogue of Life.
#' @section Catalogue of Life:
#' This package contains the complete taxonomic tree of almost all microorganisms (`r format_included_data_number(microorganisms)` species) from the authoritative and comprehensive Catalogue of Life (CoL, <http://www.catalogueoflife.org>). The CoL is the most comprehensive and authoritative global index of species currently available. Nonetheless, we supplemented the CoL data with data from the List of Prokaryotic names with Standing in Nomenclature (LPSN, [lpsn.dsmz.de](https://lpsn.dsmz.de)). This supplementation is needed until the [CoL+ project](https://github.com/CatalogueOfLife/general) is finished, which we await.
#'
#' [Click here][catalogue_of_life] for more information about the included taxa.
#' @section Included Taxa:
#' Included are:
#' - All `r format_included_data_number(microorganisms[which(microorganisms$kingdom %in% c("Archeae", "Bacteria", "Chromista", "Protozoa")), ])` (sub)species from the kingdoms of Archaea, Bacteria, Chromista and Protozoa
#' - All `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Fungi" & microorganisms$order %in% c("Eurotiales", "Microascales", "Mucorales", "Onygenales", "Pneumocystales", "Saccharomycetales", "Schizosaccharomycetales", "Tremellales")), ])` (sub)species from these orders of the kingdom of Fungi: Eurotiales, Microascales, Mucorales, Onygenales, Pneumocystales, Saccharomycetales, Schizosaccharomycetales and Tremellales, as well as `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Fungi" & !microorganisms$order %in% c("Eurotiales", "Microascales", "Mucorales", "Onygenales", "Pneumocystales", "Saccharomycetales", "Schizosaccharomycetales", "Tremellales")), ])` other fungal (sub)species. The kingdom of Fungi is a very large taxon with almost 300,000 different (sub)species, of which most are not microbial (but rather macroscopic, like mushrooms). Because of this, not all fungi fit the scope of this package and including everything would tremendously slow down our algorithms too. By only including the aforementioned taxonomic orders, the most relevant fungi are covered (such as all species of *Aspergillus*, *Candida*, *Cryptococcus*, *Histplasma*, *Pneumocystis*, *Saccharomyces* and *Trichophyton*).
#' - All `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Animalia"), ])` (sub)species from `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Animalia"), "genus"])` other relevant genera from the kingdom of Animalia (such as *Strongyloides* and *Taenia*)
#' - All `r format_included_data_number(microorganisms.old)` previously accepted names of all included (sub)species (these were taxonomically renamed)
#' - The complete taxonomic tree of all included (sub)species: from kingdom to subspecies
#' - The responsible author(s) and year of scientific publication
#'
#' The Catalogue of Life (<http://www.catalogueoflife.org>) is the most comprehensive and authoritative global index of species currently available. It holds essential information on the names, relationships and distributions of over 1.9 million species. The Catalogue of Life is used to support the major biodiversity and conservation information services such as the Global Biodiversity Information Facility (GBIF), Encyclopedia of Life (EoL) and the International Union for Conservation of Nature Red List. It is recognised by the Convention on Biological Diversity as a significant component of the Global Taxonomy Initiative and a contribution to Target 1 of the Global Strategy for Plant Conservation.
#'
#' The syntax used to transform the original data to a cleansed \R format, can be found here: <https://github.com/msberends/AMR/blob/master/data-raw/reproduction_of_microorganisms.R>.
#' @name catalogue_of_life
#' @rdname catalogue_of_life
#' @seealso Data set [microorganisms] for the actual data. \cr
#' Function [AMR::as.mo()] to use the data for intelligent determination of microorganisms.
NULL
