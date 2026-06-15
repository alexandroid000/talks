# standard input file and extension
INPUT=wafr-slides
INPUT_TYPE=md


HTMLOPTIONS=-t dzslides \
	--template my.dzslides \
	--standalone \
        --mathjax \
        --slide-level=2 \
        --section-divs \
	--include-in-header=css/include.css \
    	-A ./scripts.html

PDFOPTIONS=-t beamer

#--mathjax=$(HOME)/src/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML \
#HTMLS := $(patsubst %.md,%.html,talk.md)
MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

PDFOPTIONS=-t beamer

ROOT_DIR=.

.PHONY: all view

all: $(INPUT).html
	firefox $(INPUT).html

example: example.html
#	firefox example.html

view: $(HTML)
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(ONSTAGE)")

%.html: %.md
	pandoc $(HTMLOPTIONS) $< -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

pdf:
	pandoc $(PDFOPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF) example.html
