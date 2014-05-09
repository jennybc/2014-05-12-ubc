---
layout: lesson
root: ../../../
title: R, March 2014 U Washington Software Carpentry Bootcamp, HUB 145, 4001 Stevens Way NE
raw: raw.github.com/swcarpentry/bc/gh-pages
---

[http://tiny.cc/ruw-syllabus](http://tiny.cc/ruw-syllabus) points to this page

[http://tiny.cc/ruw-githubb](http://tiny.cc/ruw-github) points to the Github repository the instructors will use during the bootcamp __<-- this seems to point to the repository that underpins this website; still potentially useful!__

CORRECTION (?): the actual Github repository instructors will work with during the bootcamp: [https://github.com/LJWilliams/UW-R](https://github.com/LJWilliams/UW-R)

[http://tiny.cc/gapminder](http://tiny.cc/gapminder) points to the Gapminder data we'll use

[Etherpad](https://2014-03-17-uw.etherpad.mozilla.org/2) link

[Slides for git intro](http://jennybc.github.io/2014-01-27-miami/lessons/git-slides/git-intro.slides.html#/)

We will write R code together "live" in the sessions, but below I link to written content on most topics, for your future reference.

Session 1.1

  * Basics of R/RStudio
  * Workspace and working directory
  * RStudio projects
  * Working via scripts (vs. direct typing/pasting in Console)
  * Sourcing and compiling an HTML "notebook" from a script
  * See
    - [R basics, workspace and working directory, RStudio projects](http://www.stat.ubc.ca/~jenny/STAT545A/block01_basicsWorkspaceWorkingDirProject.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/block01_basicsWorkspaceWorkingDirProject.rmd)

Session 1.2

  * Care and feeding of R objects
  * See
    - [Basic care and feeding of data in R](http://www.stat.ubc.ca/~jenny/STAT545A/block02_careFeedingData.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/block02_careFeedingData.rmd)
    - [R objects (beyond data.frames) and indexing](http://www.stat.ubc.ca/~jenny/STAT545A/block03_basicObjects.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/block03_basicObjects.rmd)

Session 1.3

  * Version control with Git
  * Local usage of Git; RStudio as a Git client; Git commands in the shell.

Session 1.4

  * Making figures using `ggplot2`.
  * See
    - [http://docs.ggplot2.org/](http://docs.ggplot2.org/current/)
    - [Overview of the R graphics landscape](http://www.stat.ubc.ca/~jenny/STAT545A/block90_baseLatticeGgplot2.html)
    - [Taking control of qualitative colors in `ggplot2`](http://www.stat.ubc.ca/~jenny/STAT545A/block17_colorsGgplot2Qualitative.html)
    - [Head-to-head comparisons of `ggplot2` and `lattice`](http://www.stat.ubc.ca/~jenny/STAT545A/block18_gapminderGgplot2VsLattice.html)
    - [Data Visualization with R & `ggplot2`](http://inundata.org/2013/04/10/a-quick-introduction-to-ggplot2/) by Karthik Ram (first few slides make a good introduction)

Session 2.1

  * File organization.
  * R functions and the debugger.
 

Session 2.2

  * The shell, especially file management.
  * R native equivalents for same operations.
  * Version control with remote/hosted repositories. Github.

Session 2.3

  * Data aggregation with R, including the `plyr` package.
  * See
    - [`plyr` webpage](http://plyr.had.co.nz)
    - [Data aggregation](http://www.stat.ubc.ca/~jenny/STAT545A/block04_dataAggregation.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/block04_dataAggregation.rmd)

Session 2.4

  * Automation and pipelines.
  * File I/O, writing figures to file.
  * Scripts and commands that run scripts in RStudio, R, Make.
  * See
    - [Getting data out of R](http://www.stat.ubc.ca/~jenny/STAT545A/block05_getNumbersOut.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/block05_getNumbersOut.rmd)
    - [Writing figures to file](http://www.stat.ubc.ca/~jenny/STAT545A/topic12_writeFigureToFile.html) -- [source](https://github.com/jennybc/STAT545A/blob/master/topic12_writeFigureToFile.rmd)
    - [An introduction to `Make`](http://kbroman.github.io/minimal_make/) by Karl Broman, aimed at stats / data science types
