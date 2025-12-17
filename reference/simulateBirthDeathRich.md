# Simulating richness through birth-death processes

`simulateBirthDeathRich` calculates the number of species at a certain
point in time, following a birth-death process.

## Usage

``` r
simulateBirthDeathRich(t, S = NULL, E = NULL, K = NULL, R = NULL)
```

## Arguments

- t:

  Point in time which richness will be simulated.

- S:

  A numeric representing the per-capita speciation rate (in number of
  events per lineage per million years). Must be larger than `E`.

- E:

  A numeric representing the per-capita extinction rate (in number of
  events per lineage per million years). Must be smaller than `S`.

- K:

  A numeric representing the extinction fraction (i.e., `K` = `E` /
  `S`). Must be either zero or a positive which is number smaller than
  one.

- R:

  A numeric representing the per-capita Net Diversification rate (i.e.,
  `R` = `S` - `E`). Must be a positive number.

## Value

The number of simulated species (i.e., the richness).

## Details

The function only accepts as inputs `S` and `E`, or `K` and `R`.

## References

Raup, D. M. (1985). Mathematical models of cladogenesis. Paleobiology,
11(1), 42-52.

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
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Matheus Januario, Daniel Rabosky, Jennifer Auler

## Examples

``` r
# running a single simulation:
SS <- 0.40
EE <- 0.09
tt <- 10 #in Mya
simulateBirthDeathRich(t = tt, S = SS, E = EE)
#> [1] 23

#running many simulations and graphing results:
nSim <- 1000
res <- vector()
for(i in 1:nSim){
  res <- c(res, 
  simulateBirthDeathRich(t = tt, S = SS, E = EE))
}
plot(table(res)/length(res),
     xlab="Richness", ylab="Probability")
```
