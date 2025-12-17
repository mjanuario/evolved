# Estimate speciation assuming a pure-birth process

`estimateSpeciation` Estimates the speciation rate assuming a
constant-rate, pure-birth model.

## Usage

``` r
estimateSpeciation(phy)
```

## Arguments

- phy:

  A `phylo` object, following terminology from package `ape` in which
  function will operate.

## Value

A `numeric` with the estimated speciation rate.

## References

Yule G.U. 1925. A mathematical theory of evolution, based on the
conclusions of Dr. JC Willis, FRS. Philosophical Transactions of the
Royal Society of London. Series B, Containing Papers of a Biological
Character. 213:21–87.

## See also

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
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
estimateSpeciation(phy)
#> [1] 1.333389
```
