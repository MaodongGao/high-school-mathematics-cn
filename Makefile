MAIN := main
OUT := output/pdf

.PHONY: editorial-check pdf watch clean distclean

editorial-check:
	./scripts/check-editorial-policy.sh

pdf: editorial-check
	mkdir -p $(OUT) output/aux
	latexmk $(MAIN).tex

watch: editorial-check
	mkdir -p $(OUT) output/aux
	latexmk -pvc $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
