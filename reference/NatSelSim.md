# Simulating natural selection through time in a bi-allelic gene

`NatSelSim` simulates natural selection in a bi-allelic gene through
`n.gen` generations.

## Usage

``` r
NatSelSim(
  w11 = 1,
  w12 = 1,
  w22 = 0.9,
  p0 = 0.5,
  n.gen = 10,
  plot.type = "animateall",
  print.data = FALSE,
  knitr = FALSE
)
```

## Arguments

- w11:

  Number giving the fitness of genotype A1A1. Values will be normalized
  if any genotype fitness exceeds one.

- w12:

  Number giving the fitness of genotype A1A2. Values will be normalized
  if any genotype fitness exceeds one.

- w22:

  Number giving the fitness of genotype A2A2. Values will be normalized
  if any genotype fitness exceeds one.

- p0:

  Initial (time = 0) allelic frequency of A1. A2's initial allelic
  frequency is `1-p0`.

- n.gen:

  Number of generation that will be simulated.

- plot.type:

  String indicating if plot should be animated. The default,
  "animateall" animate all possible panels. Other options are "static"
  (no animation), "animate1", "animate3", or "animate4". Users can
  animate each panel individually (using `plot.type = "animateX"`, with
  X being the panel which one wants to animate (so options are
  "animate1", "animate3", and "animate4" (see return for more info).

- print.data:

  Logical indicating whether all simulation results should be returned
  as a `data.frame`. Default value is `FALSE`.

- knitr:

  Logical indicating if plot is intended to show up in RMarkdown files
  made by the `Knitr` R package.

## Value

If `print.data = TRUE`, it returns a `data.frame` containing the number
of individuals for each genotype through time. The plots done by the
function shows (1) Allele frequency change through time. (2) The
adaptive landscape (which remains static during the whole simulation, so
can't be animated), (3) Time series of mean population fitness, and (4)
Time series of genotypic population frequencies.

## Details

If any value of fitness (i.e., `w11`, `w12`, `w22`) is larger than one,
fitness is interpreted as absolute fitness and values are re-normalized.

## References

Fisher, R. A. (1930). The Fundamental Theorem of Natural Selection. In:
The genetical theory of natural selection. The Clarendon Press

Plutynski, A. (2006). What was Fisher’s fundamental theorem of natural
selection and what was it for?. Studies in History and Philosophy of
Science Part C: Studies in History and Philosophy of Biological and
Biomedical Sciences, 37(1), 59-82.

## See also

Other microevolution:
[`OneGenHWSim()`](https://mjanuario.github.io/evolved/reference/OneGenHWSim.md),
[`WFDriftSim()`](https://mjanuario.github.io/evolved/reference/WFDriftSim.md),
[`plotNatSel()`](https://mjanuario.github.io/evolved/reference/plotNatSel.md),
[`plotWFDrift()`](https://mjanuario.github.io/evolved/reference/plotWFDrift.md)

## Author

Matheus Januario, Jennifer Auler, Dan Rabosky

## Examples

``` r
#using the default values (w11=1, w12=1, w22=0.9, p0=0.5, n.gen=10)
NatSelSim()

# Continuing a simulation for extra time:
# Run the first simulation
sim1=NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = 0.35, 
n.gen = 5, plot.type = "static", print.data = TRUE, knitr = TRUE)

# Then take the allelic frequency form the first sim:
new_p0 <- (sim1$AA[nrow(sim1)] + sim1$Aa[nrow(sim1)]*1/2) 
# and use as p0 for a second one:

NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = new_p0, n.gen = 5, plot.type = "static", knitr = TRUE)

```
