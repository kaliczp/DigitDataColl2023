library(xts)
meteo  <-  as.data.frame(read_excel(path = "SoE-2023-01.xls", sheet = 2))
names(meteo) <- names(meteo2)
meteo2  <-  data.frame(read_excel(path = "SoE-2023-02.xls", sheet = 2))
meteo3  <-  data.frame(read_excel(path = "SoE-2023-03.xls", sheet = 2))
meteoful <- rbind(meteo, meteo2, meteo3)

soiltemp.xts <- xts(meteoful[,c(10,12,14,16)], meteoful[,1])

plot(soiltemp.xts)
