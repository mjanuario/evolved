#TO DO LIST:

# 1) make a licencee for the package
# 2) make a description for the package
# 3) pick package name and run available::available()
#    also check link below for additional naming advices
browseURL("https://r-pkgs.org/Workflow101.html#naming")
# we chose evoled as a possible name
# 4) insert input check in all functions. 
#In WFDriftSim line 102 throws an error.
# 5) add histogram at the end of WFDriftSim
# 6) coment better function NatSel
# 7) animate natsel pannels (all, or choose one)
### como animar: abline no p, passa abline branco no p anterior, 
  # volta linha azul
### separar funcões de plot em outro script
# 8) restore old par() on exit of functions that plot.
# Check with_par() and on.exit() function for this

# jennifer's tasks: revert dataframe in ctyOx; 
# add other data-raw to data
# maybe 5
# maybe 7

####### future features
# paisagem adaptativa https://curso-genevol.shinyapps.io/superficie-adaptativa/
# aminoacid aligment graphic. eg: https://www.researchgate.net/publication/335267481/figure/fig1/AS:793957495734277@1566305626899/Multiple-sequence-alignment-of-the-conserved-Dof-domains-of-24-DzDofs-A-Sequence.jpg