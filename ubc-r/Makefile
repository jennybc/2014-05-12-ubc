all: index.html session03_git.html

%.html: %.md
	Rscript -e 'markdown::markdownToHTML("$<", "$@")'
