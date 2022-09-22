#' Generate all permutations for a set of length n
#' @param n set length
permutations <- function(n) {
  stopifnot(n > 0)
  outer(
    (1:(2^n)) - 1,
    (n:1) - 1,
    FUN = function(x,y) { (x %/% 2^y) %% 2 }
    )
}
