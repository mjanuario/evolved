# Simulating a phylogenetic trees through the birth-death process

`simulateTree` uses a birth-death process to simulate a phylogenetic
tree, following the format of `ape` package's `phylo` object. The
function is basically a wrapper for the `diversitree`'s `tree.bd`
function.

## Usage

``` r
simulateTree(
  pars,
  max.taxa = Inf,
  max.t,
  min.taxa = 2,
  include.extinct = FALSE
)
```

## Arguments

- pars:

  `numeric` vector with the simulation parameters: speciation (first
  slot) and extinction (second slot) rates, respectively. Should follow
  any formats stated in the function `tree.bd` from the `diversitree`
  package.

- max.taxa:

  Maximum number of taxa to include in the tree. If `Inf`, then the tree
  will be evolved until `max.t` time has passed.

- max.t:

  Maximum length to evolve the phylogeny over. If equal to `Inf`, then
  the tree will evolve until `max.taxa` extant taxa are present.

- min.taxa:

  Minimum number of taxa to include in the tree.

- include.extinct:

  A `logical` indicating if extinct taxa should be included in the final
  phylogeny.

## Value

A `phylo` object

## Details

see help page from
[`diversitree::tree.bd`](https://rdrr.io/pkg/diversitree/man/simulate.html)

## References

Paradis, E. (2012). Analysis of Phylogenetics and Evolution with R (Vol.
2). New York: Springer.

Popescu, A. A., Huber, K. T., & Paradis, E. (2012). ape 3.0: New tools
for distance-based phylogenetics and evolutionary analysis in R.
Bioinformatics, 28(11), 1536-1537.

FitzJohn, R. G. (2010). Analysing diversification with diversitree. R
Packag. ver, 9-2.

FitzJohn, R. G. (2012). Diversitree: comparative phylogenetic analyses
of diversification in R. Methods in Ecology and Evolution, 3(6),
1084-1092.

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
[`plotRawFossilOccs()`](https://mjanuario.github.io/evolved/reference/plotRawFossilOccs.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md)

## Author

Daniel Rabosky, Matheus Januario, Jennifer Auler

## Examples

``` r
S <- 1
E <- 0
set.seed(1)
phy <- simulateTree(pars = c(S, E), max.taxa = 6, max.t=Inf)
ape::plot.phylo(phy)
ape::axisPhylo()


# alternatively, we can stop the simulation using time:
set.seed(42)
phy2 <- simulateTree(pars = c(S, E), max.t=7)
ape::plot.phylo(phy2)
ape::axisPhylo()

```
