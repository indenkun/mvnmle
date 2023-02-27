
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mvnmle

<!-- badges: start -->
<!-- badges: end -->

`mvnmle` is to find the Maximum Likelihood (ML) Estimate of the mean
vector and variance-covariance matrix for multivariate normal data with
missing values.

## Installation

You can install the released version of `mvnmle` from CRAN with:

``` r
install.packages("mvnmle")
```

and also, you can install the development version of `mvnmle` like so
from GitHub:

``` r
require("remotes")
remotes::install_github("indenkun/mvnmle")
```

## Note

This `mvnmle` package was taken over from a package maintainer that was
ORPHANED and re-submitted to conform to the current CRAN policy.

The basic code is the same as in the previous 0.1-11.1 versions.

Kevin Gross, the previous package maintainer and author, has given me
permission to change the maintainer.

The specific changes are as follows:

- Changed to generate Rd documentation with Roxygen.
- Function calls from other packages are now called use with `::`.
- Coding style was changed, e.g. inserting spaces before and after `<-`
  and `=`.
- Because I use GitHub for code and bug management, I append these URLs
  to the DESCRIPTION.

The following changes are in response to a request from CRAN:

- Changed DESCRIPTION notation to use `Authors@R` field.
- Added text to always explain acronyms that ML and MLE.
- Added doi and ISBN information to references.

No additional functionality will be added in the future. The goal is to
maintain the package according to CRAN policies with the original code
will work.

## Licence

GPL (\>= 2)
