## Visualizing Residuals ---------------------------------------------------
library(magrittr)
library(ggplot2)
library(ggExtra)
library(dplyr)
library(tidyr)

#New library (broom)
library(broom)


## Conventional Way 

datos <- readRDS("data/yacon_caj.rds")
summary(datos)

## Fitting a linear model

fit <- lm(fructose ~ glucose, data = datos)  # Fit the model
par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(fit)  # Plot the model information
summary(fit)


##General Approach

#The general approach behind each of the examples that we’ll cover below is to:
  
#1) Fit a regression model to predict variable (Y).
#2) Obtain the predicted and residual values associated with each observation on (Y).
#3) Plot the actual and predicted values of (Y) so that they are distinguishable, but connected.
#4) Use the residuals to make an aesthetic adjustment (e.g. 
#   red colour when residual in very high) to highlight points which are poorly predicted by the model.


### Step 0: Descriptive Statistics
summary(datos)
### Stastitical Designs Description: 
## Desing: Randomized Complete Block Design
## Rep: 3
## Genotypes: 8
## Factor: 1


#Plot Histogram
gluco_hist <- ggplot(datos, aes(x = glucose)) +
  geom_density()

fructo_hist <- ggplot(datos, aes(x = fructose)) +
  geom_density()


##Plot an scatter plot
yacon_scatter <- ggplot2::ggplot(datos, aes(glucose, fructose)) + geom_point()

## Plot an scatter plot with histogram
yacon_hscatter <- ggExtra::ggMarginal(yacon_scatter, type = "histogram")

## Plot and scatter plot and marginal chart 
yacon_mscatter <- ggMarginal(yacon_scatter)

 ### Step 1: Adjust the model

# First we will adjust our model: 
  
fit <- lm(fructose ~ glucose, data = datos)

## Step 2: obtain residual and predicted values from fit function

## Re-assign the data to keep safe our data

datos2 <- datos
datos2$predicted <- predict(fit)
datos2$residuals <- residuals(fit)  

# That's looking good so far


#### Step 3: plot 

# Plotting these values takes a couple of intermediate steps. 
# First, we plot our actual data as follows:

## Plot the actual data
yacon_scatter <- ggplot(datos2, aes(x = glucose, y = fructose)) +  # Set up canvas with outcome variable on y-axis
  geom_point()  # Plot the actual points

##Plot actual data with predicted values
yacon_pred <- ggplot(datos2, aes(x = glucose, y = fructose)) +
  geom_point() +
  geom_point(aes(y = predicted), shape = 1)  # Add the predicted values

## Plot actual data and predicted values, showing the distance

yacon_pred <- ggplot(datos2, aes(x = glucose, y = fructose)) +
  geom_segment(aes(xend = glucose, yend = predicted)) + #Add the distance using lines 
  geom_point() +
  geom_point(aes(y = predicted), shape = 1)  # Add the predicted values

#### Step 4: Add Linear Regresion Line and alpha(to reduce the width of 

### Add yacon_pred final adjustments:
### - Clean up the overall look
### - 

yacon_pred <- ggplot(datos2, aes(x = glucose, y = fructose)) +
  geom_smooth(method = "lm", se = FALSE, color =  "lightgrey") +
  geom_segment(aes(xend = glucose, yend = predicted), alpha = .2) + #Add the distance using lines 
  geom_point() +
  geom_point(aes(y = predicted), shape = 1) + # Add the predicted values
  theme_bw()  # Add theme for cleaner look


yacon_pred <- ggplot(datos2, aes(x = glucose, y = fructose)) +
  geom_smooth(method = "lm", se = FALSE, color =  "lightgrey") +
  geom_segment(aes(xend = glucose, yend = predicted), alpha = .2) + #Add the distance using lines 
  geom_point() +
  geom_point(aes(y = predicted), shape = 1) + # Add the predicted values
  theme_bw()  # Add theme for cleaner look



