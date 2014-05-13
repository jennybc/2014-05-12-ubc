all: session03_git.html session06_Rfunctions.html

%.html: %.md
	Rscript -e 'markdown::markdownToHTML("$<", "$@")'
