XELATEX = env TEXINPUTS=:$(CURDIR)/astronat/apj: xelatex -file-line-error -halt-on-error
BIBTEX = env BSTINPUTS=:$(CURDIR)/astronat/apj: TEXINPUTS=:$(CURDIR)/astronat/apj: bibtex

poster.pdf: poster.tex title-drawing.pdf spatial.pdf multipole.pdf ../bayestar-paper/efficiency_distance.pdf ../bayestar-paper/efficiency_histogram.pdf bib/proposal.bib bib/telescope.bib bib/telescope_list.bib smile.pdf ligo.pdf ligosmile.pdf example-no-interference.pdf doi doi.png
	$(XELATEX) -no-pdf poster
	$(BIBTEX) poster
	$(XELATEX) -no-pdf poster
	$(XELATEX) poster

doi.png: doi
	qrencode -m 0 -s 36 -l H -o $@ `cat $^`

clean:
	rm -f poster.{pdf,aux,log,xdv,bbl,blg} doi.png
