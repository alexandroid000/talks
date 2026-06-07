# standard input file and extension
INPUT=talk

HTMLOPTIONS= --mathjax \
--incremental \
-t revealjs talk.md \
--section-divs \
--variable transition="none" \
--template=my.reveal \
--extract-media=figs \
--resource-path=$(HOME)/common/figs/:.:./figs/

PDFOPTIONS= --section-divs -t beamer --slide-level=2

MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

ROOT_DIR=.

.PHONY: all view

default: pdf

all: $(INPUT).html
	firefox $(INPUT).html

view: $(HTML)
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(ONSTAGE)")

%.html: %.md
	pandoc $(HTMLOPTIONS) -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

pdf:
	pandoc $(PDFOPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF)
