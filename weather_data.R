library(tidyverse)

stations <- read_fwf("./ushcn-v2.5-stations.txt",
                     fwf_cols(countryCode = c(1,2),networkCode = c(3,4), IDPlaceholders = c(4,5),coopID = c(6,11),
                              latitude = c(13,20), longitude = c(22,30), elevation = c(33,37),state = c(39,40), name = c(42,71),
                              component1 = c(73,78), component2= c(80,85), component3 = c(87,92), UTCOffset = c(94,95)))

stations <- stations %>%
  mutate(elevation = as.numeric(elevation)) %>%
  mutate(UTCOffset = as.integer(UTCOffset))

#How to unpack the .tar.gz file:
#untar("./ushcn.tavg.latest.raw.tar.gz")

