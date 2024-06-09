
<!-- README.md is generated from README.Rmd. Please edit that file -->

# evolved

This educational R package involves both simple and complex functions
for simulating and analyzing biological data. It is adequate for
inquiries that assume different levels of student independence (e.g., as
categorized by Banchi & Bell, 2008), and add up to other options of
software where students can handle, organize, and visualize biological
data. evolved is heavily oriented towards providing tools for
inquiry-based learning - where students follow scientific practices to
actively construct knowledge (Pedaste et al, 2015) - and thus most of
its computer functions rely either on (A) simulating data from simple
models that can usually be derived from first principles (see Table 1)
or in (B) analyzing (measuring, testing, visualizing) datasets with
characteristics that are common to many fields related to evolutionary
biology.

## Installation

You can install the development version of evolved from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Auler-J/evolved")
```

# Usage

Following we show all the functions designed to be handled directly by
users. Functions use examples are provided in the vignettes.

<html>
<head>
</head>
<body>
<table>
<tr>
<th>
Function name
</th>
<th>
Biology field mostly associated with function
</th>
<th>
Function purpose
</th>
<th>
Designed to be opened?
</th>
</tr>
<tr>
<td>
calcFossilDivTT()
</td>
<td>
Paleobiology
</td>
<td>
Estimates fossil Diversity through time
</td>
<td>
yes
</td>
</tr>
<tr>
<td>
countSeqDiffs()
</td>
<td>
Phylogenetics
</td>
<td>
Calculates the number of different sites between two protein sequences
</td>
<td>
yes
</td>
</tr>
<tr>
<td>
NatSelSim()
</td>
<td>
Population genetics
</td>
<td>
Simulate natural selection in a bi-allelic population
</td>
<td>
yes
</td>
</tr>
<tr>
<td>
OneGenHW()
</td>
<td>
Population genetics
</td>
<td>
Simulates stochastic allelic frequencies in a population that follows
Hardy-Weinberg Equilibrium
</td>
<td>
yes
</td>
</tr>
<tr>
<td>
WFDriftSim()
</td>
<td>
Population genetics
</td>
<td>
Simulates allele frequency change through generations under genetic
drift
</td>
<td>
yes
</td>
</tr>
<tr>
<td>
simulateBirthDeath()
</td>
<td>
Macroevolution
</td>
<td>
Simulates number of species following a birth-death model
</td>
<td>
no
</td>
</tr>
<tr>
<td>
SimulateTree()
</td>
<td>
Macroevolution
</td>
<td>
Simulates a phylogenetic tree following a birth-death model
</td>
<td>
no
</td>
</tr>
</table>
</body>
</html>

## Vignettes

To view the vignettes, run the following code:

`vignette("vignette_name", package = "evolved")`

Specifically, the following topics are addressed in every vignette
(ordered from basic to advanced):

- intro_r
  - Learn R basic syntax
  - Learn R basic coding: objects, vector calculations, etc
  - Learn basic plotting and annotation functions
  - Learn the basic object classes vignettes will use
- popgen_intro
  - Simple math notation
  - Probability of independent events
  - Random number generators and density/mass probability functions
  - Malthusian growth
  - Mendelian genetics and Hardy-Weinberg Equilibrium (HWE) at a single
    locus
  - Heterozygosity
  - HWE, deleterious alleles, and mutation
  - Mendelian genetics at multiple loci
  - Describing genetic variation in DNA segments
- popgen_drift
  - Genetic drift: qualitative expectation
  - Genetic drift: building intuition
  - Dissecting the variability in outcomes
  - Genetic drift and heterozygosity decay
  - Effective population size
  - Historical note
- popgen_selection
  - Breeding effective population size
  - Mutation-drift equilibrium
  - Selection
  - The case of the peppered moths
- deeptime_clocks
  - Exploring sequence data
  - A simple measure of genetic distance
  - The Poisson correction
  - Building a molecular clock
  - Molecular clocks and inferences about deep time
  - Jukes-Cantor correction
  - The uncertainty of your molecular clock
- deeptime_rocks
  - Exploring fossil occurrences
  - Diversity patterns in deep time
  - The spatial distribution of the record
  - Drawing conclusions from the fossil record
  - Technical note: Dating fossils in absolute time
- birthdeath_deeptime
  - The birth-death (BD) model
  - Deterministic expectations of the birth-death model
  - Estimation under the simple birth-death
  - Effects of variation on the net diversification rate
  - The birth-death model is a stochastic process
  - Adding in extinction
  - Age-richness models and empirical richness through time
- birthdeath_phylogenies
  - Estimating diversification rates under pure birth
  - Estimating diversification rates under birth-death
  - What affects speciation and extinction?

## References

Banchi, H., & Bell, R. (2008). The many levels of inquiry. Science and
children, 46(2), 26.

Pedaste, M., Mäeots, M., Siiman, L. A., De Jong, T., Van Riesen, S. A.,
Kamp, E. T., … & Tsourlidaki, E. (2015). Phases of inquiry-based
learning: Definitions and the inquiry cycle. Educational research
review, 14, 47-61.
