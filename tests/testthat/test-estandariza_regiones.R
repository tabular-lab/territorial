test_that("multiplication works", {

  some_regions <- c("Aisen", "biobio", "R.M.")
  some_other_regions <- c("Aysén", "Bío-Bío", "Metropolitana")
  standard_names <- c("Aysén del General Carlos Ibañez del Campo", "Biobío", "Metropolitana de Santiago")

  expect_equal(estandariza_regiones(some_regions), standard_names)
  expect_equal(estandariza_regiones(some_other_regions), standard_names)

})
