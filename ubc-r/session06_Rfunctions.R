## repeat several operations with a single command
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat) # 'data.frame':  1704 obs. of  6 variables:
## daily routine to report mean in thousands: $7 X 10^3
mgdp <- mean(gDat$gdpPercap)/1000
mgdp <- sprintf("%.1f",mgdp )
mgdp <- paste0( "$", mgdp, " x 10^3" ) 
mgdp
## what happens if you have 100 files to be summarized?



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
## create a function called reportGPD that takes gdp
## and returns a formatted mean
reportGDP( gDat$gdpPercap) # function not created yet
reportGDP <- function(gdp){
  mgdp <- mean(gdp)/1000
  mgdp <- sprintf("%.1f",mgdp )
  mgdp <- paste0( "$", mgdp, " x 10^3" ) 
  return(mgdp)
}
reportGPD( gDat$gdpPercap)




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
## modify reportGDP function that also calculates and 
## returns the median gpd in the same format as a list
reportGDP <- function(gdp){
  mgdp <- mean(gdp)/1000
  mgdp <- sprintf("%.1f",mgdp )
  mgdp <- paste0( "$", mgdp, " x 10^3" ) 
  
  mdgdp <- median(gdp)/1000
  mdgdp <- sprintf("%.1f",mdgdp )
  mdgdp <- paste0( "$", mdgdp, " x 10^3" )  
  return( list(mean=mgdp, median=mdgdp ) )
}
reportGDP( gDat$gdpPercap)




# default parameters
f <- function(x=9, y){
  z <- x + y 
  return(z)
}
f(y=10)
f(10)
f(17, 18)



# documentation 
reportGDP # what does this function does?
# function should always be annotated
reportGDP <- function(gdp){
  ## input: vector of gdp 
  ## output: return a list of mean and median in thousands
  mgdp <- mean(gdp)/1000
  mgdp <- sprintf("%.1f",mgdp )
  mgdp <- paste0( "$", mgdp, " x 10^3" ) 
  
  mdgdp <- median(gdp)/1000
  mdgdp <- sprintf("%.1f",mdgdp )
  mdgdp <- paste0( "$", mdgdp, " x 10^3" )  
  return( list(mean=mgdp, median=mdgdp ) )
}
reportGDP

