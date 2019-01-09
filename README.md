PROMISE
================
2019-01-09

Duke University Medical Center echo and ecg research database

<!-- README.md is generated from README.Rmd. Please edit that file -->
Project overview
----------------

``` shell
.
├── data
│   └── promise.rda # Promise database
├── DATADIGEST # dataversion and md5 fingerprint
├── datapackager.yml # DatapackageR config file
├── data-raw
│   ├── documentation.R
│   ├── promise.Rmd
│   ├── promise_xml_ecg-GEN.rds
│   └── xml_to_dataframe-GEN.R
├── DESCRIPTION
├── environment.yaml # environment variables
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
│   ├── set_data_path.R
│   └── zzz.R
├── Read-and-delete-me
├── README.md
├── README.Rmd
└── vignettes
    ├── LP-xml_to_dataframe.Rmd
    └── promise.Rmd
```

Disclaimer
----------

Due to the fact that the data of this package contains PHI it's stored securely elsewhere and is not shipped with the package.

To get access to the data contact:

-   Name: Daniel Loewenstein
    -   Role: auth, crea
    -   Email: <loewenstein.daniel@gmail.com>
-   Name: Karin Johansson
    -   Role: auth, crea
    -   Email: <johansson.g.karin@gmail.com>

Installation
------------

Make sure to have either ( [Box drive](https://www.box.com/en-se/resources/downloads/drive), \[ [Windows](https://e3.boxcdn.net/box-installers/desktop/releases/win/Box-x64.msi), [Mac](https://e3.boxcdn.net/box-installers/desktop/releases/mac/Box.pkg) \] ) or [ExpanDrive](https://www.expandrive.com/download-expandrive) installed and setup as to being able to access the shared data via Box.com.

If you haven't already, make sure that the `devtools` package is installed

``` r
install.packages(devtools)
```

Continue by installing promise from github with:

``` r
devtools::install_github("dloewenstein/promise")
```

You can also install promise from Anaconda.org with:

``` shell
conda install -c dloewenstein r-promise
```

First time loading promise you will be prompted to start R with adminrights, this is so R get access rights to create a symbolic link from the securely stored data accessible via Box drive or ExpanDrive to the local library folder.

Continue by running

``` r
library(promise)

# If Box drive or ExpanDrive is installed you will now have a remote location 
# mapped as local folder or drive, provide the search path to function below e.g

set_data_path("C:/Users/yourUserName/Box/promise/promise_v_0.1.1.rda") # Only need to run once
```

You have now setup access to the promise data and are now able to load the data by

``` r
data(promise)
```
