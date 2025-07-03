---
title: 'evolved: open software for teaching Evolutionary biology through virtual inquiries'
tags:
  - R
  - Ecology
  - Evolution
  - Inquiry-based learning
authors:
  - name: Matheus Januario
    orcid: 0000-0002-6480-7095
    affiliation: "1, 2" # (Multiple affiliations must be quoted)
  - name: Jennifer P. Auler
    orcid: 0000-0001-7576-9058
    affiliation: 3
  - name: Andressa L. Viol
    affiliation: "1, 2"
  - name: Daniel L. Rabosky
    orcid: 0000-0002-7499-8251
    affiliation: "1, 2"
affiliations:
 - name: Museum of Zoology, University of Michigan, Ann Arbor, MI, USA 
   index: 1
 - name: Department of Ecology and Evolutionary Biology, University of Michigan, Ann Arbor, MI, USA 
   index: 2
 - name: Programa de Pós-Graduação em Ecologia, Universidade de São Paulo, Rua do Matão, 321, Travessa 14, São Paulo, SP, Brazil
   index: 3
date: 19 December 2024
bibliography: paper.bib

---

# Summary

  `evolved` (**EVOL**utionary **V**irtual **ED**ucation) is an open-source R 
  package [@R:2024] designed for graduate or advanced undergraduate courses in 
  evolutionary biology. It provides tools for inquiry-based learning, where 
  students engage in scientific practices to actively build knowledge
  [@Pedaste:2015]. The package includes vignettes (tutorials) to facilitate 
  classroom investigations (**Tables 1** & **2**). However, educators are encouraged 
  to develop their own content modules depending on class context and/or learning 
  objectives. Most of evolved's core functions are oriented towards either (i) 
  developing student intuition for classic models in evolutionary biology 
  using simulations, or (ii) analyzing (parameter estimation, hypothesis 
  testing, visualization) datasets associated with key questions in 
  evolutionary biology (**Tables 1** & **2**).  Importantly, these datasets correspond 
  structurally (e.g., organization and data types) to real datasets used by 
  scientists, and they are compatible with widely-used software for evolutionary 
  analysis (e.g., `ape` - [@Paradis:2019]). 

  `evolved`'s functions can be loosely classified into "high level" and "low level"
  (**Table 1**), thus providing tools for inquiries that assume different levels 
  of student independence (e.g., as categorized by @BanchiBell:2008 - see **Table 2**). High-level functions 
  execute complex sequences of operations while hiding many details, thus making 
  minimal assumptions of R proficiency and allowing users to focus on results. 
  They are either optimized for performance, or work as a simplified interface 
  ("wrappers") of simulators from standard scientific packages (e.g., functions 
  from packages `ape` [@Paradis:2019], `diversitree` [@Fitzjohn:2012], or 
  `phytools` [@Revell:2024]). These functions will likely work better in inquiries 
  with more student freedom and a greater focus on analyzing data (**Table 2**). In 
  contrast, "low level" functions focus on making explicit connections between 
  every sequential operation and are thus more easily applicable to structured 
  inquiries [@BanchiBell:2008]. They are also internally designed to be readable 
  by students with intermediate skills in R, allowing further engagement with 
  simulation parameters and outcomes.

  The package is designed to reduce barriers to data- and simulation-driven inquiries 
  and one vignette (`intro_R`) aims to introduce students/educators to R and its 
  pedagogical capabilities. We do not provide answers to the investigation prompts 
  in the vignettes, but educators can request answer keys from the corresponding 
  author (MJ). 

# Statement of need

  Evolutionary biology is a complex discipline that affords many opportunities for 
  students to practice interrogating, analyzing, and discussing data, but advanced classes 
  still need effective educational resources. `evolved` addresses this need by 
  focusing on core evidence used to study evolution: molecular/fossil data, 
  simulations, and sound mathematical principles in evolutionary biology. The 
  package helps teach programming, analytical, and reasoning skills through 
  interactive, hands-on activities, and its open-source design allows direct 
  engagement with algorithms and methods.

  `evolved` began in 2022 as a set of standalone functions used in an advanced evolutionary 
  biology course at the University of Michigan, originally designed for use in 
  hands-on classes of 2 hours per topic module. However, valuable class time was lost on 
  data setup and formatting, reducing student engagement with core material. In 2023, the 
  functions were consolidated into an R package to free up class time by simplifying 
  data loading, now made with a simple command: data(`dataset name`). 

# Software installation and use

  `evolved`'s stable version is [available on the Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/web/packages/evolved/index.html).
  The available vignettes draw inspiration from the authors' teaching experiences, 
  but they are not essential for the software to function and should be 
  interpreted as suggestions. Instructors should feel free to adapt evolved's 
  functionalities as they see fit. 

  To access a vignette, type `vignette("vignette_name")` 
  in R, replacing "`vignette_name`" with the vignette name (see **Table 2**). 
  The development version, more detailed information on the package/vignettes, and instructions for 
  installing and using R/RStudio/RMarkdown are provided at 
  [https://github.com/mjanuario/evolved](https://github.com/mjanuario/evolved). Questions should be sent to 
  MJ (correspondence author).

\small
**Table 1.** Selected functions illustrating the range of topics covered, with notes on their level (low = intended to be opened by students, high = wrapper function). A full list and descriptions of all functions, including helper and plotting functions, are available in the package manual [@Januario:2024]. 
\normalsize

\tiny
| Function name          | Associated subfield                               | Function purpose                                                                                    | Function Level | Vignette name            |
|------------------------|---------------------------------------------------|-----------------------------------------------------------------------------------------------------|----------------|--------------------------|
| `calcFossilDivTT()`    | Paleobiology                                      | Estimate diversity through time from fossil occurrences                                             | Low            | `deeptime_rocks`         |
| `countSeqDiffs()`      | Comparative molecular evolution and Phylogenetics | Calculates the number of different sites between two protein sequences                              | Low            | `deeptime_clocks`        |
| `NatSelSim()`          | Population genetics                               | Compute allele frequency dynamics under natural selection                                           | Low            | `pongen_selection`       |
| `OneGenHWSim()`        | Population genetics                               | Simulates independent assortment of gametes under Hardy-Weinberg equilibrium in a finite population | Low            | `pongen_intro`           |
| `WEDriftSim()`         | Population genetics                               | Simulates allele frequency change through time under genetic drift                                  | Low            | `pongen_drift`           |
| `simulateBirthDeath()` | Macroevolution                                    | Simulates the number of species following a birth-death model                                       | High           | `birthdeath_deeptime`    |
| `SimulateTree()`       | Macroevolution                                    | Simulates a phylogenetic tree following a birth-death model                                         | High           | `birthdeath_phylogenies` |
\normalsize

\small
**Table 2.** Different datasets and their suggested applications. The inquiry level follows the terminology and definitions of @BanchiBell:2008. Legend: occs. = Occurrences; Ver. = Version of the package (stable = hosted on CRAN, Devel. = development version hosted on github).
\normalsize

\tiny
| Dataset name             | Short description                                    | Suggested inquiry level  | Possible topic in inquiry                                  | Name of vignette with example activity | Data source                    |   Ver.      | 
|--------------------------|------------------------------------------------------|--------------------------|------------------------------------------------------------|----------------------------------------|--------------------------------|-------------|
| `data_whales`            | Cetacean body size and speciation rates              | Structured inquiry       | Statistical non-independence among closely related species | `birthdeath_phylogenies`               | [@Jones:2009; @Rabosky:2014]   |    Stable   |
| `whale_nbvlo`            | Cetacean molecular phylogeny                         | Structured inquiry       | Handling of phylogenies in analysis software               | `birthdeath_phylogenies`               | [@Steeman:2009]                |    Stable   |
| `cvtOxidase`             | Metazoan (homologous) protein sequence               | Open inquiry             | Comparative analysis of molecular data                     | `deeptime_clocks`                      | [@Benson:2012]                 |    Stable   |
| `birds_spp`              | Extant species list of birds                         | Structured inquiry       | Richness differences among clades                          | `deeptime_rocks`                       | [@Jetz:2012]                   |    Stable   |
| `mammals_spp`            | Extant species list of mammals                       | Structured inquiry       | Richness differences among clades                          | `deeptime_rocks`                       | [@Upham:2019]                  |   Devel.    |
| `ammonoidea_fossil`      | Ammonoid fossil occs.                                | Open inquiry             | Large-scale biodiversity patterns in the fossil record     | `deeptime_rocks`                       | [https://paleobiodb.org](https://paleobiodb.org) |   Devel.    |
| `mammals_fossil`         | Mammal fossil occs.                                  | Open inquiry             | Large-scale biodiversity patterns in the fossil record     | `deeptime_rocks`                       | [https://paleobiodb.org](https://paleobiodb.org) |   Devel.    |
| `dinos_fossil`           | Dinosaur fossil occs.                                | Open inquiry             | Large-scale biodiversity patterns in the fossil record     | `deeptime_rocks`                       | [https://paleobiodb.org](https://paleobiodb.org) |    Stable   |
| `trilob_fossil`          | Trilobite fossil occs.                               | Open inquiry             | Large-scale biodiversity patterns in the fossil record     | `deeptime_rocks`                       | [https://paleobiodb.org](https://paleobiodb.org) |   Devel.    |
| `timeseries_fossil`      | Timeseries of fossil species numbers for many clades | Guided inquiry           | Large-scale biodiversity patterns in the fossil record     | `birthdeath_deeptime`                  | [@Rabosky:2021] |    Stable   |
\normalsize

# Author contributions:

MJ and DLR designed most of the code, internal functions, and educational components. JPA joined later, contributing to visualization functions, documentation, implementation improvements, and preparing the package for CRAN standards. MJ, DLR, and ALV developed the vignettes. MJ wrote the first drafts of the paper, help pages, and vignettes, with all authors reviewing the material afterward.

# Acknowledgements

We thank Theodore Matel, Tristan Schramer, and Yu Kai Tanfor their suggestions.

# References

