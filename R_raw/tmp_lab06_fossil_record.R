



usp <- unique(xx4$species)
mmat <- matrix(NA, nrow=length(usp), ncol=2)


for (ii in 1:length(usp)){
	mmat[ii, 1] <- max(xx4$max_ma[xx4$species == usp[ii]])
	mmat[ii, 2] <- min(xx4$min_ma[xx4$species == usp[ii]])
}

rownames(mmat) <- usp
mmat <- mmat[order(mmat[,1]), ]


plot.new()
plot.window(xlim=c(215, 0), ylim=c(0, 1500))

for (ii in 1:length(usp)){
	lines(x = mmat[ii,], y= c(ii, ii), lwd=0.5)
}


axis(1)









