#' Compute all intersection hypotheses and corresponding weights for a given graph
#' @param G Graph represented as transition matrix
#' @param w A numeric vector of weights
#' @export
generate_weights <- function(G, w) {

  # check inputs
  if (nrow(G) != ncol(G))
    stop("`G` must be a square transition matrix.")
  if (nrow(G) != length(w))
    stop("`w` and `G` must be of compatible lengths.")
  if (sum(w) > 1)
    stop("Weights must not sum to > 1.")
  if (any(w < 0) | any(w > 1))
    stop("All weights must be in range: [0, 1].")

  # compute all permutations of the set (i.e. binary vectors)
  n <- length(w)
  intersect <- (permutations(n))[-1,]

  # compute updated weights for each permutation
  purrr::map_df(
    1:nrow(intersect),
    function(i) {
      h <- intersect[i, ]
      dplyr::tibble(
        set = list(h),
        weights = list(update_weights(h, G, w))
      )
    }
  )

}
