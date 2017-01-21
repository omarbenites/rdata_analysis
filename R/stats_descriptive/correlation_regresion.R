# El material aplicado aqui esta basado en el libro de Stastitcs 4th. Edition
# de David Freedman, Robert Pisani and Rogert Purves.

# Correlation and Regresion -----------------------------------------------

library(magrittr)
library(ggplot2)
library(ggExtra)
library(dplyr)
library(tidyr)
library(agricolae)

#New library (broom)
library(broom)

## Conventional Way 
datos <- readRDS("data/yacon_caj.rds")
yacon_f0 <- dplyr::filter(datos, locality == "CAJ" & site == 1, dose=="F0")
yacon_f80 <- dplyr::filter(datos, locality == "CAJ" & site == 1, dose=="F80")
yacon_f150 <- dplyr::filter(datos, locality == "CAJ" & site == 1, dose=="F80")

# We want to observe what is the correlation between fructose and sucrose
# Apply the lm to see the linear model and visualiza the correlation and residuals ---------------------

lm1 <-lm(fructose ~ sucrose, data = yacon_f0) #Fitting the model

# Visualize your data sucrose vs fructose
par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(lm1)
summary(lm1) #check linear model parameters
tidy(lm1)

#Conclusion The residual plots show the there is non-linear asociation between variables for yacon_f0.


# Now we will plot the asociation line plot ------------------------
par(mfrow = c(1, 1))  # Split the plotting panel into a 1 x 1 grid
plot(datos$sucrose,datos$fructose) #scatter plot
abline(lm1) #regresion line

# Built the linear model y = mx + b
# Where m: the slope
# and   b: the intercept

# We use broom package to get regresion model parameters in a handy table
sum_table <- broom::tidy(lm1)
intercept <- sum_table$estimate[1] #b
m <- sum_table$estimate[2] #m the slope

# Calculate the root mean square error
# Use http://stats.stackexchange.com/questions/107643/how-to-get-the-value-of-mean-squared-error-in-a-linear-regression-in-r

rmse <- function(sm) {sqrt(mean(lm1$residuals^2)) }
rmse_val <- rmse(lm1$residuals)

#Calculate the correlation
cor(datos$sucrose,datos$fructose)

# Bonus extra
# Recreate the linear model using summary(lm1) parameters
y <- intercept + m*x




