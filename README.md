PROMISE
================
2019-04-03

# Duke University Medical Center echo and ecg research database

[![Travis-CI Build
Status](https://travis-ci.org/dloewenstein/promise.svg?branch=master)](https://travis-ci.org/dloewenstein/promise)
[![Anaconda-Server
Badge](https://anaconda.org/dloewenstein/r-promise/badges/version.svg)](https://anaconda.org/dloewenstein/r-promise)
[![Anaconda-Server
Badge](https://anaconda.org/dloewenstein/r-promise/badges/latest_release_relative_date.svg)](https://anaconda.org/dloewenstein/r-promise)
[![Anaconda-Server
Badge](https://anaconda.org/dloewenstein/r-promise/badges/platforms.svg)](https://anaconda.org/dloewenstein/r-promise)
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Disclaimer

Due to the fact that the data of this package contains PHI it’s stored
securely elsewhere and is not shipped with the package.

To get access to the data contact:

  - Name: Daniel Loewenstein
      - Role: auth, crea
      - Email: <loewenstein.daniel@gmail.com>
  - Name: Karin Johansson
      - Role: auth
      - Email: <johansson.g.karin@gmail.com>

## Installation

Make sure to have either ( [Box
drive](https://www.box.com/en-se/resources/downloads/drive), \[
[Windows](https://e3.boxcdn.net/box-installers/desktop/releases/win/Box-x64.msi),
[Mac](https://e3.boxcdn.net/box-installers/desktop/releases/mac/Box.pkg)
\] ) or [ExpanDrive](https://www.expandrive.com/download-expandrive)
installed and setup as to being able to access the shared data via
Box.com.

If you haven’t already, make sure that the `devtools` package is
installed

``` r
install.packages("devtools")
```

Continue by installing promise from github with:

``` r
devtools::install_github("dloewenstein/promise")
```

You can also install promise from Anaconda.org with:

``` shell
conda install -c dloewenstein r-promise
```

First time loading promise you will be prompted to start R with
adminrights, this is so R gets access rights to create a symbolic link
from the securely stored data accessible via Box drive or ExpanDrive to
the local library folder.

Continue by running

``` r
library(promise)

# If Box drive or ExpanDrive is installed you will now have a remote location
# mapped as local folder or drive, provide the search path to function below e.g

#For interactive use
set_data_path() #Will be promted with browser Window

#Setting filepath directly
set_data_path("C:/Users/yourUserName/Box/promise/promise_v.0.1.3.rda", .interactive = FALSE) # Only need to run once

#For updating
set_data_path(.update = TRUE)
```

You have now setup access to the promise data and are now able to load
the data by

``` r
data(promiseData)
data(ecg)
```
