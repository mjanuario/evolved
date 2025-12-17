# Fossil Time series

Values of clade diversity for many clades of organisms (note some clades
are nested within other clades in the dataset). This dataset is part of
the package and is licensed =under the Creative Commons Attribution 4.0
International License (CC BY 4.0).

## Usage

``` r
timeseries_fossil
```

## Format

A `data.frame` with 598 rows and 6 columns.

- clade:

  Time series clade

- source:

  Primary source of the Time series

- stem_age:

  Stem age of clade

- rel_time:

  Geological relative time (in Million years ago relative to present)

- time_ma:

  Geological time in million years since clade stem age

- richness:

  Number of species at given geological time

## Source

Data originally compiled from many primary sources. Organized, curated
by, and downloaded from, Rabosky & Benson (2021).

## Details

Legend:  
anth = Anthozoa (Cnidaria);  
art = Articulata (Crinoidea, Echinodermata);  
biv = Bivalvia (Mollusca);  
bryo = Bryozoa (Lophotrochozoa, Ectoprocta);  
ceph = Cephalopoda (Mollusca);  
chon = Chondrocytes (Chordata);  
crin = Crinoidea (Echinodermata);  
dinosauria = Dinosauria (Chordata);  
ech = Echinoidea (Echinodermata);  
foram = Foraminifera (Retaria);  
gast = Gastropoda (Mollusca);  
graptoloids = Graptolites (Graptolithina);  
ling = Ligulata (Brachiopoda);  
ostr = Ostracoda (Crustacea, Arthropoda);  
tril = Trilobita (Arthropoda).  

## References

Rabosky, D. L., & Benson, R. B. (2021). Ecological and biogeographic
drivers of biodiversity cannot be resolved using clade age-richness
data. Nature Communications, 12(1), 2945.
