all: \
    	nilles_final_project.pdf

%.pdf: %.md
	pandoc --filter=pandoc-citeproc --from=markdown --to=beamer -o $@ $<
