all: countrySpecificInterceptSlope asiaVsAmericas

countrySpecificInterceptSlope: ../data/gapminderDataFiveYear.txt 01_countrySpecificInterceptSlope.R
	Rscript -e "knitr::stitch_rmd('01_countrySpecificInterceptSlope.R')"; rm 01_countrySpecificInterceptSlope.md

asiaVsAmericas: countrySpecificInterceptSlope 02_slopeComparisonAsiaVsAmericas.R
	Rscript -e "knitr::stitch_rmd('02_slopeComparisonAsiaVsAmericas.R')"; rm 02_slopeComparisonAsiaVsAmericas.md; rm -r figure

clean:
	rm -f ../results/gCoef.* 01_countrySpecificInterceptSlope.html 02_slopeComparisonAsiaVsAmericas.html ../figs/asia-vs-americas.png



