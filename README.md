
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

Accessing and writing back files from CKAN requires to be in the DBCA
intranet and to have the following variables defined in your
`~/.Renviron`. The CKAN API key is accessible to logged in users on
their profile page.

``` r
CKAN_URL="https://data.dbca.wa.gov.au"
CKAN_API_KEY="..."
```

Open the `~/.Renviron`:

``` r
usethis::edit_r_environ()
```

The main data migration is a `targets` workflow.

``` r
library(waRb)
## tar_make(...)

# Download data from CKAN to local fst snapshots
fetch_data() 

# Load local fst snapshots into memory
resume_data()

# Inspect data, generate QA reports as Rmd
# Transform data into target format
# Upload data into Specify7 API
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
