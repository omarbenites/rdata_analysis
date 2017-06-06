library(dplyr)
library(ggplot2)
mtcars

ggplot(mtcars, aes(x = factor(am), y = mpg)) + geom_boxplot() + geom_point()
res <- t.test(mpg ~ am, mtcars)



