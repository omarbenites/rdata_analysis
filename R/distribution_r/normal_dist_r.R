#Normal distribution

#to obtation the same sample
set.seed(3000)
#generate x values in the real line
xseq <- seq(-4,4,.01)
#find the probability density function (PDF)
densities <- dnorm(xseq, 0,1)
#cumulative density function (CDF)
cumulative <- pnorm(xseq, 0, 1)
#generate a random sample from normal distribution
randomdeviates <- rnorm(1000,0,1)

#Case1: u =0 y variance =1
par(mfrow=c(1,3))

plot(xseq, densities, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal 1 (u=0, var=1)", cex.axis=.8)

#Case2: u =0 y variance = 15
densities2 <- dnorm(xseq, 0,1.5)
plot(xseq, densities2, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal 2 (u=0, var=15)", cex.axis=.8)


#Case2: u =0 y variance = 0.0001
densities3 <- dnorm(xseq, 0, 0.1)
plot(xseq, densities3, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal 2 (u=0, var=0.001)", cex.axis=.8)






