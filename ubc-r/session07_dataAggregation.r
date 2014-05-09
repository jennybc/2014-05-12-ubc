library(ggplot2)

gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## built-in apply() function operates on a MATRIX, not a data.frame
tDat <- with(gDat,
             cbind(cambodia = lifeExp[country == "Cambodia"],
                   canada = lifeExp[country == "Canada"],
                   rwanda = lifeExp[country == "Rwanda"]))
rownames(tDat) <- with(gDat, year[country == "Canada"])
str(tDat)
tDat

apply(tDat, 1, mean)
apply(tDat, 2, median) # note payoff from good dimnames
rowMeans(tDat) # FAST use for big datasets
which.min(tDat[1, ])
apply(tDat, 1, which.min)
colnames(tDat)[apply(tDat, 1, which.min)]
apply(tDat, 2, summary)
apply(tDat, 2, quantile, probs = c(0.25, 0.75))

## exercise
## compute the interquartile range of lifeExp by country
## IQR()

## built-in aggregate() function computes on a vector, split out by an
## associated factor
aggregate(lifeExp ~ continent, gDat, FUN = mean)
aggregate(lifeExp ~ year * continent, gDat, FUN = mean)
aggregate(lifeExp ~ continent, gDat, quantile, probs = c(0.25, 0.75))
aggregate(country ~ continent, gDat, function(x) length(unique(x)))

## exercise
## compute the min and max of gdpPercap by country for 4 countries of your choice

## compute on a data.frame, split out by a factor
## install.packages("plyr", dependencies = TRUE)
library(plyr)

## let's run linear regression of lifeExp on year for individual countries and
## save the estimated intercept and slope

## walk before you run ....
ggplot(subset(gDat, country == "Zimbabwe"),
       aes(x = year, y = lifeExp)) +
  geom_point() + geom_smooth(se = FALSE, method = "lm")

lm(lifeExp ~ year, gDat, subset = country == "Zimbabwe")

(yearMin <- min(gDat$year))
lm(lifeExp ~ I(year - yearMin), gDat, subset = country == "Zimbabwe")
jFit <- lm(lifeExp ~ I(year - yearMin), gDat, subset = country == "Zimbabwe")
coef(jFit)

## package your working protoype code in a function
jFun <- function(z) {
  jCoef <- coef(lm(lifeExp ~ I(year - yearMin), z))
  names(jCoef) <- c("intercept", "slope")
  return(jCoef)
}

## test your function!
jFun(subset(gDat, country == "Zimbabwe"))

## scale up:
## let ddply to handle all the booking keeping, i.e. managing the loop over
## countries
gCoef <- ddply(gDat, ~ country, jFun)
str(gCoef)
tail(gCoef)

## I wish that I also had the continent info
## two ways to get that:

## easiest:
## sort of a trick: add continent to the ddply call
gCoef <- ddply(gDat, ~ country + continent, jFun)
str(gCoef)
tail(gCoef)

## some exploration of slopes
ggplot(gCoef, aes(x = intercept, y = slope)) + geom_point()
ggplot(gCoef, aes(x = intercept, y = slope, color = continent)) + geom_point()
ggplot(gCoef, aes(x = continent, y = slope)) + 
  geom_jitter(position = position_jitter(width = 0.1))

## optional ... not sure this adds enough to merit showing?
leSlopeByCont <-
  ddply(gCoef, ~ continent,
        function(z) c(minSlope = min(z$slope), medSlope = median(z$slope),
                      maxSlope = max(z$slope)))
leSlopeByCont
