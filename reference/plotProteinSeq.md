# Plot protein sequence(s)

`plotProteinSeq` draws the sequences of proteins within the same
"ProteinSeq" object. In this format, more similar sequences will have
similar banding patterns.

## Usage

``` r
plotProteinSeq(x, taxon.to.plot, knitr = FALSE)
```

## Arguments

- x:

  A "ProteinSeq" object containing proteins from `taxon1` and `taxon2`.

- taxon.to.plot:

  A character vector providing the common name of the species that will
  be plotted. Must be a name present in `x`.

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package.

## Value

A draw of the protein sequence(s) provided. Colors refer to specific
amino acids ("R", "W", "I", "F", "S", "T", "N", "H", "K", "D", "G", "L",
"Y", "V", "M", "A", "E", "P", "Q", "C")", "gaps/space in the sequence
("-"), ambiguous amino acid ("B" - often representing either asparagine
("N") or aspartic acid ("D")), or another marker for ambiguous amino
acid ("X").

## See also

Other macroevolution:
[`calcFossilDivTT()`](https://mjanuario.github.io/evolved/reference/calcFossilDivTT.md),
[`checkAndFixUltrametric()`](https://mjanuario.github.io/evolved/reference/checkAndFixUltrametric.md),
[`countSeqDiffs()`](https://mjanuario.github.io/evolved/reference/countSeqDiffs.md),
[`estimateSpeciation()`](https://mjanuario.github.io/evolved/reference/estimateSpeciation.md),
[`fitCRBD()`](https://mjanuario.github.io/evolved/reference/fitCRBD.md),
[`lttPlot()`](https://mjanuario.github.io/evolved/reference/lttPlot.md),
[`plotPaintedWhales()`](https://mjanuario.github.io/evolved/reference/plotPaintedWhales.md),
[`plotRawFossilOccs()`](https://mjanuario.github.io/evolved/reference/plotRawFossilOccs.md),
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md),
[`simulateTree()`](https://mjanuario.github.io/evolved/reference/simulateTree.md)

## Author

Matheus Januario, Jennifer Auler

## Examples

``` r
data(cytOxidase)
plotProteinSeq(cytOxidase, c("human", "chimpanzee", "cnidaria"), knitr = TRUE)

```
