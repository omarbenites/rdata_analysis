#Binomial distribution

#to obtation the same sample
set.seed(3000)
#generate x values in the real line
xseq <- seq(0,4,by = 1)

#### Find the probability mass function (PDF)
#x: number of sucess for each trial
#size: number of trials
#probability of sucess: 0.1
densities <- dbinom(x = xseq, size = 10, prob = 0.1)

#cumulative density function (CDF)
cumulative <- pbinom(q = xseq, size = 10, prob = 0.1)

#generate a random sample from normal distribution
randomdeviates <- rbinom(n = 10,  size = 10, prob = 0.5 ) 

#Plot Binomial distribution

barplot(height = densities, names.arg = xseq)
plot(xseq ,height = cumulative, names.arg = xseq)
plot()