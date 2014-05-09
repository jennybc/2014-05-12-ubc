library(ggplot2)

gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## create a tiny dataset, reorder country based on life expectancy, test various
## strategies for writing files ... maximum portability vs. retaining factor
## levels
tinyDat <- subset(gDat,
                  country %in% c("Cambodia", "Rwanda", "Poland") &
                    year > 1995)
tinyDat
str(tinyDat)

tinyDat <- droplevels(tinyDat)
str(tinyDat)

ggplot(tinyDat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = country))

aggregate(lifeExp ~ country, tinyDat, mean)

with(tinyDat, reorder(country, lifeExp))

tinyDat$country <- with(tinyDat, reorder(country, -1 * lifeExp))

ggplot(tinyDat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = country))

## write.table() ... read.table()
levels(tinyDat$country)
write.table(tinyDat, "tinyDat.txt",
            quote = FALSE, sep = "\t", row.names = FALSE)
rm(tinyDat)
tinyDat <- read.delim("tinyDat.txt")
levels(tinyDat$country)

tinyDat$country <- with(tinyDat, reorder(country, -1 * lifeExp))

## dput() ... dget()
levels(tinyDat$country)
dput(tinyDat, "tinyDat-DPUT.txt")
rm(tinyDat)
tinyDat <- dget("tinyDat-DPUT.txt")
levels(tinyDat$country)

## saveRDS() ... readRDS()
levels(tinyDat$country)
saveRDS(tinyDat, "tinyDat.rds")
rm(tinyDat)
tinyDat <- readRDS("tinyDat.rds")
levels(tinyDat$country)

## writing figures to file
pdf("tinyDat-plot.pdf")
ggplot(tinyDat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = country))
dev.off()

ggplot(tinyDat, aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = country))
dev.print(pdf, "tinyDat-plot.pdf")

ggsave("tinyDat-plot.pdf")