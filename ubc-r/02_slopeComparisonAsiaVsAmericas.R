## assuming that this file lives in code/ and you want the result in prose/
## and that working directory is prose/

## Rscript -e "knitr::stitch('../code/02_slopeComparisonAsiaVsAmericas.R', template = system.file('misc', 'knitr-template.Rmd', package = 'knitr')"

## Either action will require knitr package
## to install: install.packages("knitr")

library(ggplot2)

## ALERT: the working directory may differ for live execution vs. command line execution vs.
## using RStudio's Compile Notebook.

## If things aren't working, scrutinize the working directory.
## Is it what you think it is?
getwd()

## toggle the comment status of these lines as needed
str(gCoef <- readRDS("gCoef.rds"))
##str(gCoef <- readRDS("../results/gCoef.rds"))

## focus life expectancy trends in Asia vs. Americas
hDat <-
  droplevels(subset(gCoef,
                    continent %in% c("Asia", "Americas")))
str(hDat)

## inspect the slopes by continent
print(ggplot(hDat, aes(x = continent, y = slope)) + geom_point())
dev.print(pdf, "asia-vs-americas.pdf")


## test for a difference between Asia and Americas
t.test(slope ~ continent, hDat)
