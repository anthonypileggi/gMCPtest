#' Print weights in human-readable format
#' @param wts data.frame of output from /code{generate_weights}
#' @export
print_weights <- function(wts) {
  purrr::map_df(
    1:nrow(wts),
    function(i) {
      wts$weights[[i]][ wts$set[[i]] == 0 ] <- "-"
      dplyr::tibble(
        set = paste0("{", paste(which(wts$set[[i]] == 1), collapse = ", "), "}"),
        weights = paste0("{", paste(wts$weights[[i]], collapse = ", "), "}")
      )
    }
  )
}
