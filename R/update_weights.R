#' Recursively compute weights for a given graph and intersection hypothesis
#' @param h A numeric vector with only binary entries (0,1).
#' @param G Graph represented as transition matrix.
#' @param w A numeric vector of weights.
#' @return A weight vector
update_weights <- function(h, G, w){

  if(sum(h) == length(h)){
    return(w)
  } else {
    j <- which(h == 0)[1]
    h[j] <- 1
    wu <- update_weights(h, G, w)
    gu <- update_edges(h, G, w)
    guj <- gu[j, ]
    wt <- wu + (wu[j] * guj)
    wt[j] <- 0
    return(wt)
  }

}
