test_that("allel is fix", {
  expect_equal(WFDriftSim(N = 5, n.gen = 30, p0=1, plot.type = "none", print.data = TRUE)[,30],1)
})
