test_that("fixed allel", {
  expect_equal(OneGenHWSim(p=1)[,1], rep(50, 100))
})
