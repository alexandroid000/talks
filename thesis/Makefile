# standard input file and extension
INPUT=talk

OPTIONS= --mathjax=$(HOME)/src/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML \
--incremental \
-t revealjs talk.md \
--section-divs \
--variable transition="none" \
--template=my.reveal \
--extract-media=figs \
--resource-path=$(HOME)/common/figs/:.:./figs/ \
--filter=pandoc-citeproc
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
	pandoc $(OPTIONS) -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

pdf:
	pandoc $(PDFOPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF) example.html
