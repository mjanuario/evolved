# Fit a constant-rate birth-death process to a phylogeny

`fitCRBD` fits a constant-rate birth-death process to a phylogeny in the
format of `ape` package's `phylo` object. Optimization is based on
likelihood functions made with `diversitree`. This function is basically
a wrapper for the `diversitree`'s `make.bd` function.

## Usage

``` r
fitCRBD(phy, n.opt = 5, l.min = 0.001, l.max = 5, max.bad = 200)
```

## Arguments

- phy:

  A `phylo` object, following terminology from package `ape`, in which
  function will operate.

- n.opt:

  Number of optimizations that will be tried by function.

- l.min:

  Lower bound for optimization. Default value is `0.001`.

- l.max:

  Upper bound for optimization. Default value is `5`.

- max.bad:

  Maximum number of unsuccessful optimization attempts. Default value is
  `200`.

## Value

A `numeric` with the best estimates of speciation `S` and extinction `E`
rates.

## References

Paradis, E. (2012). Analysis of Phylogenetics and Evolution with R (Vol.
2). New York: Springer.

Popescu, A. A., Huber, K. T., & Paradis, E. (2012). ape 3.0: New tools
for distance-based phylogenetics and evolutionary analysis in R.
Bioinformatics, 28(11), 1536-1537.

FitzJohn, R. G. (2010). Analysing diversification with diversitree. R
Package. ver, 9-2.

FitzJohn, R. G. (2012). Diversitree: comparative phylogenetic analyses
of diversification in R. Methods in Ecology and Evolution, 3(6),
1084-1092.

## See also

see help page from
[`diversitree::make.bd`](https://rdrr.io/pkg/diversitree/man/make.bd.html)
and [`stats::optim`](https://rdrr.io/r/stats/optim.html)

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
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
S <- 0.1
E <- 0.1
set.seed(1)
phy <- simulateTree(pars = c(S, E), max.taxa = 30, max.t = 8)
fitCRBD(phy)
#>         S         E 
#> 0.2471886 0.6915988 
```
