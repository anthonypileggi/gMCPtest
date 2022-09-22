#' Compute all intersection hypotheses and corresponding weights for a given graph
#' @param g Graph represented as transition matrix
#' @param w A numeric vector of weights
#' @export
generate_weights <- function(g, w) {
  n <- length(w)
  intersect <- (permutations(n))[-1,]
  purrr::map_df(
    1:nrow(intersect),
    function(i) {
      h <- intersect[i, ]
      dplyr::tibble(
        set = list(h),
        weights = list(update_weights(h, g, w))
      )
    }
  )
}
