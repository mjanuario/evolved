# Plot a literal interpretation of a fossil record

`plotRawFossilOccs` calculates and plots the early and late boundaries
associated with each taxa in a dataset.

## Usage

``` r
plotRawFossilOccs(
  data,
  tax.lvl = NULL,
  sort = TRUE,
  use.midpoint = TRUE,
  return.ranges = FALSE,
  knitr = FALSE
)
```

## Arguments

- data:

  A `data.frame` containing fossil data on the age (early and late
  bounds of rock layer, respectively labeled as `max_ma` and `min_ma`)
  and the taxonomic level asked in `tax_lv`.

- tax.lvl:

  A `character` giving the taxonomic in which calculations will be based
  on, which must refer to the column names in `data`. If `NULL` (default
  value), the function plots every individual occurrences in `data`.

- sort:

  `logical` indicating if taxa should be sorted by their `max_ma` values
  (default value is `TRUE`). Otherwise (i.e., if `FALSE`), function will
  follow the order of taxa (or occurrences) inputted in `data`.

- use.midpoint:

  `logical` indicating if function should use occurrence midpoints
  (between `max_ma` and `min_ma`) as occurrence temporal boundaries, a
  method commonly employed in paleobiology to remove noise related to
  extremely coarse temporal resolution due to stratification. This
  argument is only used if a `tax.lvl` is provided.

- return.ranges:

  `logical` indicating if ranges calculated by function should be return
  as a `data.frame`. If `tax.lvl` is `NULL`, the function don't
  calculate ranges and so it has nothing to return.

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package.

## Value

Plots a pile of the max-min temporal ranges of the chosen `tax.lvl`.
This usually will be stratigraphic ranges for occurrences (so there is
no attempt to estimate "true" ranges), and if `tax.lvl = NULL` (the
default), occurrences are drawn as ranges of stratigraphic resolution (=
the fossil dating imprecision). If `return.ranges = TRUE`, it returns a
`data.frame` containing the diversity (column `div`) of the chosen
taxonomic level, through time.

## See also

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
[`fitCRBD()`](https://mjanuario.github.io/evolved/reference/fitCRBD.md),
[`lttPlot()`](https://mjanuario.github.io/evolved/reference/lttPlot.md),
[`plotPaintedWhales()`](https://mjanuario.github.io/evolved/reference/plotPaintedWhales.md),
[`plotProteinSeq()`](https://mjanuario.github.io/evolved/reference/plotProteinSeq.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md),
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Matheus Januario, Jennifer Auler

## Examples

``` r
data("dinos_fossil")
oldpar <- par(no.readonly = TRUE) 
par(mfrow=c(1,2))
plotRawFossilOccs(dinos_fossil, tax.lvl = "species", knitr = TRUE)
plotRawFossilOccs(dinos_fossil, tax.lvl = "genus", knitr = TRUE)

par(oldpar)
```
