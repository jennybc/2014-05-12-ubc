all: session03_git.html session06_Rfunctions.html session2.4_github.html

%.html: %.md
	Rscript -e 'markdown::markdownToHTML("$<", "$@")'
