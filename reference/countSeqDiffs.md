# Counting protein sequence differences

`countSeqDiffs` counts the number of protein differences among two
sequences of proteins within the same "ProteinSeq" object.

## Usage

``` r
countSeqDiffs(x, taxon1, taxon2)
```

## Arguments

- x:

  A "ProteinSeq" object containing proteins from `taxon1` and `taxon2`.

- taxon1:

  A character giving the common name of the first species that will be
  compared. Must be a name present in `x`.

- taxon2:

  A character giving the common name of the second species that will be
  compared. Must be a name present in `x`.

## Value

A integer giving the number of protein differences between `taxon1` and
`taxon2`.

## See also

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
[`fitCRBD()`](https://mjanuario.github.io/evolved/reference/fitCRBD.md),
[`lttPlot()`](https://mjanuario.github.io/evolved/reference/lttPlot.md),
[`plotPaintedWhales()`](https://mjanuario.github.io/evolved/reference/plotPaintedWhales.md),
[`plotProteinSeq()`](https://mjanuario.github.io/evolved/reference/plotProteinSeq.md),
[`plotRawFossilOccs()`](https://mjanuario.github.io/evolved/reference/plotRawFossilOccs.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md),
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Matheus Januario, Dan Rabosky, Jennifer Auler

## Examples

``` r
countSeqDiffs(cytOxidase, "human", "chimpanzee")
#> [1] 4

countSeqDiffs(cytOxidase, "human", "cnidaria")
#> [1] 161

countSeqDiffs(cytOxidase, "chimpanzee", "cnidaria")
#> [1] 162
```
