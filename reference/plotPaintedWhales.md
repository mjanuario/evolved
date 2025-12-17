# Plotting the whale phylogeny and coloring its clades

`plotPaintedWhales` plots the phylogeny from Steeman et al (2011),
coloring the Dolphins (Delphinidae), porpoises (Phocoenidae), the
Mysticetes, the baleen whales (Balaenopteridae), and the Beaked whales
(Ziphiidae).

## Usage

``` r
plotPaintedWhales(
  show.legend = TRUE,
  direction = "rightwards",
  knitr = FALSE,
  ...
)
```

## Arguments

- show.legend:

  Logical indicating if clade legend should be shown.

- direction:

  Phylogeny plotting direction. Should be set to "rightwards"

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package. (the default) or "leftwards".

- ...:

  other arguments to be passed to
  [`phytools::plotSimmap`](https://rdrr.io/pkg/phytools/man/plotSimmap.html)

## Value

The whale phylogeny, with branch lengths being colored by a major whale
taxonomic group.

## References

Steeman, M. E., Hebsgaard, M. B., Fordyce, R. E., Ho, S. Y., Rabosky, D.
L., Nielsen, R., ... & Willerslev, E. (2009). Radiation of extant
cetaceans driven by restructuring of the oceans. Systematic biology,
58(6), 573-585.

## See also

help page from
[`phytools::plotSimmap`](https://rdrr.io/pkg/phytools/man/plotSimmap.html)

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
[`fitCRBD()`](https://mjanuario.github.io/evolved/reference/fitCRBD.md),
[`lttPlot()`](https://mjanuario.github.io/evolved/reference/lttPlot.md),
[`plotProteinSeq()`](https://mjanuario.github.io/evolved/reference/plotProteinSeq.md),
[`plotRawFossilOccs()`](https://mjanuario.github.io/evolved/reference/plotRawFossilOccs.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md),
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Matheus Januario, Jennifer Auler

## Examples

``` r
plotPaintedWhales(knitr = TRUE)
#> no colors provided. using the following legend:
#>                    1        Baleen whales        Beaked whales 
#>              "black"            "#DF536B"            "#61D04F" 
#> Belugas and narwhals             Dolphins     Other mysticetes 
#>            "#2297E6"            "#28E2E5"            "#CD0BBC" 
#>            Porpoises 
#>            "#F5C710" 

```
