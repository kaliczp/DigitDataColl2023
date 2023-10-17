airtempprec.xts <- xts(meteo[,2:6], meteo[,1])
write.zoo(airtempprec.xts, "rawdata.csv", row.names = F, dec =",")

## Átlagok
## Boreas állomásból napi csapadékösszeg
## napi átlaghőmérséklet
napi <- round(apply.daily(airtempprec.xts[,1], mean),2)
napicsap <- apply.daily(airtempprec.xts[,3], sum)
names(napi)
names(napicsap) <- "Csap"
write.zoo(cbind(napi, napicsap), "dailydat.csv", row.names = F, dec =",")
