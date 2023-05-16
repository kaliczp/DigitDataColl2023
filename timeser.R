## Set timezon
Sys.setenv(TZ = "UTC")
## Install xts package
install.packages("xts")
## load xts
library(xts)
soiltemp.xts <- xts(meteo[,c(10,12,14,16)], meteo[,1])
plot(soiltemp.xts)
