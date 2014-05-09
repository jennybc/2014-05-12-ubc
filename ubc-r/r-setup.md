R and RStudio Set Up
========================================================

## R and RStudio

  * Download and install [R, a free software environment for statistical computing and graphics](http://www.r-project.org) from [CRAN](http://cran.rstudio.com), the Comprehensive R Archive Network. It is __highly recommended__ to install a precompiled binary distribution for your operating system -- use the links up at the top of the CRAN page linked to above!

  * Install RStudio's IDE (stands for _integrated development environment_), a powerful user interface for R: <http://www.rstudio.com/ide/download/>

    - RStudio includes a __text editor__, so you do not have to install another stand-alone editor.
    - RStudio includes __an interface to Git and GitHub__. You will still need to install Git (covered elsewhere) but RStudio provides a basic GUI for interacting with Git(Hub).

## Testing testing

  * Do whatever is appropriate for your OS to launch RStudio. You should get a window similar to the screenshot you see [here](http://www.rstudio.com/ide/), but yours will be more boring because you haven't written any code or made any figures yet!

  * Put your cursor in the pane labelled Console, which is where you interact with the live R process. Create a simple object with code like `x <- 2 * 4` (followed by enter or return). Then inspect the `x` object by typing `x` followed by enter or return. Obviously you should see the value 8 print to screen. If yes, you are good to go.

  * To make sure that RStudio and Git can talk to each other, please follow the instructions in the corresponding section below.

## Add-on packages

R is an extensible system and many people share useful code they have developed as a _package_ via CRAN and github. To install a package from CRAN, for example the [`plyr`](http://plyr.had.co.nz)  package for data aggregation, here is one way to do it in the R console (there are others).

```
  install.packages("plyr", dependencies = TRUE)
```
By including `dependencies = TRUE`, we are being explicit and extra-careful to install any additional packages the target package, `plyr` in the example above, needs to have around.

Use the above method to install the following packages:

  * `plyr`, [package webpage](http://plyr.had.co.nz)
  * `knitr` [package webpage](http://yihui.name/knitr/)
  * `ggplot2` [package webpage](http://docs.ggplot2.org/)


## Communication between RStudio and Git

Obviously, RStudio can only act as a GUI front-end for Git if Git has been successfully installed and RStudio can find it.

*It would be nice if you did this in advance, but we will also establish this connection in the workshop.*

A basic test for successful installation of Git is to simply type `git` at the shell command line. If you get a complaint about Git not being found it means installation was unsuccessful or that it is not being found, i.e. it is not on your `PATH`.

If Git appears to be installed, launch RStudio. Quit and re-launch RStudio if there's any doubt in your mind about whether you opened RStudio before or after installing Git.

We will create a new dummy "Project" and direct RStudio to put it under version control

  - Do `File > New Project...`. You should see a pop up [like this](http://www.rstudio.com/images/screenshots/rstudio-projects_new.png).
  - Select "New Directory: Start a project in a brand new working directory".
  - Select "Empty Project: Create a new project in an empty directory".
  - Create a new directory for this project anywhere you wish, perhaps with a name like `test`. You can delete this very soon.
  - Do `Tools > Project Options...`. Click on "Git/SVN". Select "Git" in the Version control system dropdown menu. Answer "yes" to the "Confirm New Git Repository" pop up. Answer "yes" to the "Confirm Restart RStudio" pop up.
  - After RStudio re-launches and opens your test Project, the upper left pane should have  "Git" tab, typically along with "Environment", "History", etc. You can see an example [in this screenshot](http://www.rstudio.com/images/screenshots/rstudio-vcs.png).
  - If this has gone well, it looks like Git and RStudio are ready to work together! Feel free to quite RStudio and delete the `test` directory/Project.

In some circumstances, it may be necessary to explicitly tell RStudio where to find the Git executable.

  * Do `RStudio > Preferences` or, alternatively, do `Tools > Global Options...`.
  * Click on "Git/SVN".
  * Fill in the Git executable field correctly. Here is a [screenshot](http://www.molecularecologist.com/wp-content/uploads/2013/11/Screenshot-2013-11-12-09.53.56-Copy1.png) of someone doing this on a Windows machine.
  * If you think Git has been installed but you're not sure where it is, entering `which git` at the shell command line should reveal the path to the Git executable.

## Further resources

The above will get your basic setup ready but here are some links if you are interested in reading a bit further.

  * How to Use RStudio:
    - <http://www.rstudio.com/ide/docs/>
  * More RStudio Support:
    - <https://support.rstudio.com/hc/en-us>
  * Using Version Control with RStudio
    - <http://www.rstudio.com/ide/docs/version_control/overview>
  * R Installation and Administration
    - <http://cran.r-project.org/doc/manuals/R-admin.html>
  * R FAQ:
    - <http://cran.r-project.org/doc/FAQ/R-FAQ.html>
  * More about add-on packages in the R Installation and Administration Manual
    - <http://cran.r-project.org/doc/manuals/R-admin.html#Add_002don-packages>
