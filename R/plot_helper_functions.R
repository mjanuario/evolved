#' @importFrom withr defer
NULL

#plot = animate not working
#old par restoration is resetting par defaut, not old par

#' Plot WFDriftSim output
#'
#' @param p_through_time Matrix with nGens collums and nSim lines
#' @param plot_type String. Options are "static" or "animate"
#'
#' @return A static or animated plot of populations under genetic drift through time
#' @export plotWFDrift
#'
#' @examples
#' store_p = WFDriftSim(Ne = 5, nGens = 10, p0=.2, nSim=5, plot = "none", printData = TRUE)
#' plotWFDrift(store_p, "static")
plotWFDrift = function(p_through_time, plot_type = plot){
  
  if(plot_type == "none")  {
    warning("plotWFDrift argument plot can only be \"static\" or \"animate\"")
    return(NULL)
  }
  nGens = dim(p_through_time)[2]-1
  nSim = dim(p_through_time)[1]
  
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

############################
