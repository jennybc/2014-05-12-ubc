Using Git with RStudio
======================

> Git allows groups of people to work on the same documents (often code)
at the same time, and without stepping on each other's toes. It's a
distributed version control system.

(cribbed from [tryGit][trygit])

Intro to practical version control for scientists
=================================================

These [slides][slides] are courtesy of [Bernhard Konrad][konrad].

[konrad]: https://github.com/BernhardKonrad
[slides]: http://htmlpreview.github.io/?https://github.com/BernhardKonrad/2014-02-22-SFU/blob/gh-pages/BK-slides/git-intro.slides.html

Configure [git][git]
====================

Open the Terminal and run…

```sh
git config --global user.name 'Your Name'
git config --global user.email 'your@email.com'
git config --global credential.helper osxkeychain
```

For more help configuring git, see

+ [GitHub][setupgit]
+ [UBC STAT 540][stat540]

[git]: http://git-scm.com
[setupgit]: https://github.com/jennybc/stat540_2014/blob/master/seminars/seminar92_git.md
[stat540]: https://github.com/jennybc/stat540_2014/blob/master/seminars/seminar92_git.md

RStudio
=======

Create a new project
--------------------

+ Open RStudio
+ Create a new project
  - *File -> New Project -> New Directory -> Empty Project*
  - Check *Create a git repository for this project*

Create and commit a file
------------------------

+ Make your first commit
  - Click the *Git* tab
  - Check *Staged* next to `.gitignore` and `hello.Rproj`
  - Click *Commit*
  - Type a message in *Commit message*
  - Click *Commit*
+ Create a new Rmd file
  - Click *File -> New File -> R Markdown*
  - Edit the file and change the title
  - Save the file
+ Commit the new Rmd file
  - Check *Staged* and click *Commit*

Knit the HTML report
--------------------

+ Knit the Rmd file to generate an HTML report
  - Click *Knit HTML*
+ Commit the generated report
  - Check *Staged* for the *md* and *html* files and the *figures* directory
  - Click *Commit*

Change the plot
---------------

+ Replace the *plot* with *ggplot* or *qplot* and save your changes
+ Commit the change
+ Knit the report
+ Commit all the modified files

Make a change and revert it
---------------------------

+ Make an erroneous change to the file and save it
+ Click *Diff* and then *Revert*
+ The erroneous change has been undone and the previous version restored

Inspect your work
-----------------

+ Make a few more changes and commits
+ Click *History* under the *Git* tab to review your day's work
+ Git has recorded a complete history of your work
+ In the event of impish gnomes introducing errors into your work, you can
  browse through your history, find the gnome to blame, and restore your
  previous good work. Gnomes be damned.

Learn the git command line
--------------------------

Go to [tryGit][tryGit] and learn the git command line!

[tryGit]: http://try.github.io
