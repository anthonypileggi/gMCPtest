test_that("generate weights works", {
  G <- matrix(c(0,0,1,0,
                0,0,0,1,
                0,1,0,0,
                1,0,0,0),
              nrow = 4,
              byrow=TRUE
  )
  w <- rep(1/4, 4)
  out <- generate_weights(G, w)
  expect_length(out, 2)
  expect_equal(nrow(out), 15)
  expect_equal(tail(out$weights, 1)[[1]], rep(1/4, 4))

  w <- c(1/2, 1/2, 0, 0)
  out <- generate_weights(G, w)
  expect_length(out, 2)
  expect_equal(nrow(out), 15)
  expect_equal(tail(out$set, 1)[[1]], c(1/2, 1/2, 0, 0))
})
