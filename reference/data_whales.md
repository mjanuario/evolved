# Whale body size and speciation rates

Data on the body size of many cetacean species and species-specific
speciation rates. This dataset is part of the package and is licensed
under the Creative Commons Attribution 4.0 International License (CC BY
4.0).

## Usage

``` r
data_whales
```

## Format

A `data.frame` with 75 rows and 4 columns.

- species:

  Whale species

- log_mass:

  Log of body mass (grams)

- S:

  Species-specific speciation rate

- color:

  Suggested color to be used for the tip's clade

## Source

Compilation of many primary sources (see details).

## Details

Species follow taxonomy from Steeman et al (2009). Species-specific
speciation rates from Rabosky 2014 & Rabosky et al, 2014. Mass data from
PanTHERIA (Jones et al, 2009).

## References

Jones, K. E., Bielby, J., Cardillo, M., Fritz, S. A., O'Dell, J., Orme,
C. D. L., ... & Purvis, A. (2009). PanTHERIA: a species‐level database
of life history, ecology, and geography of extant and recently extinct
mammals: Ecological Archives E090‐184. Ecology, 90(9), 2648-2648.

Rabosky, D. L. (2014). Automatic detection of key innovations, rate
shifts, and diversity-dependence on phylogenetic trees. PLoS one, 9(2),
e89543.

Rabosky, D. L., Grundler, M., Anderson, C., Title, P., Shi, J. J.,
Brown, J. W., ... & Larson, J. G. (2014). BAMM tools: an R package for
the analysis of evolutionary dynamics on phylogenetic trees. Methods in
Ecology and Evolution, 5(7), 701-707.

Steeman, M. E., Hebsgaard, M. B., Fordyce, R. E., Ho, S. Y., Rabosky, D.
L., Nielsen, R., ... & Willerslev, E. (2009). Radiation of extant
cetaceans driven by restructuring of the oceans. Systematic biology,
58(6), 573-585.
