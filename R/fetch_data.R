#' Fetch data from the Data Catalogue and return as one object
#'
#' Downloads all data files from CKAN and saves individual
#' tables as `fst` to `inst/data`. One data file can generate multiple tables.
#'
#' @template param-ckanurl
#' @value None
#' @export
#' @family extract
fetch_data <- function(ckan_url = Sys.getenv("CKAN_URL", unset = "https://data.dbca.wa.gov.au")) {
  message("Fetch data")

  # Abort if CKAN is not accessible
  stopifnot(ckan_url != "")
  stopifnot("version" %in% names(ckanr::ckan_version(url = ckan_url)))

  ckanr::ckanr_setup(url = ckan_url, key = ckan_key)

  occ <- ckanr::resource_show("e9fb29ec-a11e-468c-8ad0-af72cf5e89af")$url |>
    readr::read_csv()

  fst::write_fst(occ, here::here("inst/data/occ.fst"))
}

# usethis::use_test("fetch_data")
