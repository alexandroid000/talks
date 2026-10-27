# standard input file and extension
INPUT=dars26-slides
INPUT_TYPE=md

HTMLOPTIONS=-t revealjs \
	-V revealjs-url=./reveal.js \
	--standalone \
	--template=template.html \
	--mathjax \
	--section-divs \
	--slide-level=2 \
	-V theme=simple \
	-V transition=none \
	-V width=1920 \
	-V height=1080 \
	-V margin=0.05 \
	--css=css/metropolis.css
#	-V revealjs-url="https://unpkg.com/reveal.js@^5" \
#	--embed-resources \
#        --section-divs \

PDFOPTIONS=-t beamer \
	--slide-level=1 \
	-V aspectratio=169 \
	--section-divs \
	--standalone

MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

PDFOPTIONS=-t beamer

ROOT_DIR=.

.PHONY: all view

all: $(INPUT).html

example: example.html

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
