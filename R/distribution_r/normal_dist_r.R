#Normal distribution

#to obtation the same sample
set.seed(3000)
#generate x values in the real line
xseq <- seq(-4,4,.01)


################### Case1: u =0 y variance =1 #####################################################

#find the probability density function (PDF)
densities <- dnorm(xseq, 0,1)
#cumulative density function (CDF)
cumulative <- pnorm(xseq, 0, 1)
#generate a random sample from normal distribution
randomdeviates <- rnorm(1000,0,1)

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", 
     type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)

plot(xseq, cumulative, col="darkorange", xlab="", ylab="Cumulative Probability", main="CDF of Standard Normal")

hist(randomdeviates, main="Random draws from Std Normal", cex.axis=.8, xlim=c(-4,4))



################### Case2: u =0 y variance = 15 ##################
par(mfrow=c(1,3), mar=c(3,4,4,2))

#density function
densities2 <- dnorm(xseq, 0,1.5)

#cumulative density function (CDF)
cumulative2 <- pnorm(xseq, 0, 1)

#generate a random sample from normal distribution
randomdeviates2 <- rnorm(1000,0,1)


plot(xseq, densities2, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal 2 (u=0, var=15)", cex.axis=.8)

plot(xseq, cumulative2, col="darkorange", 
     xlab="", ylab="Cumulative Probability", main="CDF of Standard Normal")

hist(randomdeviates2, main="Random draws from Std Normal", 
     cex.axis=.8, xlim=c(-4,4))






################## Case3 : u =0 y variance = 0.0001 ########
par(mfrow=c(1,3), mar=c(3,4,4,2))

#Probability density function
densities3 <- dnorm(xseq, 0, 0.1)

#Cumulative distribution function CDF
cumulative3 <- pnorm(xseq, 0, 1)

#generate a random sample from normal distribution
randomdeviates3 <- rnorm(1000,0,1)


plot(xseq, densities3, col="darkgreen",xlab="", 
     ylab="Density", type="l",lwd=2, cex=2, 
     main="PDF of Standard Normal 2 (u=0, var=0.001)", cex.axis=.8)

plot(xseq, cumulative3, col="darkorange", 
     xlab="", ylab="Cumulative Probability", main="CDF of Standard Normal")

hist(randomdeviates3, main="Random draws from Std Normal", 
     cex.axis=.8, xlim=c(-4,4))

