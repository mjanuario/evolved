# Plot WFDriftSim output

Plot WFDriftSim output

## Usage

``` r
plotWFDrift(p.through.time, plot.type = plot, knitr = FALSE)
```

## Arguments

- p.through.time:

  Matrix with n.gen columns and n.sim lines

- plot.type:

  String. Options are "static" or "animate"

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package.

## Value

A static or animated plot of populations under genetic drift through
time

## See also

Other microevolution:
[`NatSelSim()`](https://mjanuario.github.io/evolved/reference/NatSelSim.md),
[`OneGenHWSim()`](https://mjanuario.github.io/evolved/reference/OneGenHWSim.md),
[`WFDriftSim()`](https://mjanuario.github.io/evolved/reference/WFDriftSim.md),
[`plotNatSel()`](https://mjanuario.github.io/evolved/reference/plotNatSel.md)

## Examples

``` r
store_p = WFDriftSim(Ne = 5, n.gen = 10, p0=.2, n.sim=5, plot = "none", print.data = TRUE)
plotWFDrift(store_p, "static")
```
