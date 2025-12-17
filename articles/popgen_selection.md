# Allele frequency change and selection

## Learning objectives

1.  Breeding effective population size
2.  Mutation-drift equilibrium
3.  Selection
4.  The case of the peppered moths

First, we load our packages:

``` r
library(evolved)
```

## Introduction

We already saw in other popgen vignettes that due to sampling only,
allele frequencies are predicted to change with time in a finite
population – a process we call genetic drift. Still, many things *other
than drift* also change allele frequency. We will work with them today.

## Breeding effective population size

Following Wright (1931), the breeding effective size is calculated as:

$$N_{e} = \frac{4N_{m}N_{f}}{N_{m} + N_{f}}$$

## Mutation-drift equilibrium

## Selection

Using the function
[`NatSelSim()`](https://mjanuario.github.io/evolved/reference/NatSelSim.md)
(from `evolved`) you can explore how selection occurs in a bi-allelic
gene of a diploid organism, given a set of arguments: `p0` is the
initial frequency of the focal allele (labeled $A_{1}$ in the output
plots), `w11` is the fitness of the homozygote for the focal allele, and
`w12` is the heterozygote fitness. The function also requires the number
of generations simulated (`n.gen`).

The question above describes a situation where the dominant allele has
higher fitness. But there are many other possibilities. Tweak the
parameters to explore how selection behaves in different situations.

Now, simulate all those biological scenarios. As we said above, before
running the code, try to come up with expectations about how the system
will behave – this is fundamental for you to build intuition on how
selection works. Try to also vary the initial frequency – why is this
important?

Do your results correspond to your hypotheses?

## The case of the peppered moths

For a long time, melanic individuals of *Biston betularia* (the peppered
moth) were considered to be rare. The first dark morph was deposited in
a museum only in 1811 (Berry, 1990), 53 years after the species was
first described. The first live specimen was caught 37 years after that
by R.S. Edleston in 1848. Only 16 years later, however, Edleston would
say that the dark (a.k.a. *carbonaria*) morph was the most common morph
that he caught in his garden (Berry, 1990).

At the time many hypotheses were drawn to explain this phenomenon (Cook
& Turner, 2020), but a very good hypothesis is that light-colored morphs
were able to camouflage easier in lichenous tree barks (see figure 1),
while the dark morph was easily seen by birds on this background.
However, after the industrial revolution, many of the lichen died,
exposing the darker tree bark underneath and supposedly changing which
morph was most visible to birds.

![Light and carbonaria morphs of the peppered moth on the same lichenous
tree. Image from wikicommons.](2_morphs.png)

Light and carbonaria morphs of the peppered moth on the same lichenous
tree. Image from wikicommons.

Almost a century ago, J. B. S. Haldane performed some calculations on
peppered moth morphs to estimate the selection coefficient ($s$) that
natural populations face (Haldane, 1924). Below, you will use a similar
approach to also estimate $s$, departing from the same data and
assumptions that Haldane used.

Haldane made his estimate using analytic calculations, but we can
approach his results by using a procedure similar to the one below:

1.  Multiply the frequency of each genotype in the population by its
    relative fitness, obtaining the frequency of genotypes that will
    actually reproduce.
2.  Get the new allele frequency *after* selection. Then, assume those
    genotypes mate randomly, which will lead to offspring genotypes that
    follow frequencies expected by HWE and the new allelic frequency
    (the one after selection).
3.  Repeat steps I-II until selection for that characteristic is over
    (i.e., $s = 0$) or there is no genetic variation anymore. Note that
    this is no different than what the function
    [`NatSelSim()`](https://mjanuario.github.io/evolved/reference/NatSelSim.md)
    does “under its hood” (which you can check by typing the function
    name without the parenthesis in the R console).

We need some data to help us calculate our estimates. Drawing from the
literature, Haldane assumed that the **carbonaria morph alelle had a
frequency of roughly 1% in 1848 but that its frequency had increased to
99% after 50 generations**.

Taking Haldane’s assumptions for granted, and using the procedure
explained above, we are going to estimate the intensity of selection
favoring the dark morph. To do that:

**(1)** Assume that the *carbonaria* allele is dominant, and begin with
the allele frequency given above for the *carbonaria* allele before the
industrial revolution.

**(2)** Then, use step I-III above to compute the final frequency of the
allele after 50 generations of selection. After each simulation, your
value of $s$ will be fixed.

**(3)** Do many simulations across a range of relative fitness values
for the light morph allele.

**(4)** Using the final $p$ frequencies from all simulations, you will
generate a “profile plot”, where your x-axis should be the relative
fitness of light morph, and your y-axis should be the final frequency of
the carbonaria allele after 50 generations.

Below, we designed some questions that will guide you through this
procedure.

Since Haldane did his approximation, subsequent research has greatly
improved our knowledge of peppered moth evolution. The fact that we have
few good temporal records from the period in which melanic individuals
were increasing in frequency obscures many details, but several
possibilities were considered for the observed change, from linkage
disequilibrium of melanic alleles to heterozygote advantage (Cook &
Turner, 2020). Still, Haldane’s point is very clear: **selection can be
really strong in natural populations!** However, even though the melanic
morph had very high frequency at the early 20th century, this allele was
*not* fixed. Influx of alleles via mating with migrants from elsewhere
were not considered a good hypothesis at the time but, much later,
DNA-based evidence in favor of that hypothesis was found (Cook & Turner,
2020). Are you surprised that natural populations, even in such “simple”
scenarios, are *that* complex?

## References

Berry, R. J. (1990). Industrial melanism and peppered moths (Biston
betularia (L.)). Biological Journal of the Linnean Society, 39(4),
301-322.

Cook, L. M., & Turner, J. R. (2020). Fifty per cent and all that: what
Haldane actually said. Biological Journal of the Linnean Society,
129(3), 765-771.

Edleston, R. S., 1864. Amptydasis betularia. The Entomologist, 2: 150

Haldane JBS. 1924. A mathematical theory of natural and artificial
selection. Transactions of the Cambridge Philosophical Society 23:
19–41.

Wright, S. (1931). Evolution in Mendelian populations. Genetics, 16(2),
97.
