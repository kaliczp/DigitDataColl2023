## Install a package to import xlsx sheet
install.packages("readxl")
## Load package
library(readxl)
## Import data 2nd sheet is the botanical garden
meteo = as.data.frame(read_excel(path = "SoE-2023-02.xls", sheet = 2))
## Show names of variables (columns)
names(meteo)
## First element of the 1st deth of soil temperature (TS1) column
meteo[1,10]
## Plot the 17th column data
plot(meteo[,10])
## Plot with time
plot(meteo[,c(1,10)])
plot(meteo[,1], meteo[,17])
## Depths  5, 10, 20, 50, 100 cm
## data.frame indexing
meteo[c(2000,2001,2002,2003,2004,2005,2006), c(1,10)]
meteo[2000:2006,c(1,10)]
summary(meteo)
summary(meteo[,10])
## Summarize all the temperatures
summary(meteo[,c(10,12,14,16)])
boxplot(meteo[,c(10,12,14,16)])

## All the temperature lines in one plot
plot(meteo[,1], meteo[,10], type = "l", xaxs = "i", lwd = 2, xlab = "", ylab = "Temperature")
lines(meteo[,1], meteo[,12], col = 2, lwd = 2)
lines(meteo[,1], meteo[,14], col = 3, lwd = 2)
lines(meteo[,1], meteo[,16], col = 4, lwd = 2)
legend("bottomright", legend = c("TS1", "TS2", "TS3", "TS4"), col =1:4, lwd = 2)
