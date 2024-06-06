all: ddaroch.pdf
	@echo "Building everything"


# Document
# --------
%.pdf: %.tex %.bbl
	@echo "Building PDF"
	xelatex -halt-on-error -interaction=nonstopmode $<
	xelatex -halt-on-error -interaction=nonstopmode $<
	pdfinfo $@

# Bibliography
# ------------
%.bbl: %.bcf
	biber $(subst .bib,,$<)

%.bcf: %.bib
	xelatex -interaction=nonstopmode $(subst .bib,.tex,$<) || true


# Cleanup
# -------
clean_all: clean clean_pdf
	@echo "Cleaning up everything!!"

clean_pdf: clean clean_pdf
	@echo "Cleaning up Documents!!"
	rm --force *.pdf

clean: clean_tex clean_bib
	@echo "Cleaning up all tempfiles"

clean_tex:
	@echo "Cleaning LaTeX tempfiles"
	rm --force *.aux *.log *.out pdfa.xmpi *.run.xml

clean_bib:
	@echo "Cleaning Bibtex tempfiles"
	rm --force *.bcf *.blg *.bbl
