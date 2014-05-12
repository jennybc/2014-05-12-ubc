all: session03_git.html

%.html: %.md
	Rscript -e 'markdown::markdownToHTML("$<", "$@")'
