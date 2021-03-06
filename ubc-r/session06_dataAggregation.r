gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat) # 'data.frame':  1704 obs. of  6 variables:

## built-in apply() function operates on a MATRIX, not a data.frame
## so we must make one!

## challenge: get the life expectancy data for three countries (eg cambodia,
## canada, rwanda) in a MATRIX, one column per country; make sure column names
## give country and rownames give year

## "brute force"
tDat <- with(gDat,
             cbind(Cambodia = lifeExp[country == "Cambodia"],
                   Canada = lifeExp[country == "Canada"],
                   Rwanda = lifeExp[country == "Rwanda"]))
rownames(tDat) <- with(gDat, year[country == "Canada"])
str(tDat)
tDat

## optional:
## reshape2 -- worth learning for future
library(reshape2)
library(plyr) # to use '.' to quote an expression
tmp <- acast(subset(gDat,
                    subset = country %in% c("Cambodia", "Canada", "Rwanda")),
             year ~ country, value.var = "lifeExp")
## or using acast()-native subsetting:
acast(gDat, subset = . (country %in% c("Cambodia", "Canada", "Rwanda")),
      year ~ country, value.var = "lifeExp")

## see, we get the same thing!
identical(tDat, tmp)

## now we have the matrix and can demo apply()
apply(tDat, 1, mean)
apply(tDat, 2, median) # note payoff from good dimnames
rowMeans(tDat) # FAST use for big datasets
which.min(tDat[1, ])
apply(tDat, 1, which.min)
colnames(tDat)[apply(tDat, 1, which.min)]
data.frame(tDat, min_country = colnames(tDat)[apply(tDat, 1, which.min)])
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

## let's develop a few more challenges on the fly

## compute on a data.frame, split out by a factor
## install.packages("plyr", dependencies = TRUE)
library(plyr)

## let's run linear regression of lifeExp on year for individual countries and
## save the estimated intercept and slope

## hey! we already wrote this function!

## walk before you run .... and make a plot first!
library(ggplot2)
ggplot(subset(gDat, country == "Zimbabwe"),
       aes(x = year, y = lifeExp)) +
  geom_point() + geom_smooth(se = FALSE, method = "lm")

lm(lifeExp ~ year, gDat, subset = country == "Zimbabwe")
lm(lifeExp ~ I(year - 1952), gDat, subset = country == "Zimbabwe")

## copy and paste function from previous session
jFun <- function(x, shift = 1952) {
  fit <- lm( lifeExp ~ I(year - shift), data = x)
  fit.coef <- coef(fit)
  names(fit.coef) <- c("intercept","slope")
  return(fit.coef)
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

## easiest:
## sort of a trick: add continent to the ddply call
gCoef <- ddply(gDat, ~ country + continent, jFun)
str(gCoef)
tail(gCoef)

## optional:
## some exploration of slopes
ggplot(gCoef, aes(x = intercept, y = slope)) + geom_point()
ggplot(gCoef, aes(x = intercept, y = slope, color = continent)) + geom_point()
ggplot(gCoef, aes(x = continent, y = slope)) + 
  geom_jitter(position = position_jitter(width = 0.1))

## data aggregation activities to leave many file behind as fodder for shell
## session

d_ply(gDat, ~ country, function(z) {
  the_country <- z$country[1]
  the_continent <- z$continent[1]
  
  the_filename <- paste0(the_continent, "_", the_country, ".tsv")
  write.table(z, file = the_filename,
              quote = FALSE, sep = "\t", row.names = FALSE)
  
  the_filename <- paste0(the_continent, "_", the_country, ".png")
  ggplot(z, aes(x = year, y = lifeExp)) +
    geom_point() + geom_smooth(se = FALSE, method = "lm") +
    ggtitle(the_country)
  ggsave(the_filename)
})

file.remove(Sys.glob(paste0(unique(with(gDat,
                                        paste0(continent, "_",
                                               country))),".*")))
