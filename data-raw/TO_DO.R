# TO DO LIST:
 
# 1) pick package name:

# name will be > EvolVEd <

#run available::available()
#works for "EvolVEd"

#    also check link below for additional naming advices
browseURL("https://r-pkgs.org/Workflow101.html#naming") # - DAN
# EvolVEd

# 2) Functions lacking references:
# - NatSelSim


# 3) create a readme - Jenn created a sckeleton

# 4) TO DO for cran release:
# usethis::use_news_md() ok
# usethis::use_cran_comments() (ok but to again in submition)
# Update (aspirational) install instructions in README
# Check that all exported functions have @returns and @examples
# Check licensing of included files
# Review https://github.com/DavisVaughan/extrachecks 
 
# 5) things to fix in vignettes:
 
# pop gen:
#   WFDriftSim plot
# NatSelSim plot
# explain what this means ## AA Aa aa 
## 20 18 18

#clocks and rocks
# head(cytOxidase) excedes output chunk
# plotProteinSeq "cnidaria" is partially blank. Also should ajust par in function to be able to see the longest clade

#phylos
# plot(whale_phylo,cex = 0.5) ajust par to be able to see text and eliminate exceding white space.
# plotPaintedWhales() plot


#6) consistency check of arguments used across several functions (e.g. nGen, Ngens, NGens). nGen and nSim ok

# 7) create at least 1 testhat check per funcion, even 

#DONE#
#######
