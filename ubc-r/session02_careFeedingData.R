## import data into a data.frame, explore it

## data import from URL
gdURL <- "http://tiny.cc/gapminder" # party trick
gDat <- read.delim(gdURL)
gDat # not such a great idea ... too big!
str(gDat) # your main function for inspecting an object

## save this file locally from URL above
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat) # read.delim merely a wrapper around read.table
gDat <- read.table("gapminderDataFiveYear.txt",
                   header = TRUE, sep = "\t", quote = "\"")
str(gDat)
head(gDat, n = 10)
tail(gDat)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
head(rownames(gDat))
length(gDat)
str(gDat)
summary(gDat)
## dimnames(gDat) # not run; doesn't work well with so many rows

plot(lifeExp ~ year, gDat)
plot(lifeExp ~ gdpPercap, gDat)
plot(lifeExp ~ log(gdpPercap), gDat)

## back to vetting a recently imported data.frame ...
## data.frame = special case of list
## length of each component (= variable) must be same
## different components (= variables) can be of different flavor
## pull out one variable with $
str(gDat)
summary(gDat)
gDat$lifeExp # dollar sign is how you access 1 variable
summary(gDat$lifeExp)
hist(gDat$lifeExp)

## factors: the R objects you love to hate
## JB's advice: use them! learn how to handle safely
class(gDat$continent)
table(gDat$continent)
summary(gDat$continent)
levels(gDat$continent)
nlevels(gDat$continent)
str(gDat)

## note that the actual *values* are integers, not the character codes,
## e.g. Africa or Europe, that are more user-visible
## never ever ever forget that factors are SPECIAL

## factors are two-faced schizo booby traps waiting for you!
## levels vs. integer codes
## worth the hassle, think about our use of y ~ x | z and y ~ x, ..., groups = z
## will have big payoffs in modelling too

## if you want just some rows and/or just some variables, for inspection or to
## assign as a new object, use subset()
subset(gDat, subset = country == "Cambodia")
subset(gDat, subset = country %in% c("Japan", "Belgium"))
subset(gDat, subset = year == 1952)
subset(gDat, subset = country == "Uruguay", select = c(country, year, lifeExp))

plot(lifeExp ~ year, gDat, subset = country == "Zimbabwe")
plot(lifeExp ~ log(gdpPercap), gDat, subset = year == 2007)

## exercise:
## get data for which life expectancy is less than 32 years
## assign to an object
## how many rows? how many observations per continent?

## good: data = 
## good: subset() and data = ?, subset =

## if data = unavailable, try with()
## if you are lazy at typing, try with()
## attach() is EVIL
mean(gDat$lifeExp)
with(gDat, mean(lifeExp))

with(subset(gDat, country == "Cambodia"),
     cor(lifeExp, gdpPercap))
## much nicer than this:
foo <- gDat[gDat$country == "Cambodia", ]
cor(foo$lifeExp, foo$gdpPercap)

## sometimes a data.frame is just not what you need

## quick tour of other flavors of R objects and some important, sometimes
## surprising features of the language

## vectors are the garden variety R object
x <- 3 * 4
x
is.vector(x)
length(x)
x[1]
x[2]
x[2] <- 10
x
x[5] <- 3
x
x[0]
x <- 1:4
x

## R lurves to do vectorized computations
x^2
## makes lots of loops unnecessary

(y <- 1:3)
(z <- 3:7)
y + z ## recycling happens!
(y  <- 1:10)
(z <- 1:5)
y + z ## you are not always warned!

## atomic vectors MUST hold items of same "flavor"
## R will coerce to a least commong "flavor" if it must
x <- c("cabbage", pi, 0.3, TRUE)
x
class(x)

## lists are more general than vectors
x <- list("cabbage", pi, 0.3, TRUE)
x
class(x)

## different flavors
(x <- -3:3) # numeric (integer)
(x <- rnorm(5)) # numeric (floating point)
(y <- x < 0) # logical
(x <- c("jenny", "bernhard")) # character
gDat$country # factor
## show the flavor table

## more complicated objects

## matrix = generalization of vector
## array = generalization of matrix
## like vector, all must be same flavor
(x <- cbind(month.abb, month.name))
str(x)
(x <- matrix(LETTERS, nrow = 13))
str(x)

## data.frame
(x <- data.frame(month_num = 1:12,
                 month.abb,
                 month.name))
str(x)

## how you can index vectors (and, with some modifications, lists, arrays, etc.)
x <- round(rnorm(8), 2)
set.seed(1) # how to make things *repeatably* random
x <- round(rnorm(8), 2)
x
names(x) <- letters[seq_along(x)]
x
x[4]
x[c(3, 6, 7)]
x[-1]
x < 0
x[x < 0]
which(x < 0)
x[c(TRUE, FALSE)]
x["b"]
x[c("b","f")]

## indexing matrices (or a data.frame, in this case)
(x <- cbind(month.abb, month.name))
x[2, 2]
x[c(6, 9), ]
x[ , 1]

# exercises
# get all rows EXCEPT 4 and 10
# get the column named "month.abb"
# get rows for the even months

# data.frame can be indexed like matrices
# good for programming BUT
# subset() is nicer for interactive analysis
subset(gDat, subset = country == "Cambodia", select = c(country, year, lifeExp))
gDat[217:228, c(1, 2, 5)] # EVIL way to do this
gDat[gDat$country == "Cambodia", c("country", "year", "lifeExp")]

## more indexing data.frames ... inspect what you get back with str()
## accessing one variable
gDat$gdpPercap
## vector-list style ... returns a data.frame
gDat["pop"]
gDat[c("country", "lifeExp")]
## list element style ... returns a vector
gDat[["country"]]

## possible things to add in future
## show use of I() to protect character info from conversion to factor
## show indexing a list with double square brackets
## compare indexing a data.frame w/ single bracket vs
## double vs matrix style

## moved from earlier to here ... not mission critical in this session
## writing a function to peek into a data.frame
sample(x = nrow(gDat), size = 6)
sort(sample(x = nrow(gDat), size = 6))
gDat[sort(sample(x = nrow(gDat), size = 6)), ]
peek <- function(df) df[sort(sample(x = nrow(df), size = 6)), ]
peek
peek(gDat)
## for repeated use, use by other people, etc., one would want to upgrade this
## function! e.g. check if df is a data.frame