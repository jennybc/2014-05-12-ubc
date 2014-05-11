## Suppose we want to take a data set, fit a linear 
## model, and extract an intercept and a slope. Perhaps
## isn't too hard for one data set (couple lines of codes?), 
## but what if we want to repeat this for each 
## country's data in the gapminder dataset and there are
## 142 countries...

## let's see how this can be done on one data set
setwd("C:/Users/Andy/Desktop/2014-05-12-ubc/ubc-r/")
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat) # 'data.frame':  1704 obs. of  6 variables:
fit <- lm( lifeExp ~ year, data=gDat)
fit
coef(fit)
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 



## exercise
## repeat above but only for country "Spain"
## hint: try using the subset argument in lm
## lm( ..., subset=...)
fit <- lm( lifeExp ~ year, data=gDat, subset=country=="Spain")
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 
## we will turn this into a function that takes 
## country as an argument...


## intro
## create a function that adds a pair of numbers
f <- function(x, y){
  z <- x + y
  return(z)
}
f # entire function
body(f) # body of a function
formals(f) # a formal list of arguments
args(f) # a more human readable list of arguments
f(1, 2)
f(10, 1)
f(999, -10)
f( c(1,3,4), 5)
f( c(1,3,4), c(5,7))


## no returns = return nothing
## but still executes what's inside
f <- function(x, y){
  z <- x + y
}
f(1, 2)




## more complicated operations in body
f <- function(x, y){
  z <- x + y
  z <- z * 5
  return(z)
}
## what does it return?
f(1, 3)
f(10, 5)



## exercise
## create a function called fun that calculates 
## bmi from a given wgt (kg) and hgt (m)
## note: bmi = wgt/hgt^2
## note: make sure give the function a good name
hgtwgt_to_bmi(hgt, wgt)
hgtwgt_to_bmi <- function(hgt, wgt){
  bmi <- wgt/hgt^2
  return(bmi)
}
hgtwgt_to_bmi(1.8, 65)
hgtwgt_to_bmi(1.8, c(70,80,90))



# return vector and list
f <- function(x, y){
  z1 <- x + y
  z2 <- x - y
  z3 <- x * y
  return( c(z1, z2, z3))
}
f(1, 2)
f(5, 7)

f <- function(x, y){
  z1 <- x + y
  z2 <- x - y
  z3 <- x * y
  return( list(sum=z1, diff=z2, prod=z3))
}
f(1, 2)
f(5, 7)




## exercise
## go back to our original goal and create a function
## called lmcountry that takes a country's name,
## fit a linear model of lifeExp vs year and a return
## a list of intercept and slope
## hint: try go back and copy and paste stuff inside the function
fit <- lm( lifeExp ~ year, data=gDat, subset=country=="Spain")
fit.coef <- coef(fit)
names(fit.coef) <- c("intercept","slope")
fit.coef 

lmcountry(country.name) ## return a list
lmcountry <- function(country.name){
  fit <- lm( lifeExp ~ year, data=gDat, subset=country==country.name)
  fit.coef <- coef(fit)
  return( list(intercept=fit.coef[1], slope=fit.coef[2]) )
}
lmcountry("Spain")




# default parameters
f <- function(x=9, y){
  z <- x + y 
  return(z)
}
f(y=10)
f(10)
f(17, 18)




# documentation 
hgtwgt_to_bmi # what does this function does?
lmcountry # what does this function does?
# function should always be annotated
hgtwgt_to_bmi <- function(hgt, wgt){
  ## input: hgt (in meter), wgt (in kg)
  ## output: bmi (in kg/m^2)
  bmi <- wgt/hgt^2
  return(bmi)
}
hgtwgt_to_bmi ## ah, now I know what does function is about


## exercise
## create some simple function of your own
## e.g., area of a circle, make annotation
## and then let your neighbour read your function
## to see if they understand what the function 
## is about without reading the code

