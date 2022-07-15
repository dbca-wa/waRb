test_that("fetch_data aborts with error if CKAN URL is not set", {
  expect_error(fetch_data(ckan_url = ""))
})

# usethis::use_r("fetch_data")
