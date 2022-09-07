test_that("fixed allel", {
  expect_equal(OneGenHardyWeinbergSim(p=1)[,1], rep(50, 100))
})
