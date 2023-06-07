library(xts)
library(readxl)
# Sys.setlocale("LC_ALL", "C")

Begin.time <- Sys.time()
filenames <- dir(pattern = "SoE")
meteo  <-  as.data.frame(read_excel(path = filenames[1], sheet = 2))
meteonames <- names(meteo)
## Name manipulation for soil temperature
meteonames[c(10,12,14,16)] <- paste0("TS", 1:4)
meteonames[2] <- "AirTemp"
names(meteo) <- meteonames

for(ttindex in 2:length(filenames)) {
    ttmeteo  <-  as.data.frame(read_excel(path = filenames[ttindex], sheet = 2))
    names(ttmeteo) <- meteonames
    meteo <- rbind(meteo, ttmeteo)
}

soiltemp.xts <- xts(meteo[,c(2,10,12,14,16)], meteo[,1])

plot(soiltemp.xts)

End.time <- Sys.time()
End.time - Begin.time

### Different method
## Function to import
soiltempimport <- function(x) {
    meteo  <-  as.data.frame(read_excel(path = x, sheet = 2))
    names(meteo) <- meteonames
    meteo
}

## Import with lapply function
Begin.time <- Sys.time()
raw.list <- lapply(filenames, soiltempimport)
raw <- do.call(rbind, raw.list)
soiltemp.xts <- xts(raw[,c(2,10,12,14,16)], raw[,1])
plot(soiltemp.xts)
End.time <- Sys.time()
End.time - Begin.time

## Indexing with xts
plot(soiltemp.xts['2023'])

plot(soiltemp.xts['2023-01'])

plot(soiltemp.xts['2023-01-16/2023-01-20'])
addLegend("bottomleft", lwd = 1, bg = "white") # see ?addLegend and ?legend

plot(soiltemp.xts['2023-01-16/2023-01-20',3])
plot(soiltemp.xts['2023-01-16/2023-01-20','TS2'])
