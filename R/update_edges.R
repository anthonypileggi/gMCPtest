#' Recursively compute edge weights for a given graph and intersection hypothesis
#' @param h A numeric vector with only binary entries (0,1).
#' @param g Graph represented as transition matrix.
#' @param w A numeric vector of weights.
#' @return A weight vector
update_edges <- function(h, g, w){
  if(sum(h) == length(h)){
    return(g)
  } else {
    j <- which(h == 0)[1]
    h[j] <- 1
    gu <- update_edges(h, g, w)
    gj <- gu[, j] %*% t(gu[j, ])
    gt <- ( (gu+gj) / (1 - matrix(rep(diag(gj), nrow(gj)), nrow = nrow(gj))))
    gt[j, ] <- 0
    gt[, j] <- 0
    diag(gt) <- 0
    gt[is.nan(gt)] <- 0
    return(gt)
  }
}
