# STAT585_Lab1

Repo: https://github.com/jzemmels/STAT585_Lab1

Deliverable 1: The last word in Chapter 15 is "pseudo-class"

Deliverable 2: A major issue that we all experienced was the need to download a series of new packages, which halted the knitting process. This made knitting the book together take a long time. One package in particular, the emo package, isn't on CRAN meaning we had to use the devtools package to access it. Joe also had issues using the Rcpp package that we wasn't able to resolve in the time to complete the lab.

## What to do when things don't work?
I am attempting to knit Hadley Wickham's Advanced R book together and am unable to use the Rcpp functions that he calls in the text. In particular, the following function call doesn't seem to work well:

```{r add}
library(Rcpp)

cppFunction('int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}')
# add works like a regular R function
add
add(1, 2, 3)
```