PROMISE
================
2018-09-22

<!-- README.md is generated from README.Rmd. Please edit that file -->

Project overview
----------------

``` shell
.
├── DATADIGEST
├── datapackager.yml
├── data-raw
│   ├── documentation.R
│   ├── promise.Rmd
│   ├── promise_xml_ecg-GEN.rds
│   └── xml_to_dataframe-GEN.R
├── DESCRIPTION
├── environment.yaml
├── inst
│   ├── doc
│   │   ├── LP-xml_to_dataframe.html
│   │   ├── LP-xml_to_dataframe.Rmd
│   │   ├── promise.html
│   │   └── promise.Rmd
│   └── extdata
│       └── Logfiles
│           ├── processing.log
│           └── promise.html
├── Makefile
├── man
│   ├── promise.Rd
│   └── set_data_path.Rd
├── NAMESPACE
├── NEWS.md
├── promise.Rproj
├── R
│   ├── promise.R
│   └── set_data_path.R
├── Read-and-delete-me
├── README.md
├── README.Rmd
└── vignettes
    ├── LP-xml_to_dataframe.Rmd
    └── promise.Rmd
```

Installation
------------

You can install promise from github with:

``` r
# install.packages("devtools")
devtools::install_github("dloewenstein/promise")
```

You can install promise from Anaconda.org with:

``` shell
conda install -c dloewenstein r-promise
```

Example
-------

In R

``` r
library("promise")
data(promise)
```
