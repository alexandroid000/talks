# standard input file and extension
INPUT=talk
INPUT_TYPE=md


OPTIONS=-t dzslides --template my.dzslides --standalone \
--mathjax=$(HOME)/src/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML \
--include-in-header=header.txt  --include-in-header=css/include.css
#--mathjax \
#HTMLS := $(patsubst %.md,%.html,talk.md)
MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

PDFOPTIONS=-t beamer --pdf-engine=xelatex

ROOT_DIR=.

.PHONY: all view

all: $(INPUT).html
	firefox $(INPUT).html

example: example.html
	firefox example.html

view: $(HTML)
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(ONSTAGE)")

%.html: %.md
	pandoc $(OPTIONS) $< -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

pdf:
	pandoc $(PDFOPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF) example.html
