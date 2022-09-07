test_that("allel is fix", {
  expect_equal(WFDriftSim(N = 5, nGens = 30, p0=1, printData = TRUE)[,30],1)
})
