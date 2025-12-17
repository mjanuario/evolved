# Simulating one generation of genotypes under Hardy-Weinberg equilibrium

`OneGenHWSim` creates `n.sim` simulations of one generation of genotypes
under Hardy-Weinberg equilibrium for a bi-allelic loci.

## Usage

``` r
OneGenHWSim(n.ind = 50, p = 0.5, n.sim = 100)
```

## Arguments

- n.ind:

  Integer indicating the census size of the simulated populations. If
  decimals are inserted, they will be rounded.

- p:

  Numerical between zero and one that indicates A1's allele frequency.
  A2's allele frequency is assumed to be `1-p`.

- n.sim:

  Number of simulations to be made. If decimals are inserted, they will
  be rounded.

## Value

A `data.frame` containing the number of individuals for each genotype.

## References

Hardy, G. H. (1908). Mendelian proportions in a mixed population.
Science, 28, 49–50.

Weinberg, W. (1908). Uber den Nachweis der Vererbung beim Menschen.
Jahreshefte des Vereins fur vaterlandische Naturkunde in Wurttemberg,
Stuttgart 64:369–382. \[On the demonstration of inheritance in humans\].
Translation by R. A. Jameson printed in D. L. Jameson (Ed.), (1977).
Benchmark papers in genetics, Volume 8: Evolutionary genetics (pp.
115–125). Stroudsburg, PA: Dowden, Hutchinson & Ross.

Mayo, O. (2008). A century of Hardy–Weinberg equilibrium. Twin Research
and Human Genetics, 11(3), 249-256.

## See also

Other microevolution:
[`NatSelSim()`](https://mjanuario.github.io/evolved/reference/NatSelSim.md),
[`WFDriftSim()`](https://mjanuario.github.io/evolved/reference/WFDriftSim.md),
[`plotNatSel()`](https://mjanuario.github.io/evolved/reference/plotNatSel.md),
[`plotWFDrift()`](https://mjanuario.github.io/evolved/reference/plotWFDrift.md)

## Author

Matheus Januario, Dan Rabosky, Jennifer Auler

## Examples

``` r
#using the default values (n.ind = 50, p = 0.5, n.sim = 100):
OneGenHWSim()
#>         A1A1 A1A2 A2A2
#> sim_1     13   24   13
#> sim_2     13   24   13
#> sim_3     10   30   10
#> sim_4     12   26   12
#> sim_5     12   26   12
#> sim_6     13   24   13
#> sim_7     14   22   14
#> sim_8     13   24   13
#> sim_9     12   26   12
#> sim_10     9   32    9
#> sim_11    13   24   13
#> sim_12    14   22   14
#> sim_13    11   28   11
#> sim_14    15   20   15
#> sim_15    10   30   10
#> sim_16    10   30   10
#> sim_17    13   24   13
#> sim_18    14   22   14
#> sim_19    12   26   12
#> sim_20     9   32    9
#> sim_21     9   32    9
#> sim_22    12   26   12
#> sim_23    10   30   10
#> sim_24    10   30   10
#> sim_25    12   26   12
#> sim_26    11   28   11
#> sim_27    12   26   12
#> sim_28    10   30   10
#> sim_29    11   28   11
#> sim_30    13   24   13
#> sim_31    11   28   11
#> sim_32    14   22   14
#> sim_33    13   24   13
#> sim_34     9   32    9
#> sim_35    13   24   13
#> sim_36    13   24   13
#> sim_37    10   30   10
#> sim_38    14   22   14
#> sim_39    11   28   11
#> sim_40    12   26   12
#> sim_41    13   24   13
#> sim_42    14   22   14
#> sim_43    11   28   11
#> sim_44    11   28   11
#> sim_45    15   20   15
#> sim_46    14   22   14
#> sim_47    15   20   15
#> sim_48    13   24   13
#> sim_49    14   22   14
#> sim_50    10   30   10
#> sim_51    13   24   13
#> sim_52    14   22   14
#> sim_53    10   30   10
#> sim_54    13   24   13
#> sim_55    13   24   13
#> sim_56    10   30   10
#> sim_57    13   24   13
#> sim_58     9   32    9
#> sim_59    15   20   15
#> sim_60    12   26   12
#> sim_61     8   34    8
#> sim_62    17   16   17
#> sim_63    14   22   14
#> sim_64    12   26   12
#> sim_65    15   20   15
#> sim_66    15   20   15
#> sim_67    12   26   12
#> sim_68    12   26   12
#> sim_69    11   28   11
#> sim_70    12   26   12
#> sim_71    13   24   13
#> sim_72     9   32    9
#> sim_73    12   26   12
#> sim_74    12   26   12
#> sim_75    11   28   11
#> sim_76    12   26   12
#> sim_77    11   28   11
#> sim_78    12   26   12
#> sim_79    11   28   11
#> sim_80    13   24   13
#> sim_81    14   22   14
#> sim_82    15   20   15
#> sim_83    14   22   14
#> sim_84    10   30   10
#> sim_85    14   22   14
#> sim_86    13   24   13
#> sim_87     6   38    6
#> sim_88    14   22   14
#> sim_89    16   18   16
#> sim_90    12   26   12
#> sim_91    12   26   12
#> sim_92    11   28   11
#> sim_93     9   32    9
#> sim_94    14   22   14
#> sim_95    14   22   14
#> sim_96    10   30   10
#> sim_97    13   24   13
#> sim_98    12   26   12
#> sim_99    14   22   14
#> sim_100   11   28   11

#Simulating with a already fixed allele:
OneGenHWSim(n.ind = 50, p = 1)
#>         A1A1 <NA> <NA>
#> sim_1     50    0    0
#> sim_2     50    0    0
#> sim_3     50    0    0
#> sim_4     50    0    0
#> sim_5     50    0    0
#> sim_6     50    0    0
#> sim_7     50    0    0
#> sim_8     50    0    0
#> sim_9     50    0    0
#> sim_10    50    0    0
#> sim_11    50    0    0
#> sim_12    50    0    0
#> sim_13    50    0    0
#> sim_14    50    0    0
#> sim_15    50    0    0
#> sim_16    50    0    0
#> sim_17    50    0    0
#> sim_18    50    0    0
#> sim_19    50    0    0
#> sim_20    50    0    0
#> sim_21    50    0    0
#> sim_22    50    0    0
#> sim_23    50    0    0
#> sim_24    50    0    0
#> sim_25    50    0    0
#> sim_26    50    0    0
#> sim_27    50    0    0
#> sim_28    50    0    0
#> sim_29    50    0    0
#> sim_30    50    0    0
#> sim_31    50    0    0
#> sim_32    50    0    0
#> sim_33    50    0    0
#> sim_34    50    0    0
#> sim_35    50    0    0
#> sim_36    50    0    0
#> sim_37    50    0    0
#> sim_38    50    0    0
#> sim_39    50    0    0
#> sim_40    50    0    0
#> sim_41    50    0    0
#> sim_42    50    0    0
#> sim_43    50    0    0
#> sim_44    50    0    0
#> sim_45    50    0    0
#> sim_46    50    0    0
#> sim_47    50    0    0
#> sim_48    50    0    0
#> sim_49    50    0    0
#> sim_50    50    0    0
#> sim_51    50    0    0
#> sim_52    50    0    0
#> sim_53    50    0    0
#> sim_54    50    0    0
#> sim_55    50    0    0
#> sim_56    50    0    0
#> sim_57    50    0    0
#> sim_58    50    0    0
#> sim_59    50    0    0
#> sim_60    50    0    0
#> sim_61    50    0    0
#> sim_62    50    0    0
#> sim_63    50    0    0
#> sim_64    50    0    0
#> sim_65    50    0    0
#> sim_66    50    0    0
#> sim_67    50    0    0
#> sim_68    50    0    0
#> sim_69    50    0    0
#> sim_70    50    0    0
#> sim_71    50    0    0
#> sim_72    50    0    0
#> sim_73    50    0    0
#> sim_74    50    0    0
#> sim_75    50    0    0
#> sim_76    50    0    0
#> sim_77    50    0    0
#> sim_78    50    0    0
#> sim_79    50    0    0
#> sim_80    50    0    0
#> sim_81    50    0    0
#> sim_82    50    0    0
#> sim_83    50    0    0
#> sim_84    50    0    0
#> sim_85    50    0    0
#> sim_86    50    0    0
#> sim_87    50    0    0
#> sim_88    50    0    0
#> sim_89    50    0    0
#> sim_90    50    0    0
#> sim_91    50    0    0
#> sim_92    50    0    0
#> sim_93    50    0    0
#> sim_94    50    0    0
#> sim_95    50    0    0
#> sim_96    50    0    0
#> sim_97    50    0    0
#> sim_98    50    0    0
#> sim_99    50    0    0
#> sim_100   50    0    0

# Testing if the simulation works:
A1freq <- .789 #any value could work
n.simul <- 100
simulations <- OneGenHWSim(n.ind = n.simul, n.sim = n.simul, p = A1freq)

#expected:
c(A1freq^2, 2*A1freq*(1-A1freq), (1-A1freq)^2)
#> [1] 0.622521 0.332958 0.044521

#simulated:
apply(X = simulations, MARGIN = 2, FUN = function(x){mean(x)/n.simul})
#>   A1A1   A1A2   A2A2 
#> 0.6212 0.3350 0.0438 
```
