
<!-- README.md is generated from README.Rmd. Please edit that file -->

# waRb

<!-- badges: start -->
<!-- badges: end -->

The goal of waRb is to migrate WAHerb data from the legacy Texpress
database to Specify7.

## Install

You can install the development version of waRb from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dbca-wa/waRb")
```

## Run

The main data migration is a `targets` workflow.

``` r
library(waRb)
## tar_make(...)
```

## Contribute

Every contribution, constructive feedback, or suggestion is welcome!

Send us your ideas and requests as
[issues](https://github.com/dbca-wa/waRb/issues) or submit a pull
request.

Pull requests should eventually pass tests and checks (not introducing
new ERRORs, WARNINGs or NOTEs apart from the “New CRAN package” NOTE):

``` r
styler::style_pkg()
spelling::spell_check_package()
spelling::update_wordlist()

# Code and docs tested, working, committed
usethis::use_version(which="patch")
usethis::use_version(which="minor")
usethis::use_version(which="major")
usethis::edit_file("NEWS.md")

# Document to load new package version. Git commit, tag, and push.
devtools::document()
v <- packageVersion("waRb")
system(glue::glue("git tag -a v{v} -m 'v{v}' && git push && git push --tags"))
```
