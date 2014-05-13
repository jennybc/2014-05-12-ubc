Outline of Session 08 Pipelines
========================================================

> Companion: slides session08_pipelines (Keynote for me, PDF for others) ...

Consider `01_countrySpecificInterceptSlope.R`. This is an example of a script that could have evolved from the analyses we've been developing interactively. It is meant to run unattended. How does that usually evolve?

Open RStudio, specifically open the Project you're using for this bootcamp. Go into the `pipeline` subdirectory and make it your working directory.

*Clean out the workspace. Restart the R session.*

Open `01_countrySpecificInterceptSlope.R` in the source editor. Step-through the script line-by-line in RStudio. Satisfy yourself that all is well.

*Clean out the workspace. Restart the R session. Manually delete the output files `gCoef.txt` and `gCoef.rds`, which were written to the top-level `results` directory.*

Go back to `01_countrySpecificInterceptSlope.R`. Use RStudio's `Source` button to source the entire file. Satisfy yourself that all is well.

*Clean out the workspace. Restart the R session. Delete the output files `gCoef.txt` and `gCoef.rds`.*

Notice that RStudio showed you exactly how to run an entire script from the R console: call the function `source()` with your script as the input. Do that yourself "manually" in the Console:

```
source('01_countrySpecificInterceptSlope.R')
```

Later -- when we're assembling a pipeline with multiple scripts -- we'll put lines like this in a master R script that runs other scripts. But let's stay focused on this single script for now.

*Clean out the workspace. Restart the R session. Delete the output files `gCoef.txt` and `gCoef.rds`.*

Go to the shell! Make sure you're in the `pipeline` sub-directory of the diretory where this Project! `pwd`, `cd`, and `ls` help you query, change, and list the contents of your working directory.

Now execute the R script from the shell like so (remember tab completion!):

```
Rscript 01_countrySpecificInterceptSlope.R > 01_countrySpecificInterceptSlope.Rout
```

Verify that `gCoef.txt` (open it!) and `gCoef.rds` (don't open it!) were written as expected into `results`.

Open the file `01_countrySpecificInterceptSlope.Rout`. This is a rather ugly way to preserve the stuff you would have seen if you'd been executing the script interactively. This is better than nothing but there is a better way.

*Delete the output files `gCoef.txt` and `gCoef.rds`, in `results`, and `01_countrySpecificInterceptSlope.Rout`.*

Return to RStudio and return to the script `01_countrySpecificInterceptSlope.R` in the source editor.

__STOP: Do you have the `knitr` package installed?__ If not, do this:

```
install.packages("knitr", dependencies = TRUE)
```

Click on RStudio's `Compile Notebook` button, accept the defaults, and click "Compile". A nice looking HTML "report" should appear in a preview window. More importantly, the file `01_countrySpecificInterceptSlope.html` should appear in the `pipeline` directory. Click on it and opt to open it in your browser. Much better than the previous `*.Rout` file!

Verify that `gCoef.txt` and `gCoef.rds` were written into `results`.

*Delete the output files `gCoef.txt`, `gCoef.rds`, and `01_countrySpecificInterceptSlope.html`.*

Let's replicate that from the R console, instead of using a mouse and RStudio's help. Execute this:

```
library(knitr)
stitch_rmd("01_countrySpecificInterceptSlope.R")
```

Verify that `gCoef.txt` and `gCoef.rds` got written as expected. Open the file `01_countrySpecificInterceptSlope.html` in your browser. Sweet!

*Delete the output files `gCoef.txt` and `gCoef.rds`. Delete the report `01_countrySpecificInterceptSlope.html` and an intermediate file that was produced, `01_countrySpecificInterceptSlope.md`.*

Go back to the shell and do this:

```
Rscript -e "knitr::stitch_rmd('01_countrySpecificInterceptSlope.R')"
```

Verify that `gCoef.txt` and `gCoef.rds` and `01_countrySpecificInterceptSlope.html` were created as expected. The script `01_countrySpecificInterce.ptSlope.R` is now ready to be placed into an analytical pipeline

*Delete the output files `gCoef.txt`, `gCoef.rds`, `01_countrySpecificInterceptSlope.md`, and `01_countrySpecificInterceptSlope.html`.*

Imagine the script `01_countrySpecificInterceptSlope.R` is just the first piece of a larger pipeline. You will want to execute all the scripts in the pipeline *en masse*. Let's initialize One R Script To Rule Them All, i.e. a master script that will call the other scripts.

File > New File > R Script. Insert this code, copied from above, and File > Save as `Makefile.r`:

```
library(knitr)
stitch_rmd("01_countrySpecificInterceptSlope.R")
file.remove("01_countrySpecificInterceptSlope.md")
```

Test the new `Makefile.r` for yourself and verify that `01_countrySpecificInterceptSlope.md` is no longer left behind.

*Delete the output files `gCoef.txt` and `gCoef.rds` and the report `01_countrySpecificInterceptSlope.html`.*

Go back to the shell and do this:

```
Rscript Makefile.r
```

Verify that all the usual output files were written.

Let's say we are *really tired* of all this manual tidying we want to "reset" the analysis and re-run it from a clean state.

This is why people like to automate pipelines. At this point, it is better to turn to an old-school Unix tool `Make` for this. You may not have `Make` installed, so feel free to just watch this last piece.

Look at the proper automation script `Makefile` in the `pipeline` directory. This is kind of like `Makefile.r` but much more powerful. You'll notice I have added a second script to the pipeline as well, `02_slopeComparisonAsiaVsAmericas.R`. It takes the estimated intercepts and slopes, does some analysis, and makes a figure.

By requesting `make clean` in the shell, we can hit the reset button and clean out of of the outputs of these two scripts.

```
make clean
```

Verify that all the downstream outputs, in `figs`, `results`, and `pipeline`, have been deleted. So easy.

By requesting `make all` in the shell, we execute the two scripts, in order, if their outputs need updating.

```
make all
```

Verify that all the usual outputs have been created.

Keep experimenting with this.

*This description of `Make` and the `Makefile` is incredibly barebones. Really just for inspiration.*