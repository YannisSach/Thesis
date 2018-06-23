.PHONY: FORCE default clean distclean presentation

export TEXINPUTS := .:./Styles//:${TEXINPUTS}
export BSTINPUTS := .:./Styles//:${BSTINPUTS}
export SHELL := /bin/bash

FILE=thesis

default: $(FILE).pdf

greek: $(FILE)_gr.pdf

%.pdf: %.tex FORCE clean
	latexmk -pdf -f -e '$$pdflatex=q/xelatex %O %S/' $<

clean:
	$(RM) *.{dvi,aux,log,toc,lof,lol,lot,dlog,bbl,blg,idx,out,tpt,svn}
	$(RM) *.{nav,snm,vrb,fls,fdb_latexmk} *~ *.bak

distclean: clean
	$(RM) $(FILE).{dvi,ps,pdf}

presentation: 
	cd presentation;\
	xelatex presentation_1.tex
