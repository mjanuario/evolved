# Birth-death models and deep time

## Learning objectives

1.  The birth-death (BD) model
2.  Deterministic expectations of the birth-death model
3.  Estimation under the simple birth-death
4.  Effects of variation on the net diversification rate
5.  The birth-death model is a stochastic process
6.  Adding in extinction
7.  Age-richness models and empirical richness through time

## Introduction

Today we will work with the main mathematical model used in diversity
dynamics: the birth-death model. The main idea of the model is simple:
at any instant in time, species can (I) split into two, (II) go extinct,
or (III) do nothing. The model can be fully described
(i.e. parameterized) by the rate of speciation (the “births”) and the
rate of extinction (the “deaths”).

``` r
library(evolved)
```

## The birth-death (BD) model

The birth-death model is a simple stochastic process that is widely used
to quantitatively study diversification (speciation and extinction). It
is used in other contexts as well, as in ecology or in physics.

The birth-death model we will use here has two parameters: $S$, the
*rate of speciation* (the rate at which one species will split into two
species), and $E$ the *rate of extinction*. Usually, these rates are
“per capita” (or “per lineage”), meaning that the total rate of
speciation for a clade of N species would be $N \times S$ and
$N \times E$ for extinction.

The compound parameter $S - E$ is known as the net diversification rate:
it is the rate at which new species are produced, minus the rate at
which they go extinct. If $S - E > 0$, the net production of new species
is positive and the clade tends to increase exponentially in diversity
through time. When $S - E < 0$, the clade will lose species through time
on average, meaning the clade will be strongly biased to go extinct.

#### Glossary:

$S =$ speciation rate (per lineage)

$E =$ extinction rate (per lineage)

$S - E = R =$ net diversification rate

$K = \frac{E}{S} =$ relative extinction rate (becomes important later)

**pure-birth model:** a special type of birth-death model where only
speciation happens (i.e., E = 0)

## Deterministic expectations of the BD model

The expected species richness under the birth-death model is:

$$N_{t} = N_{0}*e^{t{(S - E)}}$$

where $N_{0}$ is the starting number of species, $t$ is the elapsed
time, and $N_{t}$ is the number of species at time $t$. This is just a
simple exponential growth model that you’ve seen before (recall the
intro to popgen vignette, where we discussed Malthusian growth), except
now we are dealing with the birth and death rates of *species* and not
individuals.

## Estimation under the simplest BD

Let’s imagine that we are interested in the diversification of mammals,
which currently have around 5500 extant species. Can we estimate how
fast mammals diversified through time?

Assume that we know that the first of all mammals existed $164.9$
million years ago. At this time point, there were $N = 1$ species in
this group. Thus, we initiate a model where $N_{t} = 5500$, $N_{0} = 1$,
and $t = 164.9$. What is our estimate of $R = S - E$?

We can make a simple estimator for the net diversification rate $R$
under the birth-death process just by rearranging equation (1) above. We
start with:

$$N_{t} = N_{0}*e^{Rt}$$

and solve for R, giving:

$$R = \frac{log\left( N_{t} \right) - log\left( N_{0} \right)}{t}$$

## Effects of variation on the net diversification rate

## The birth-death model is a stochastic process

Let’s imagine that the $R$ we’ve computed for mammals in Q3 is in fact
the *true* $R$. What if we replayed the tape of life for mammals many
times, allowing the clade to diversify over and over again (always
starting from only one species). Do you think we would get the exact
same number of species every time?

To explore this, we will simulate evolutionary histories of mammals
under our value of $R$.

Fundamentally, the birth-death process is stochastic. We’ve been
speaking of $S$ and $E$ as rates, but it is more appropriate now to
think of them as relative probabilities – the relative probabilities
that each species alive in the simulation will either split into two or
die, respectively.

Simulating the birth-death process is very easy, but the details involve
some basic probability theory and calculus that go beyond the scope
here. So, we have given you a function that simulates the number of
species in a clade, given a set of parameters.

To simulate a single evolutionary history starting with $N_{0} = 2$
species, for $t = 10$ million years, with $S = 1$ and *no extinction*
(i.e. $E = 0$), we should type:

``` r
simulateBirthDeathRich(t = 10, S = 1, E = 0)
```

    ## [1] 14759

Try it yourself: Simulate a history of mammals using the function
[`simulateBirthDeathRich()`](https://mjanuario.github.io/evolved/reference/simulateBirthDeathRich.md).
Did you get something close to the true value of 5500 species?

## Adding in extinction

In previous exercises, we have been ignoring extinction by setting
$E = 0$. But the fossil record tells us that the extinction rate has
been nearly equal to the speciation rate for much of the history of
mammals. So, let’s assume that E is 99% of the speciation rate, or K =
E/S = 0.99.

## Age-richness models and empirical richness through time

Now, we will apply this method to a real richness curve, and compare our
estimates with actual data. We will use the dataset provided by Rabosky
& Benson (2021).

First we will read in our data.

``` r
data("timeseries_fossil")
```

We can select among many possible clades to run our analysis:

``` r
unique(timeseries_fossil$clade)
```

    ##  [1] "anth"        "art"         "biv"         "bryo"        "ceph"       
    ##  [6] "chon"        "crin"        "ech"         "gast"        "ling"       
    ## [11] "ostr"        "tril"        "foram"       "graptoloids" "dinosauria"

`anth` = Anthozoan corals

`art` = Articulata (an extant subclass of “sea lilies” and “feather
stars” within Echinodermata)

`biv` = Bivalve mollusks

`bryo` = Bryozoans

`ceph` = Cephalopod mollusks

`chon` = Cartilaginous fishes

`crin` = The extinct “sea lilies” and “feather stars”

`ech` = Sea urchins

`gast` = Gastropod mollusks

`ling` = A class of brachiopods

`ostr` = A class of Crustaceans

`tril` = Trilobites

`foram` = Foraminifers

`dinosauria` = Non-avian, extinct dinosaurs

`graptoloids` = An extinct group of colonial animals

What we will do is fit a birth-death model to a clade’s diversification
trajectory, but instead of using the present as the reference point for
$N_{t}$, and calculating the diversity trajectory up to the present day,
we will choose an arbitrary point in the past and use it as a reference
point instead. This will allow us to then project our birth-death model
to the actual present, and see if the model can properly predict how
diversity has changed since our arbitrary reference point in the past.

To do this, we will do the following:

**Step 1:** Choose a dataset.

``` r
# Here we will use dinosaurs:
dino_rich <- timeseries_fossil[timeseries_fossil$clade=="dinosauria",]
head(dino_rich)
```

    ##          clade     source stem_age rel_time time_ma richness
    ## 569 dinosauria Benson2016    251.9    175.9      76      853
    ## 570 dinosauria Benson2016    251.9    170.9      81      878
    ## 571 dinosauria Benson2016    251.9    165.9      86      840
    ## 572 dinosauria Benson2016    251.9    160.9      91      748
    ## 573 dinosauria Benson2016    251.9    155.9      96      748
    ## 574 dinosauria Benson2016    251.9    150.9     101      791

  

**Step 2:** Choose a point in time for which we have data.

``` r
unique(dino_rich$time_ma)
```

    ##  [1]  76  81  86  91  96 101 106 111 116 121 126 131 136 141 146 151 156 161 166
    ## [20] 171 176 181 186 191 196 201 206 211 216 221

``` r
# We will use the early Jurassic, around 201 Mya, as our reference for this analysis
t_obs <- 201

rich_early_J <- dino_rich$richness[dino_rich$time_ma==t_obs] 
# species richness from this time point
rich_early_J
```

    ## [1] 278

``` r
# plotting our data and our point of observation:
plot(x = dino_rich$time_ma,
     y=dino_rich$richness,
     xlim=c(max(dino_rich$time_ma), min(dino_rich$time_ma)),
     xlab = "Millions of years ago", ylab = "Dino species richness")

# connecting the dots:
lines(x = dino_rich$time_ma,
     y=dino_rich$richness)

# highlighting the point we will pick:
points(x=t_obs, y=rich_early_J, col="red", pch=16)
abline(v=t_obs, col="red")
```

![](birthdeath_deeptime_files/figure-html/unnamed-chunk-7-1.png)

**Step 3:** Estimate R using the methods above.

As we saw above, to estimate R, we need to know $N_{t}$, $N_{0}$, and
$t$. Let’s use our arbitrary reference time point, 201 Mya, as the
‘present’, and calculate values for these terms.

``` r
# Richness at the stem age of the dinosaurs:
rich_0 <- 1

# The start age of our clade marks time 0 for diversification:
t0 = dino_rich$stem_age[1]

# Since we now know N_t, N_0, and the elapsed time, calculate R:
R_dino = (log(rich_early_J) - log(1)) / (t0 - t_obs)
R_dino
```

    ## [1] 0.1105623

``` r
# Plot our data and project the richness since the beginning of our time series:
time_from_t0 = t0 - dino_rich$time_ma

projected_rich = rich_0 * exp(R_dino * time_from_t0)

# Finally, we calculate the difference between our projections and the data:
projected_rich-dino_rich$richness
```

    ##  [1]  2.793303e+08  1.607067e+08  9.245907e+07  5.319421e+07  3.060391e+07
    ##  [6]  1.760699e+07  1.012955e+07  5.827550e+06  3.352453e+06  1.928400e+06
    ## [11]  1.109044e+06  6.377082e+05  3.667199e+05  2.107627e+05  1.210567e+05
    ## [16]  6.938300e+04  3.960939e+04  2.265741e+04  1.281673e+04  7.171539e+03
    ## [21]  4.070215e+03  2.327329e+03  1.298801e+03  6.788675e+02  2.542010e+02
    ## [26] -5.684342e-14 -6.205826e+01 -1.179807e+02 -1.630585e+02 -2.045412e+02

``` r
# Plotting the difference between our projections and the data:
plot(x = dino_rich$time_ma,
     y=dino_rich$richness,
     xlim=c(max(dino_rich$time_ma), min(dino_rich$time_ma)),
     )
# Connecting the dots:
lines(x = dino_rich$time_ma,
     y=dino_rich$richness)

# Highlighting our point of observation again:
points(x=t_obs, y=rich_early_J, col="red", pch=16)

# Now, we will add the predicted richness curve based on our estimations:
lines(x = dino_rich$time_ma,
     y=projected_rich, col="red")

#Finally, we plot the differences between our projections and our data using bars:
segments(x0 = dino_rich$time_ma,
         x1 = dino_rich$time_ma,
         y0 = dino_rich$richness,
         y1 = projected_rich,
         col="red")
```

![](birthdeath_deeptime_files/figure-html/unnamed-chunk-8-1.png)

The current axis scale does not allow us to properly visualize the
discrepancy between our prediction and the data. So let’s plot again,
re-scaling the y-axis:

``` r
#we can plot the data again, this time with extra care with the scale of our axes:
plot(x = dino_rich$time_ma,
     y=dino_rich$richness,
     xlim=c(max(dino_rich$time_ma), min(dino_rich$time_ma)),
     
     #we will change the y-axis limits to fit all our calculations:
     ylim=c(
       min(c(dino_rich$richness, projected_rich)), 
       max(c(dino_rich$richness, projected_rich))),
     )

#connecting the dots:
lines(x = dino_rich$time_ma,
     y=dino_rich$richness)

#highlighting our observation point:
points(x=t_obs, y=rich_early_J, col="red", pch=16)

#adding the predictions of the model:
lines(x = dino_rich$time_ma,
     y=projected_rich, col="red")

#Finally, we plot the differences between our projections and our data using bars:
segments(x0 = dino_rich$time_ma,
         x1 = dino_rich$time_ma,
         y0 = dino_rich$richness,
         y1 = projected_rich,
         col="red")
```

![](birthdeath_deeptime_files/figure-html/unnamed-chunk-9-1.png)

What do you think? Does this model fit our data well?

Now, let’s divide the error of our estimates by the actual data to
determine what the scale of our error is, in terms of a percentage.

``` r
perc_error <- (projected_rich - dino_rich$richness)/dino_rich$richness * 100

min(perc_error)
```

    ## [1] -87.03881

``` r
max(perc_error)
```

    ## [1] 32746816

``` r
hist(perc_error, xlab = "Error as a percentage of the data")
```

![](birthdeath_deeptime_files/figure-html/unnamed-chunk-10-1.png)

## Some food for thought:

1.  What do you think of an estimator that can underestimate by 87% or
    can overestimate the data by 32,746,816%?

2.  How many species of dinosaurs does this model predict immediately
    before the asteroid impact (mass extinction) at the K-Pg boundary?

``` r
proj_rich_dinos_KPg <- (R_dino +1)^(dino_rich$stem_age[1]-66)
proj_rich_dinos_KPg
```

    ## [1] 292704971

What do you think of this estimate? Before answering, consider that
current estimates for the total number of species on Earth are fewer
than 10 million species overall.

## References:

Rabosky, D. L., & Benson, R. B. (2021). Ecological and biogeographic
drivers of biodiversity cannot be resolved using clade age-richness
data. Nature communications, 12(1), 1-10.
