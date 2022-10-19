
#creating functions:
calc_range_through=function(data, tax.lvl="species"){
  
  if(tax.lvl %in% colnames(data)){
    
    aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
    colnames(aux1)=c("taxon", "max_ma")
    
    aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
    colnames(aux2)=c("taxon", "min_ma")
    
    data= merge(aux1, aux2)
  }else{
    stop("data do not have a column with this taxonomic level")
  }
  
  #getting unique bounds:
  unq_bnd=sort(unique(c(data$max_ma, data$min_ma)))
  unq_bnd=unq_bnd[!unq_bnd==0]
  
  res=data.frame()
  for(i in 1:length(unq_bnd)){
    bnd = unq_bnd[i]
    aux=data.frame(bnd, sum(data$max_ma>bnd & data$min_ma<bnd))
    colnames(aux)=c("age", "div")
    
    res=rbind(res, aux)
  }
  return(res)
  
}

calc_std_method=function(data, tax.lvl="species", bin.reso=1){
  
  if(tax.lvl %in% colnames(data)){
    
    aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
    colnames(aux1)=c("taxon", "max_ma")
    
    aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
    colnames(aux2)=c("taxon", "min_ma")
    
    data= merge(aux1, aux2)
  }else{
    stop("data do not have a column with this taxonomic level")
  }
  
  age=seq(from=max(data$max_ma)+bin.reso, to=min(data$min_ma)-bin.reso, by=-bin.reso)
  
  div=vector()
  for(a in age){
    div=c(div, sum(data$max_ma> a & data$min_ma<a))
  }
  
  res=data.frame(age, div)
  res=res[!res$age<0,]
  return(res)
}


plot_raw_occs <- function(data, tax.lvl=NULL, sort=TRUE, use.midpoint=TRUE, return.ranges=FALSE){
  
  title="Occurrence"
  
  if(is.null(tax.lvl) & use.midpoint){
    message(" if tax.lvl is not supplied, argument use.midpoint will be set to FALSE")
    use.midpoint=FALSE
  }
  
  if(!is.null(tax.lvl)){
    if(tax.lvl %in% colnames(data)){
      
      title = tax.lvl
      
      if(use.midpoint){
        
        data$midpoint = (data$max_ma-data$min_ma)/2 + data$min_ma
        
        aux1=aggregate(data$midpoint, by=list(data[,tax.lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$midpoint, by=list(data[,tax.lvl]), min, na.rm=T)
        colnames(aux2)=c("taxon", "min_ma") 
      }else{
        aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
        colnames(aux2)=c("taxon", "min_ma") 
      }
      
      data= merge(aux1, aux2)
    }else{
      stop("data do not have a column with this taxonomic level")
    }
  }
  
  if(sort){
    data <- data[order(data$max_ma, decreasing = T),]
  }
  
  
  if(is.null(tax.lvl)){
    ylab_text="Fossil occurrences"  
  }else{
    ylab_text=paste0(tax.lvl, " temporal ranges")
  }
  
  plot(NA, 
       ylim=c(0, nrow(data)),
       xlim=rev(range(c(data$max_ma, data$min_ma))), frame.plot = F, yaxt="n",
       ylab=ylab_text, xlab="Absolute time (Mya)", main=paste0(title, " level; N = ", nrow(data)," taxa")
  )
  
  segments(x0 = data$max_ma, y0 = 1:nrow(data),
           x1 = data$min_ma, y1 = 1:nrow(data))
  
  if(return.ranges){
    return(data)
  }
}

get_timespans <- function(data, tax.lvl, sort.alphabetically=TRUE){
  
  orig.order <- unique(order(data[,tax.lvl]))
  
    if(tax.lvl %in% colnames(data)){
      
      aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
      colnames(aux1)=c("taxon", "max_ma")
      
      aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
      colnames(aux2)=c("taxon", "min_ma")
      
      data= merge(aux1, aux2)
    }else{
      stop("data do not have a column with this taxonomic level")
    }
  
  if(!sort.alphabetically){
    data <- data[orig.order,]
  }
  
  return(data)
}


