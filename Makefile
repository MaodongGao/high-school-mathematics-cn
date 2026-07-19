MAIN := main
OUT := output/pdf

.PHONY: editorial-check pdf verify render-review watch clean distclean

editorial-check:
	./scripts/check-editorial-policy.sh
	./scripts/check-source-audits.sh

pdf: editorial-check
	mkdir -p $(OUT) output/aux
	latexmk $(MAIN).tex

verify: pdf
	./scripts/check-build-output.sh

render-review: pdf
	./scripts/render-pdf-review.sh

watch: editorial-check
	mkdir -p $(OUT) output/aux
	latexmk -pvc $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
