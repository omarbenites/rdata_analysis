#Normal distribution

set.seed(3000)
xseq <- seq(-4,4,.01)
densities <- dnorm(xseq, 0,1)
cumulative <- pnorm(xseq, 0, 1)
randomdeviates <- rnorm(1000,0,1)

plot(xseq, densities, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal", cex.axis=.8)
