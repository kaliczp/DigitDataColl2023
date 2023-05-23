meteo  <-  as.data.frame(read_excel(path = "SoE-2021-12.xls", sheet = 2))
meteo  <-  rbind(meteo, as.data.frame(read_excel(path = "SoE-2022-01.xls", sheet = 2)))
meteo  <-  rbind(meteo, as.data.frame(read_excel(path = "SoE-2022-02.xls", sheet = 2)))

## Test the combination
head(meteo[,1]); tail(meteo[,1])

## In one row
meteo  <-  rbind(as.data.frame(read_excel(path = "SoE-2021-12.xls", sheet = 2)),
                 as.data.frame(read_excel(path = "SoE-2022-01.xls", sheet = 2)),
                 as.data.frame(read_excel(path = "SoE-2022-02.xls", sheet = 2))
                 )
plot(meteo[,10], type = "l")

Sys.setenv(TZ = "UTC")
library(xts)
test.xts <- xts(meteo[,10], meteo[,1])
plot(test.xts)

test.xts[1]

head(test.xts)

## Last measurement in 2021
test.xts[31*24*6]
test.xts['2021-12-31 23:50:00']

plot(test.xts['2021-12-31'])
plot(test.xts['2021-12-31 20:00:00/2021-12-31 23:50:00'])
