#Binomial distribution

#to obtation the same sample
set.seed(3000)
#generate x values in the real line
xseq <- seq(-4,4,by = 1)
#find the probability mass function (PDF)
densities <- dbinom(xseq, size = 5, prob = 0.1)
#cumulative density function (CDF)
cumulative <- pbinom(q = xseq, size = 0, prob = 0.1)
#generate a random sample from normal distribution
randomdeviates <- rbinom(n = 10,size = 10, prob = 0.5) 

#Plot Binomial distribution

barplot(height = densities, names.arg = xseq)