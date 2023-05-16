library(xts)
library(readxl)
Sys.setlocale("LC_ALL", "C")

filenames <- dir(pattern = "SoE")
meteo  <-  as.data.frame(read_excel(path = filenames[1], sheet = 2))
meteonames <- names(meteo)
meteo2  <-  data.frame(read_excel(path = filenames[2], sheet = 2))
names(meteo2) <- meteonames
meteo3  <-  data.frame(read_excel(path = filenames[3], sheet = 2))
names(meteo3) <- meteonames
meteoful <- rbind(meteo, meteo2, meteo3)

soiltemp.xts <- xts(meteoful[,c(10,12,14,16)], meteoful[,1])

plot(soiltemp.xts)
