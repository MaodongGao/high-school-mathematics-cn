MAIN := main
OUT := output/pdf

.PHONY: pdf watch clean distclean

pdf:
	mkdir -p $(OUT) output/aux
	latexmk $(MAIN).tex

watch:
	mkdir -p $(OUT) output/aux
	latexmk -pvc $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
