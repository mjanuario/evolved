#TO DO LIST:

# 1) make a description for the package
# 2) pick package name and run available::available()
#    also check link below for additional naming advices
browseURL("https://r-pkgs.org/Workflow101.html#naming")
# we chose evoled as a possible name
# 3) insert input check in all functions. 
#In WFDriftSim line 102 throws an error.
# 4) coment better function NatSel
# 5) restore old par() on exit of functions that plot.
#### Check with_par() and on.exit() function for this
# Use pkg::func instead of importFrom

#######
#DONE#
#######


####### future features
# paisagem adaptativa https://curso-genevol.shinyapps.io/superficie-adaptativa/
# aminoacid aligment graphic. eg: https://www.researchgate.net/publication/335267481/figure/fig1/AS:793957495734277@1566305626899/Multiple-sequence-alignment-of-the-conserved-Dof-domains-of-24-DzDofs-A-Sequence.jpg