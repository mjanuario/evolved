# Plot NatSelSim output

Plot NatSelSim output

## Usage

``` r
plotNatSel(
  gen.HW = gen.HW,
  p.t = p.t,
  w.t = w.t,
  t = t,
  W.gntp = c(w11, w12, w22),
  plot.type = "animateall",
  knitr = FALSE
)
```

## Arguments

- gen.HW:

  Dataframe with A1A1, A1A2 and A2A2 genotypic frequencies in each
  generation (nrows = NGen)

- p.t:

  Allelic frequency through time

- w.t:

  Mean population fitness through time

- t:

  time

- W.gntp:

  Initial genotypic fitness

- plot.type:

  String indicating if plot should be animated. The default,
  "animateall", animate all possible panels. Other options are "static",
  "animate1", "animate3", or "animate4".

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package.

## Value

Plot of NatSelSim's output (see `NatSelSim`'s help page for details).

## See also

Other microevolution:
[`NatSelSim()`](https://mjanuario.github.io/evolved/reference/NatSelSim.md),
[`OneGenHWSim()`](https://mjanuario.github.io/evolved/reference/OneGenHWSim.md),
[`WFDriftSim()`](https://mjanuario.github.io/evolved/reference/WFDriftSim.md),
[`plotWFDrift()`](https://mjanuario.github.io/evolved/reference/plotWFDrift.md)
