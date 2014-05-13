gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## let's compute the difference between a variable's min and max
## use lifeExp or pop or gdpPercap
## functions to read help on min(), max(), range()

## student's work on this....

## get to know the functions mentioned above
min(gDat$lifeExp)
max(gDat$lifeExp)
range(gDat$lifeExp)

## some solutions we might get
max(gDat$lifeExp) - min(gDat$lifeExp)
with(gDat, max(lifeExp) - min(lifeExp))

range(gDat$lifeExp)[2] - range(gDat$lifeExp)[1]
with(gDat, range(lifeExp)[2] - range(lifeExp)[1])

## let's package that little computation into a function
max_minus_min <- function(x) max(x) - min(x)
max_minus_min(gDat$lifeExp)

## exercise:
## use your function on a sequence of numbers eg 1:5
max_minus_min(1:10)
## use your function on some randomly generated numbers, eg runif(n)
max_minus_min(runif(1000))

## for functions you use alot or distribute, you might want to check the
## argument are valid!
## uncomment this during session
#max_minus_min("hello world")

## the max and min are extreme examples of a quantile
## median = 0.5 quantile
## 1st quartile = 0.25 quantile
## 3rd quartile = 0.75 quantile

## make the function more general:
## take the difference between two quantiles

## first, use the quantile function on lifeExp, pop, or gdpPercap to get the 0.5
## quantile or the 0.25 and 0.75 quantiles

## exercise in reading help and putting it to work
## what I expect students to get:
quantile(gDat$lifeExp)
quantile(gDat$lifeExp, probs = 0.5)
median(gDat$lifeExp)
quantile(gDat$lifeExp, probs = c(0.25, 0.75))

## get the 0.25 and 0.75 AND take the difference between them
## exercise!
the_quantiles <- quantile(gDat$lifeExp, probs = c(0.25, 0.75))
max(the_quantiles) - min(the_quantiles)
IQR(gDat$lifeExp) # hey, we've reinvented IQR

## now package THAT as a function with arguments x and probs
quantile_diff <- function(x, probs) {
  the_quantiles <- quantile(x, probs = probs)
  return(max(the_quantiles) - min(the_quantiles))
}

## uncomment this during session
#quantile_diff(gDat$lifeExp) ## oops! must specify probs argument
quantile_diff(gDat$lifeExp, probs = c(0.25, 0.75))

## can you use our new function to take the difference between the max a min?
quantile_diff(gDat$lifeExp, probs = c(0, 1))
max_minus_min(gDat$lifeExp)
with(gDat, max(lifeExp) - min(lifeExp))

## what if you want probs to default to c(0, 1)?
quantile_diff <- function(x, probs = c(0, 1)) {
  the_quantiles <- quantile(x, probs = probs)
  return(max(the_quantiles) - min(the_quantiles))
}

quantile_diff(gDat$lifeExp) ## now this works!
quantile_diff(gDat$lifeExp, probs = c(0.25, 0.75)) # this still works too

## discuss a "to do" list for this function
## we're not checking that x is numeric
## we're not checking that probs is numeric
## we're not checking that probs is length 2
## the return value has a weird name
## etc etc

## long term
## build these sort of checks into functions
## and write unit tests to verify that functions do the right thing on weird
## data, edge cases, etc.

## optional, depending on time and interest
## demo of the special `...` argument in R

## read the help on quantil(), esp. argument `names =`
quantile_diff <- function(x, probs = c(0, 1), ...) {
  the_quantiles <- quantile(x, probs = probs, ...)
  return(max(the_quantiles) - min(the_quantiles))
}
quantile_diff(gDat$lifeExp) ## still works!
quantile_diff(gDat$lifeExp, probs = c(0.25, 0.75)) # this still works too
quantile_diff(gDat$lifeExp, names = FALSE) ## allows me to shut off names in
                                           ## quantile()

## direct prep for data aggregation

## let's write a function that takes a data.frame
## like the Gapminder data
## or just the data for one country or continent or ...
## fits a linear model of lifeExp on year
## and returns the estimated intercept and slope

fit <- lm( lifeExp ~ year, data = gDat)
summary(fit)

## what's up with that crazy intercept?
## good time for a figure

library(ggplot2)
ggplot(gDat, aes(x = year, y = lifeExp)) + geom_point()
ggplot(gDat, aes(x = year, y = lifeExp)) + geom_point() +
  geom_smooth(method = "lm")

## intercept = estimate life exp in year 0
## let's re-fit so intercept = est life exp in 1952 = earliest year in dataset
fit <- lm( lifeExp ~ I(year - 1952), data=gDat)
summary(fit) # much better

class(fit) ## read up on `lm` ... learn about coef()
(fit.coef <- coef(fit))
names(fit.coef) <- c("intercept","slope")
fit.coef 

## package that into a function
## input: a data.frame
## output: a numeric vector of length two
##        first element = estimated intercept
##        second element = estimate slope
##        names are "intercept" and "slope"
## GO!

jFun <- function(x) {
  fit <- lm( lifeExp ~ I(year - 1952), data = x)
  fit.coef <- coef(fit)
  names(fit.coef) <- c("intercept","slope")
  return(fit.coef)
}

jFun(gDat)

## depending on time and interest, we could talk about better approaches to the
## "subtract 1952 from the year" problem

## what if we flexibility re: the shift?
## create a formal argument for the shift, but give it default value of 1952
jFun <- function(x, shift = 1952) {
  fit <- lm( lifeExp ~ I(year - shift), data = x)
  fit.coef <- coef(fit)
  names(fit.coef) <- c("intercept","slope")
  return(fit.coef)
}

jFun(gDat)
jFun(gDat, shift = 0) ## can still get this if you really want
jFun(gDat, shift = 2007) ## check against fitted line at 2007

## what if we don't want to hard-wire 1952? another approach
jFun <- function(x, shift = NULL) {
  if(is.null(shift)){
    shift <- min(x$year)
  }
  fit <- lm( lifeExp ~ I(year - shift), data = x)
  fit.coef <- coef(fit)
  names(fit.coef) <- c("intercept","slope")
  return(fit.coef)
}

jFun(gDat)
jFun(gDat, shift = 0)
jFun(gDat, shift = 2007)

## exercise:

## create a subset of the data
## eg just one continent or one country

## plot the lifeExp against year and superpose a line
## use jFun() to get intercept and slope
## sanity check numbers against plot

x <- subset(gDat, continent == "Asia")
jFun(x)
ggplot(x, aes(x = year, y = lifeExp)) +
  geom_point() + geom_smooth(method = "lm")

x <- subset(gDat, country == "Rwanda")
jFun(x)
ggplot(x, aes(x = year, y = lifeExp)) +
  geom_point() + geom_smooth(method = "lm")

