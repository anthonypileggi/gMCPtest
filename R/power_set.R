#' Generate a power set of a given set
#' @param s a set, represented as a vector
power_set = function(s){
  m <- length(s)
  x <- vector(mode = "list", length = 2 ^ m)
  x[[1]] <- numeric()
  ct <- 1
  for(i in 1:m){
    for(subset in 1:ct){
      ct <- ct + 1
      x[[ct]] = c(x[[subset]], s[i])
    }
  }
  return(x)
}
