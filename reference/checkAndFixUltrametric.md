# Find and fix small rounding errors in ultrametric trees

`checkAndFixUltrametric` finds and correct small numerical errors that
might appear in ultrametric trees that where created through
simulations. This function should never be used as a formal statistical
method to make a tree ultrametric, as it was designed just to correct
small rounding errors.

## Usage

``` r
checkAndFixUltrametric(phy)
```

## Arguments

- phy:

  A `phylo` object, following terminology from package `ape` in which
  function will operate.

## Value

A check and fixed `phylo` object.

## References

Paradis, E. (2012). Analysis of Phylogenetics and Evolution with R (Vol.
2). New York: Springer.

Popescu, A. A., Huber, K. T., & Paradis, E. (2012). ape 3.0: New tools
for distance-based phylogenetics and evolutionary analysis in R.
Bioinformatics, 28(11), 1536-1537.

## See also

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
[`fitCRBD()`](https://mjanuario.github.io/evolved/reference/fitCRBD.md),
[`lttPlot()`](https://mjanuario.github.io/evolved/reference/lttPlot.md),
[`plotPaintedWhales()`](https://mjanuario.github.io/evolved/reference/plotPaintedWhales.md),
[`plotProteinSeq()`](https://mjanuario.github.io/evolved/reference/plotProteinSeq.md),
[`plotRawFossilOccs()`](https://mjanuario.github.io/evolved/reference/plotRawFossilOccs.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md),
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Daniel Rabosky, Matheus Januario, Jennifer Auler

## Examples

``` r
S <- 1
E <- 0
set.seed(1)
phy <- simulateTree(pars = c(S, E), max.taxa = 6, max.t = 5)
phy$edge.length[1] <- phy$edge.length[1]+0.1
ape::is.ultrametric(phy)
#> [1] FALSE
phy <- checkAndFixUltrametric(phy)
ape::is.ultrametric(phy)
#> [1] TRUE
```
