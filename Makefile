poster.pdf: poster.tex title-drawing.pdf spatial.pdf multipole.pdf
	xelatex -no-pdf -file-line-error -halt-on-error -draftmode poster
	#$(BIBTEX) poster
	#xelatex -no-pdf draftmode poster
	xelatex -file-line-error -halt-on-error poster

clean:
	rm -f poster.{pdf,aux,log}
