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

TAXONOMY_VERSION <- list(
  GBIF = list(
    accessed_date = as.Date("2022-12-11"),
    citation = "GBIF Secretariat (2022). GBIF Backbone Taxonomy. Checklist dataset \\doi{10.15468/39omei}.",
    url = "https://www.gbif.org"
  ),
  LPSN = list(
    accessed_date = as.Date("2022-12-11"),
    citation = "Parte, AC *et al.* (2020). **List of Prokaryotic names with Standing in Nomenclature (LPSN) moves to the DSMZ.** International Journal of Systematic and Evolutionary Microbiology, 70, 5607-5612; \\doi{10.1099/ijsem.0.004332}.",
    url = "https://lpsn.dsmz.de"
  ),
  SNOMED = list(
    accessed_date = as.Date("2021-07-01"),
    citation = "Public Health Information Network Vocabulary Access and Distribution System (PHIN VADS). US Edition of SNOMED CT from 1 September 2020. Value Set Name 'Microoganism', OID 2.16.840.1.114222.4.11.1009 (v12).",
    url = "https://phinvads.cdc.gov"
  ),
  LOINC = list(
    accessed_date = as.Date("2022-10-30"),
    citation = "Logical Observation Identifiers Names and Codes (LOINC), Version 2.73 (8 August, 2022).",
    url = "https://loinc.org"
  )
)

#' Data Set with `r format(nrow(microorganisms), big.mark = " ")` Microorganisms
#'
#' A data set containing the full microbial taxonomy (**last updated: `r documentation_date(max(TAXONOMY_VERSION$GBIF$accessed_date, TAXONOMY_VERSION$LPSN$accessed_date))`**) of `r nr2char(length(unique(microorganisms$kingdom[!grepl("unknown", microorganisms$kingdom, ignore.case = TRUE, perl = TRUE)])))` kingdoms from the List of Prokaryotic names with Standing in Nomenclature (LPSN) and the Global Biodiversity Information Facility (GBIF). This data set is the backbone of the `AMR` package.
#' @format A [tibble][tibble::tibble] with `r format(nrow(microorganisms), big.mark = " ")` observations and `r ncol(microorganisms)` variables:
#' - `mo`\cr ID of microorganism as used by this package
#' - `fullname`\cr Full name, like `"Escherichia coli"`. For the taxonomic ranks genus, species and subspecies, this is the 'pasted' text of genus, species, and subspecies. For all taxonomic ranks higher than genus, this is the name of the taxon.
#' - `status` \cr Status of the taxon, either `r vector_or(microorganisms$status)`
#' - `kingdom`, `phylum`, `class`, `order`, `family`, `genus`, `species`, `subspecies`\cr Taxonomic rank of the microorganism
#' - `rank`\cr Text of the taxonomic rank of the microorganism, such as `"species"` or `"genus"`
#' - `ref`\cr Author(s) and year of related scientific publication. This contains only the *first surname* and year of the *latest* authors, e.g. "Wallis *et al.* 2006 *emend.* Smith and Jones 2018" becomes "Smith *et al.*, 2018". This field is directly retrieved from the source specified in the column `source`. Moreover, accents were removed to comply with CRAN that only allows ASCII characters, e.g. "V`r "\u00e1\u0148ov\u00e1"`" becomes "Vanova".
#' - `lpsn`\cr Identifier ('Record number') of the List of Prokaryotic names with Standing in Nomenclature (LPSN). This will be the first/highest LPSN identifier to keep one identifier per row. For example, *Acetobacter ascendens* has LPSN Record number 7864 and 11011. Only the first is available in the `microorganisms` data set.
#' - `lpsn_parent`\cr LPSN identifier of the parent taxon
#' - `lpsn_renamed_to`\cr LPSN identifier of the currently valid taxon
#' - `gbif`\cr Identifier ('taxonID') of the Global Biodiversity Information Facility (GBIF)
#' - `gbif_parent`\cr GBIF identifier of the parent taxon
#' - `gbif_renamed_to`\cr GBIF identifier of the currently valid taxon
#' - `source`\cr Either `r vector_or(microorganisms$source)` (see *Source*)
#' - `prevalence`\cr Prevalence of the microorganism according to Bartlett *et al.* (2022, \doi{10.1099/mic.0.001269})
#' - `snomed`\cr Systematized Nomenclature of Medicine (SNOMED) code of the microorganism, version of `r documentation_date(TAXONOMY_VERSION$SNOMED$accessed_date)` (see *Source*)
#' @details
#' Please note that entries are only based on the List of Prokaryotic names with Standing in Nomenclature (LPSN) and the Global Biodiversity Information Facility (GBIF) (see below). Since these sources incorporate entries based on (recent) publications in the International Journal of Systematic and Evolutionary Microbiology (IJSEM), it can happen that the year of publication is sometimes later than one might expect.
#' @section Included Taxa:
#' Included taxonomic data are:
#' - All `r format_included_data_number(microorganisms[which(microorganisms$kingdom %in% c("Archeae", "Bacteria")), , drop = FALSE])` (sub)species from the kingdoms of Archaea and Bacteria
#' - `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Fungi"), , drop = FALSE])` (sub)species from the kingdom of Fungi. The kingdom of Fungi is a very large taxon with almost 300,000 different (sub)species, of which most are not microbial (but rather macroscopic, like mushrooms). Because of this, not all fungi fit the scope of this package. Only relevant fungi are covered (such as all species of *Aspergillus*, *Candida*, *Cryptococcus*, *Histoplasma*, *Pneumocystis*, *Saccharomyces* and *Trichophyton*).
#' - `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Protozoa"), , drop = FALSE])` (sub)species from the kingdom of Protozoa
#' - `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Animalia"), , drop = FALSE])` (sub)species from `r format_included_data_number(microorganisms[which(microorganisms$kingdom == "Animalia"), "genus", drop = TRUE])` other relevant genera from the kingdom of Animalia (such as *Strongyloides* and *Taenia*)
#' - All `r format_included_data_number(microorganisms[which(microorganisms$status != "accepted"), , drop = FALSE])` previously accepted names of all included (sub)species (these were taxonomically renamed)
#' - The complete taxonomic tree of all included (sub)species: from kingdom to subspecies
#' - The identifier of the parent taxons
#' - The year and first author of the related scientific publication
#'
#' ### Manual additions
#' For convenience, some entries were added manually:
#'
#' - `r format_included_data_number(which(microorganisms$genus == "Salmonella" & microorganisms$species == "enterica" & microorganisms$source == "manually added"))` entries for the city-like serovars of *Salmonellae*
#' - 11 entries of *Streptococcus* (beta-haemolytic: groups A, B, C, D, F, G, H, K and unspecified; other: viridans, milleri)
#' - 2 entries of *Staphylococcus* (coagulase-negative (CoNS) and coagulase-positive (CoPS))
#' - 1 entry of *Blastocystis* (*B.  hominis*), although it officially does not exist (Noel *et al.* 2005, PMID 15634993)
#' - 1 entry of *Moraxella* (*M. catarrhalis*), which was formally named *Branhamella catarrhalis* (Catlin, 1970) though this change was never accepted within the field of clinical microbiology
#' - 6 other 'undefined' entries (unknown, unknown Gram negatives, unknown Gram positives, unknown yeast, unknown fungus, and unknown anaerobic bacteria)
#'
#' The syntax used to transform the original data to a cleansed \R format, can be found here: <https://github.com/msberends/microorganisms/blob/main/data-raw/reproduction_of_microorganisms.R>.
#' @section About the Records from LPSN (see *Source*):
#' LPSN is the main source for bacteriological taxonomy of this `microorganisms` package.
#'
#' The List of Prokaryotic names with Standing in Nomenclature (LPSN) provides comprehensive information on the nomenclature of prokaryotes. LPSN is a free to use service founded by Jean P. Euzeby in 1997 and later on maintained by Aidan C. Parte.
#' @source
#' * `r TAXONOMY_VERSION$LPSN$citation` Accessed from <`r TAXONOMY_VERSION$LPSN$url`> on `r documentation_date(TAXONOMY_VERSION$LPSN$accessed_date)`.
#'
#' * `r TAXONOMY_VERSION$GBIF$citation` Accessed from <`r TAXONOMY_VERSION$GBIF$url`> on `r documentation_date(TAXONOMY_VERSION$GBIF$accessed_date)`.
#'
#' * `r TAXONOMY_VERSION$SNOMED$citation` URL: <`r TAXONOMY_VERSION$SNOMED$url`>
#'
#' * Grimont *et al.* (2007). Antigenic Formulae of the Salmonella Serovars, 9th Edition. WHO Collaborating Centre for Reference and Research on *Salmonella* (WHOCC-SALM).
#'
#' * Bartlett *et al.* (2022). **A comprehensive list of bacterial pathogens infecting humans** *Microbiology* 168:001269; \doi{10.1099/mic.0.001269}
#' @seealso [microorganisms.codes]
#' @rdname microorganisms
#' @examples
#' microorganisms
"microorganisms"

#' @rdname microorganisms
#' @export
current_version <- function() {
  TAXONOMY_VERSION
}

#' Data Set with `r format(nrow(microorganisms.codes), big.mark = " ")` Common Microorganism Codes
#'
#' A data set containing commonly used codes for microorganisms from laboratory systems.
#' @format A [tibble][tibble::tibble] with `r format(nrow(microorganisms.codes), big.mark = " ")` observations and `r ncol(microorganisms.codes)` variables:
#' - `code`\cr Commonly used code of a microorganism
#' - `mo`\cr ID of the microorganism in the [microorganisms] data set
#' @seealso [microorganisms]
#' @examples
#' microorganisms.codes
"microorganisms.codes"
