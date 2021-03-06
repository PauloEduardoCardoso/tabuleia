
#' @export
ist_rook <- function(a, b = a) st_relate(a, b, pattern = "F***1****")

#' @export
ist_queen <- function(a, b = a) st_relate(a, b, pattern = "F***T****")

#' @export
partial_join <- function(x, y, by_x, pattern_y) {
  idx_x <- sapply(y[[pattern_y]], grep, x[[by_x]])
  idx_y <- sapply(seq_along(idx_x), function(i) rep(i, length(idx_x[[i]])))

  df <- dplyr::bind_cols(
    x[unlist(idx_x), , drop = F],
    y[unlist(idx_y), , drop = F]
  )
  return(df)
}
