x <- 3 * 4
x
## assignments objectName <- value, "gets", use " <- "
## keyboard shortcut: alt or option and minus sign
## surrounding spaces = IDE goodness
## word demarcation in names
a_long_name <- 2.5
a_long_name ## tab completion
jenny_rocks <- 2^3
jennyrocks ## get better at typing
jenyRocks 
## tab completion of built-in functions
seq(1, 10)
## floating help, F1 for full doc, parentheses help
## how R resolves function args, my SOP
1:10
yo <- "hello world" ## quotation mark help
y <- seq(1, 10) # parentheses help
y
(y <- seq(1, 10)) # assign + print
date()

objects()
ls()
rm(y)
rm(list=ls())
ls()
## start/stop, analyses 1, ..., n, bring data in, send results/figs back out
## what is "real"? where does my work "live"?
## workspace is real -------> scripts (and input data) is real
## workspace is real: redoing stuff, mucho typing, become a ninja w/ R history
## don't have to make stark choice, can work on this transition over time
## save / reload workspace demo
## repopulate workspace a bit!
## quit
q()
## verify that .RData was written; notice .Rhistory too
## restart RStudio
ls()
## inspect a pre-existing object
## this method of stopping/restarting R work will break very quickly
## notion of working directory
getwd()
## wd displayed at top of Console pane
foo <- getwd()
setwd("~/tmp")
getwd()
setwd(foo)
getwd()
## showing setwd() just for completeness
## RStudio ways to setwd()
## RStudio projects
## http://www.rstudio.com/ide/docs/using/projects
## make a project for today's workshop
## Projects menu --> Create project.... New Project
## ~/tmp/swc
## check that wd has changed getwd()
getwd()
## end of this file ... next one will presume working in the swc project
