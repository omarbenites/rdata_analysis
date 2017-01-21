# El material aplicado aqui esta basado en el libro de Stastitcs 4th. Edition
# de David Freedman, Robert Pisani and Rogert Purves.


# Histogramas -------------------------------------------------------------


library(agricolae)
library(dplyr)
library(tidyr)
library(ggplot2)
data("yacon") 

#filter by locality Cajamarca and site 1 and type of dose

yacon_f0 <- dplyr::filter(yacon, locality == "CAJ" & site == 1, dose=="F0")
yacon_f80 <- dplyr::filter(yacon, locality == "CAJ" & site == 1, dose=="F80")
yacon_f150 <- dplyr::filter(yacon, locality == "CAJ" & site == 1, dose=="F80")



# Descriptive Statistics --------------------------------------------------

#datos <- readRDS("data/yacon_caj.rds")

## Histograms

#Que pasa cuando deseamos visualizar una gran cantidad de datos. Para ellos los
#estadisticos usan los graficos llamados histogramas.

#- There is no vertical scales
#- No hay escalas verticales

#- La linea horizontal cubre el rango o longitud de la variable.

#- In a histogram, the areas of the blocks represent percentages
#- En un histogram, las areas de los bloques representan porcentajes.

#- Los pequenos segmentos en cada intervalo, son llamados intervalos de clase.



# Plotting Histograms in R ------------------------------------------------


#In R we can plot using ggplot funcionts, in this case: geom_histogram

hist_yc80 <- ggplot(yacon_f0, aes(height)) +
             geom_histogram()
hist_yc80

#Adjust the bin width, using binwidth argument (bindwidth = 5)

hist_yc80 <- ggplot(yacon_f0, aes(height)) +
              geom_histogram(binwidth = 5)
hist_yc80

#Use break points
hist_yc80 <- ggplot(yacon_f0, aes(height)) +
              geom_histogram(breaks = (2.760:8)*10)
hist_yc80

#Use frequency polygon
hist_yc80 <- ggplot(yacon_f0, aes(height)) +
             geom_freqpoly(binwidth=2.5 )
hist_yc80

## Example where divide the percentage per cm (height of the plant)

hist_yc80 <- ggplot(yacon_f0, aes(height)) + 
             geom_histogram(aes(y = (..count..)/sum(..count..))) 
hist_yc80 


##Interactive Example using highchartr package
library(highcharter)
hchart(yacon_f0$height, color = "#B71C1C", breaks =(2.760:8)*10 , name = "Distribution of Heights of Yacons Plants") %>% 
  hc_title(text = "Height of Yacon")

##Interactive Example using plotly package
library(plotly)
hist_yc80 <- plot_ly(data = yacon_f0, x = yacon_f0$height, type = "histogram")
hist_yc80

##Visualize multiple histograms of height comparired by group of doses, location "cajamarca"
## and site =1

hist_ycaj <- ggplot(yacon_caj_dosis, aes(height, fill = dose)) +
             geom_histogram() +
             facet_wrap(~dose, ncol = 1)
hist_ycaj



  