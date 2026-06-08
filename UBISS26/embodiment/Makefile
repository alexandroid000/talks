# standard input file and extension
INPUT=talk
INPUT_TYPE=md


OPTIONS=-t beamer --standalone \
--mathjax \
--slide-level=2 \
--metadata-file=metadata-yaml.XXX \
--section-divs

MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

ROOT_DIR=.

.PHONY: all view

all: $(INPUT).pdf

view: $(HTML)
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(HTML)")

%.pdf: %.md
	pandoc $(OPTIONS) $< -o $@

pdf:
	pandoc $(OPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF) example.html
