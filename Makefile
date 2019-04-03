purl=Rscript -e "knitr::purl('$(1)', '$(2)', quiet=TRUE, documentation=0)"

rfiles:=$(patsubst vignettes/LP-%.Rmd,data-raw/%-GEN.R,$(wildcard vignettes/LP-*.Rmd))

all: $(rfiles)

data-raw/%-GEN.R: vignettes/LP-%.Rmd
	$(call purl,$^,$@)

readme: README.Rmd
	Rscript -e 'rmarkdown::render("$<")'
