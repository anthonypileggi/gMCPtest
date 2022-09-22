test_that("permutations works", {
  expect_error(permutations(0))
  expect_equal(nrow(permutations(2)), 4)
  expect_equal(nrow(permutations(3)), 8)
})


