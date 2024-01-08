# TO DO LIST:
 
# 1) pick package name and run available::available()
#    also check link below for additional naming advices
browseURL("https://r-pkgs.org/Workflow101.html#naming") # - DAN
#evolEd

# 7) List of things to do in helps

### ammonoidea_fossil; mammals_fossil; dinos_fossil; trilob_fossil - do we know which coord system is used in lng and lat?
### NatSelSim - explain what are the plot pannels. Add references
### lltPlot - argument description of "rel_time" seams counter intuitive. Default should de TRUE; explain what is plotted, I didn't understand what is the red line.
### plotRawFossilOccs uses calcFossilDivTT machinary? If so, is more explict to use the function directly, and also gives flexibility towards the method. But, if we choose to not change the code, we should fix the return session, as there is no bin_reso argument.
### simulateBirthDeathRich is the used name to function, but we reffer to it as diversity, and the file name is simulateBirthDeath. Could this function be vectorized? Also fix return session.
### general note: check if all plot funtions describe what is plotted

# Functions lacking references:
# - NatSelSim
# - estimateSpeciation
# - countSeqDiffs - no need
# - cytOxidase - OK

# 8) create a readme

# 9) TO DO for cran release:
# usethis::use_news_md()
# usethis::use_cran_comments()
# Update (aspirational) install instructions in README
# Check that all exported functions have @returns and @examples
# Check licensing of included files
# Review https://github.com/DavisVaughan/extrachecks 
 
# 10) delete r_raw

#DONE#
#######

# 1) make a description for the package. pasta principal > description - TWISTER did first version, let see what if dan bring s new input before sending this to "done"
# 3) insert input check in all functions. - TWISTER
# 4) restore old par() on exit of functions that plot. - JENN
# 5) Use pkg::func instead of importFrom - JENN
# 7) check helps
# 8) first draft of paper - TWISTER
#In WFDriftSim line 102 throws an error - TWISTER COULD NOT FIND THE ERROR
# Plotpaintedwhales clades name are a bit big. OK
####### future features
# paisagem adaptativa https://curso-genevol.shinyapps.io/superficie-adaptativa/
# aminoacid aligment graphic. eg: https://www.researchgate.net/publication/335267481/figure/fig1/AS:793957495734277@1566305626899/Multiple-sequence-alignment-of-the-conserved-Dof-domains-of-24-DzDofs-A-Sequence.jpg
# 6) Create functions to proteinSeq(): DONE for head.tail. summary. print. is. BUT WHY MAKE THE read. as. plot. VERSIONS? Dont know even if doing them makes sense - maybe we have to talk? /// I think the main function we have to do is as. the others are not so important.
