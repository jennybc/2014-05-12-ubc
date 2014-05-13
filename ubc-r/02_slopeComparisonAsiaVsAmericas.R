library(ggplot2)

str(gCoef <- readRDS("../results/gCoef.rds"))

## focus life expectancy trends in Asia vs. Americas
hDat <-
  droplevels(subset(gCoef,
                    continent %in% c("Asia", "Americas")))
str(hDat)

## inspect the slopes by continent
p <- ggplot(hDat, aes(x = continent, y = slope)) + geom_point()
print(p)
ggsave("../figs/asia-vs-americas.png", plot = p)

## test for a difference between Asia and Americas
t.test(slope ~ continent, hDat)

sessionInfo()