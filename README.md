# The `microorganisms` R package

This data package contains the full microbial taxonomy, from kingdom to subspecies, from over 50,000 microorganisms. The version number of this package indicates when the data was last updated in the form `YYYY-MM-x`, where `x` is a CRAN submission sequence number (often `0`).

This data package is primarily meant for (and was previously part of) the [`AMR` package](https://github.com/msberends/AMR), but can now serve any other package or person.

``` r
# calling the data without loading the package

microorganisms::microorganisms
#> # A tibble: 52,142 × 22
#>    mo       fulln…¹ status kingdom phylum class order family genus species subsp…² rank  ref   source lpsn 
#>    <mo>     <chr>   <chr>  <chr>   <chr>  <chr> <chr> <chr>  <chr> <chr>   <chr>   <chr> <chr> <chr>  <chr>
#>  1 B_GRAMN  (unkno… accep… Bacter… (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  2 B_GRAMP  (unkno… accep… Bacter… (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  3 B_ANAER  (unkno… accep… Bacter… (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  4 F_FUNGUS (unkno… accep… Fungi   (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  5 UNKNOWN  (unkno… accep… (unkno… (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  6 F_YEAST  (unkno… accep… Fungi   (unkn… "(un… "(un… "(unk… "(un… "(unkn… "(unkn… subs… NA    manua… NA   
#>  7 B_[FAM]… Abditi… accep… Bacter… Abdit… "Abd… "Abd… "Abdi… ""    ""      ""      fami… Taho… LPSN   4812 
#>  8 B_[ORD]… Abditi… accep… Bacter… Abdit… "Abd… "Abd… ""     ""    ""      ""      order Taho… LPSN   4982 
#>  9 B_[CLS]… Abditi… accep… Bacter… Abdit… "Abd… ""    ""     ""    ""      ""      class Taho… LPSN   29679
#> 10 B_[PHL]… Abditi… accep… Bacter… Abdit… ""    ""    ""     ""    ""      ""      phyl… Taho… LPSN   774  
#> # … with 52,132 more rows, 7 more variables: lpsn_parent <chr>, lpsn_renamed_to <chr>, gbif <chr>,
#> #   gbif_parent <chr>, gbif_renamed_to <chr>, prevalence <dbl>, snomed <list>, and abbreviated variable
#> #   names ¹fullname, ²subspecies
#> # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
```

The [`AMR` package](https://github.com/msberends/AMR) contains functions to [coerce arbitrary user input into valid microorganism codes](https://msberends.github.io/AMR/reference/as.mo.html) that exist in the `microorganisms` data set.

----

<small>This R package is licensed under the [GNU General Public License (GPL) v2.0](https://github.com/msberends/microorganisms/blob/main/LICENSE).</small>
