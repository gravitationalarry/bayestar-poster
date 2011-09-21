XELATEX = env TEXINPUTS=:$(CURDIR)/../packages/aastex52:$(CURDIR)/../packages/astronat/apj: xelatex -file-line-error -halt-on-error
BIBTEX = env BSTINPUTS=:$(CURDIR)/../packages/astronat/apj: TEXINPUTS=:$(CURDIR)/../packages/aastex52:$(CURDIR)/../packages/astronat/apj: bibtex

poster.pdf: poster.tex title-drawing.pdf spatial.pdf multipole.pdf ../efficiency_distance.pdf ../efficiency_histogram.pdf ../proposal.bib ../telescope.bib ../telescope_list.bib
	$(XELATEX) -no-pdf -draftmode poster
	$(BIBTEX) poster
	$(XELATEX) -no-pdf -draftmode poster
	$(XELATEX) poster

clean:
	rm -f poster.{pdf,aux,log,xdv}
