library(plyr) # ddply(), arrange()
#gDat <- read.delim("../data//gapminderDataFiveYear.txt")
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## function returns estimated intercept and slope from linear regression of
## lifeExp on year
## anticipated input: Gapminder data for one country
jFun <- function(x, shift = 1952) {
  fit <- lm( lifeExp ~ I(year - shift), data = x)
  fit.coef <- coef(fit)
  names(fit.coef) <- c("intercept","slope")
  return(fit.coef)
}

gCoef <- ddply(gDat, ~ country + continent, jFun)

## reorder continent factor levels to reflect rate of life expectancy gains
## (slowest growth to largest)
gCoef$continent <- with(gCoef, reorder(continent, slope))

## drop Oceania ... too few countries
gCoef <- droplevels(subset(gCoef, continent != "Oceania"))

str(gCoef)
head(gCoef)

## store in plain text
#write.table(gCoef, "../results/gCoef.txt",
write.table(gCoef, "gCoef.txt",
            quote = FALSE, row.names = FALSE, sep = "\t")

## store in R-specific binary format
## will preserve factor level order
#saveRDS(gCoef, "../results/gCoef.rds")
saveRDS(gCoef, "gCoef.rds")

sessionInfo()
