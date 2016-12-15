library(agricolae)
library(dplyr)
library(tidyr)
data("yacon") 

yacon_caj <- dplyr::filter(yacon, locality == "CAJ" & site == 1 & dose == "F0" )
#increasing
yacon_caj <- arrange(yacon_caj, replication)
saveRDS(yacon_caj, "data/yacon_caj.rds")
#decreasing 
#arrange(yacon_caj, -replication)