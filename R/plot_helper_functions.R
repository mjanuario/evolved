#' @importFrom withr defer
NULL

# Ne = 5; nGens = 20; p0=0.5; nSim=100; plot = "animate"
# p_through_time = WFDriftSim(Ne = Ne, nGens = nGens, p0=p0, nSim=nSim, plot="none", printData = TRUE)
# 

#plot = animate not working
#old par restoration is resetting par defaut, not old par

plotWFDrift = function(p_through_time, plot_type = plot, nGens = nGens, nSim = nSim){
  
  if(plot_type == "none")  {
    warning("plotWFDrift argument plot can only be \"static\" or \"animate\"")
    return(NULL)
  }
  
  time = 2:nGens
  cols=grDevices::rainbow(nSim)
  
  dev.new()
  opar =  par(mar = (c(5, 4, 4, 0) + 0.1))
  defer(par(opar))
  layout(matrix(c(1,2), ncol = 2), widths=c(8, 2))
  
  plot(NA, xlim=c(1,nGens), ylim=c(0,1),
       ylab="Allelic frequency", xlab="Generation",frame.plot=F)
  
   if(plot_type == "animate"){
     
     # setting animation time:
     if(nGens < 20&nSim < 20){
       animation_time = 0.1
     }else{
       animation_time = 0.05
     }

     for(j in time){
         for(i in 1:nSim){
           graphics::segments(x0 = time[(j-1)],x1 = time[j], 
                              y0= p_through_time[i, (j-1)], 
                              y1 = p_through_time[i, j],
                              col=cols[i])
         }
         Sys.sleep(animation_time)  
     }
     Sys.sleep(1)
     par(mar = c(5, 0, 4, 2) + 0.1)
     auxhist = hist(p_through_time[,nGens], breaks = 50, plot = FALSE)
     barplot(auxhist$counts, axes = TRUE, space = 0, horiz=TRUE, xlab= "Counts", ylab=NULL)
     #dev.off()
  } 
  
  if(plot_type=="static"){
    for(i in 1:nSim){
      graphics::lines(x = 0:nGens, y = p_through_time[i,], col=cols[i])
    }
    #hist
    par(mar = c(5, 0, 4, 2) + 0.1)
    auxhist = hist(p_through_time[,nGens], breaks = 50, plot = FALSE)
    barplot(auxhist$counts, axes = TRUE, space = 0, horiz=TRUE, xlab= "Counts", ylab=NULL)
  }
}
