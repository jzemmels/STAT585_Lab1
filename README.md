# STAT585_Lab1

## Connecting RStudio and Git

Repo: https://github.com/jzemmels/STAT585_Lab1

## Building a Book

Deliverable 1: The last word in Chapter 15 is "pseudo-class"

Deliverable 2: A major issue that we all experienced was the need to download a series of new packages, which halted the knitting process. This made knitting the book together take a long time. One package in particular, the emo package, isn't on CRAN meaning we had to use the devtools package to access it. Joe also had issues using the Rcpp package that we wasn't able to resolve in the time to complete the lab.

## What to do when things don't work?
Deliverable:
I am attempting to knit Hadley Wickham's Advanced R book together and am unable to use the Rcpp functions that he calls in the text. In particular, the following function call doesn't seem to work well:

```{r add}
library(Rcpp)

cppFunction('int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}')
#add works like a regular R function
add
add(1, 2, 3)
```

I attempted to uninstall and re-install the Rcpp package from Rstudio, but this didn't seem to solve the issue. The error that I receive is the following.
"Error in sourceCpp(code=code,env=env,rebuild=rebuild,cacheDir=cacheDir, : Error 1 occurred building shared library. Calls: local ... withVisible -> eval -> eval -> cppFunction -> sourceCpp)"

## US Weather Stations
Deliverable:
```{r}
library(tidyverse)
#Read in stations dataset, specifying column names by their location in the row string:
stations <- read_fwf("./ushcn-v2.5-stations.txt", fwf_cols(countryCode = c(1,2),networkCode = c(3), IDPlaceholders = c(4,5),coopID = c(6,11),latitude = c(13,20), longitude = c(22,30), elevation = c(33,37),state = c(39,40), name = c(42,71),component1 = c(73,78), component2= c(80,85), component3 = c(87,92), UTCOffset = c(94,95)))

#Change elevation and timezone to their correct datatypes:
stations <- stations %>%
  mutate(elevation = as.numeric(elevation)) %>%
  mutate(UTCOffset = as.integer(UTCOffset))

#Plot elevation by lat and long:
ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group)) + 
  geom_point(data = stations, mapping = aes(x = longitude, y = latitude, color = elevation))
```

## More weather data
Deliverable:
  Number of files inside the folder: 1218
  
  Name of file containing Ft. Dodge Coop Observer ID: USH00132999.raw.tavg