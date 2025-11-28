Instructions on EvolVEd, R, RStudio, RMarkdown
================
Matheus Januario, Jenniefer Auler, Andressa Viol, and Daniel Rabosky
Nov/2024

- [EvolVEd](#evolved)
  - [Installing EvolVEd](#installing-evolved)
  - [Vignettes (Tutorials)](#vignettes-tutorials)
  - [Community guidelines and suggesting
    changes](#community-guidelines-and-suggesting-changes)

# EvolVEd

`evolved` (EVOLutionary Virtual EDucation) is an open-source R package
designed for graduate or advanced undergraduate courses in evolutionary
biology. It emphasizes tools for inquiry-based learning, where students
engage in scientific practices to actively build knowledge (Pedaste et
al., 2015). The package includes `vignettes` (tutorials) to facilitate
classroom investigations. However, educators are encouraged to develop
their own content modules depending on class context and/or learning
objectives. Most of evolved‘s core functions are oriented towards either
($i$) developing student intuition for classic models in evolutionary
biology using simulations, or ($ii$) analyzing (parameter estimation,
hypothesis testing, visualization) datasets associated with key
questions in evolutionary biology.

## Installing EvolVEd

The EvolVEd package is available in two versions:

### Stable Version:

The stable version represents the “error-proof” version of the package.
It may have reduced features due to CRAN’s constraints (e.g., dataset
size). The stable version can be downloaded directly from the [The
Comprehensive R Archive
Network](https://cran.r-project.org/web/packages/evolved/index.html). A
simpler way to install this version is to run the following command in
your R terminal:

    install.packages("evolved")

### Development Version:

The development version is the most complete and updated version of the
package. It may contain datasets, functions, or documentation slightly
out of CRAN’s standards. The development version is hosted on
[GitHub](https://github.com/mjanuario/evolved) and requires the
`devtools` package for installation. If `devtools` is not already
installed, you can install it first by running the code lines below:

    # Install devtools 
    install.packages("devtools")

    # Then, install the development version of EvolVEd:
    devtools::install_github("mjanuario/evolved")

#### Features in the development version that are absent in the stable version:

- Datasets:
  - `mammals_spp` (Extant species list of mammals)
  - `ammonoidea_fossil` (Fossil occurrences of ammonoids
  - `mammals_fossil` (Fossil occurrences of mammals)
  - `trilob_fossil` (Fossil occurrences of trilobites)

## Vignettes (Tutorials)

To view the vignettes, run the following code:

    vignette("vignette_name", package = "evolved")

With `"vignette_name"` being one of the names below. Each vignette
covers the following topics, organized from basic to advanced:

#### 1. If you never used R before… (name: `install_r`)

- Introduces R and guides complete beginners through installation.
- Explains RStudio’s interface and recommended configurations.
- Teaches essential workflow: directories, saving, knitting, sourcing,
  loading data.
- Troubleshoots common R/RMarkdown issues for new users.
- Presents RMarkdown basics and why it’s useful for scientific work.

#### 2. Intro to R (name: `intro_r`)

- Basic R syntax and coding (objects, vector calculations, etc.)
- Plotting and annotation functions
- Overview of key object classes used in the vignettes

#### 3. Introduction to Population Genetics (name: `popgen_intro`)

- Simple mathematical notation
- Probability of independent events and random number generation
- Malthusian growth and Mendelian genetics
- Hardy-Weinberg Equilibrium (HWE) at a single locus
- Heterozygosity, deleterious alleles, and mutation
- Genetics at multiple loci and DNA variation

#### 4. Genetic Drift (name: `popgen_drift`)

- Intuition and qualitative expectations of genetic drift
- Variability in outcomes and heterozygosity decay
- Effective population size and historical context

#### 5. Selection in Population Genetics (name: `popgen_selection`)

- Breeding effective population size
- Mutation-drift equilibrium and selection
- Case studies (e.g., the peppered moths)

#### 6. Deep-Time Molecular Clocks (name: `deeptime_clocks`)

- Sequence data and genetic distance
- Poisson correction and Jukes-Cantor models
- Molecular clocks and their uncertainty
- Inferences about deep time

#### 7. Fossils and Deep-Time Patterns (name: `deeptime_rocks`)

- Exploring fossil occurrences and diversity patterns
- Spatial distribution and conclusions from fossil records
- Dating fossils in absolute time (technical notes)

#### 8. Birth-Death Models in Deep Time (name: `birthdeath_deeptime`)

- Deterministic expectations and stochastic processes
- Effects of variation on diversification rates
- Age-richness models and extinction dynamics

#### 9. Phylogenies and Birth-Death Models (name: `birthdeath_phylogenies`)

- Estimating diversification rates under pure birth and birth-death
  models
- Factors influencing speciation and extinction

## Community guidelines and suggesting changes

Questions and support requests should be sent to Matheus Januario’s
email (januarioml.eco \[at\] gmail.com). Bug & issue reports,
suggestions, improvements, or code additions should be pushed through
the same GitHub repository. Emailing Matheus Januario is also ok.
