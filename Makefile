XELATEX = env TEXINPUTS=:$(CURDIR)/../packages:$(CURDIR)/../packages/aastex52:$(CURDIR)/../packages/astronat/apj: xelatex -file-line-error -halt-on-error
BIBTEX = env BSTINPUTS=:$(CURDIR)/../packages:$(CURDIR)/../packages/astronat/apj: TEXINPUTS=:$(CURDIR)/../packages/aastex52:$(CURDIR)/../packages/astronat/apj: bibtex

poster.pdf: poster.tex title-drawing.pdf spatial.pdf multipole.pdf ../bayestar-paper/efficiency_distance.pdf ../bayestar-paper/efficiency_histogram.pdf ../bayestar-paper/proposal.bib ../bayestar-paper/telescope.bib ../bayestar-paper/telescope_list.bib smile.pdf ligo.pdf ligosmile.pdf example-no-interference.pdf doi doi.png
	$(XELATEX) -no-pdf poster
	$(BIBTEX) poster
	$(XELATEX) -no-pdf poster
	$(XELATEX) poster

doi.png: doi
	qrencode -m 0 -s 36 -l H -o $@ `cat $^`

clean:
	rm -f poster.{pdf,aux,log,xdv,bbl,blg} doi.png
