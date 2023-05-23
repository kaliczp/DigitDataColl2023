library(xts)
library(readxl)
Sys.setlocale("LC_ALL", "C")

filenames <- dir(pattern = "SoE")
meteo  <-  as.data.frame(read_excel(path = filenames[1], sheet = 2))
meteonames <- names(meteo)

for(ttindex in 2:length(filenames)) {
    ttmeteo  <-  as.data.frame(read_excel(path = filenames[ttindex], sheet = 2))
    names(ttmeteo) <- meteonames
    meteo <- rbind(meteo, ttmeteo)
}

soiltemp.xts <- xts(meteo[,c(10,12,14,16)], meteo[,1])

plot(soiltemp.xts)
