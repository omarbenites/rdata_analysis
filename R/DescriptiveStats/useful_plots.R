## Plotting means and erros bars---------------------------------------------------
library(magrittr)
library(ggplot2)
#library(ggExtra)
library(dplyr)
library(tidyr)

#New library (broom)
library(broom)


## Conventional Way 

datos <- readRDS("data/yacon_caj.rds")
summary(datos)



# Barplot -----------------------------------------------------------------

# Barplot : Just to show the means. In case you have few observations or records, use it.
# Barplot recomendation: It doesn't work to show variability


#Motivation: 

sum_datos <- group_by(datos, entry)
out <- summarise(sum_datos , mean_drym = mean(dry,na.rm = TRUE), mean_height = mean(height,na.rm = TRUE))  

# Barplot case 1, using diferent colours by genotypes
ggplot(data=out , aes(x=entry, y=mean_height, fill=entry)) +
  geom_bar(stat="identity")

# Barplot case 1, using the same color by genotypes
ggplot(data=out, aes(x=entry, y=mean_height, fill=entry)) + 
  geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") + 
  guides(fill=FALSE) +
  xlab("Genotypes") + ylab("Height (cm)") +
  ggtitle("Average height")



# Line Graph --------------------------------------------------------------

# Description: Sometimes barcharts occupy a huge space.

# Basic line graph

ggplot(data=out, aes(x=entry, y=mean_height, fill=entry, group = 1)) +
  geom_line()+ geom_point()

# Add features to line graph

ggplot(data=out, aes(x=entry, y=mean_height, fill=entry, group = 1)) +
  geom_line()+ geom_point(size=3, shape=21, fill="white") +
  xlab("Genotypes") + ylab("Height (cm)") +
  ggtitle("Average height")












# Dotplot -----------------------------------------------------------------

# Dotplot: An special plot to show variability. In case you have much information, use it.
# Dotplot case I: If an analysis requires visualizing variability, use standard desviation (SD)
# Dotplot case II: If an analysis requires visualizing significant differences, use standart error 
# (SE) (or standart desviation error)




