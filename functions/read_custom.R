read_custom <- function(x) {
  #x path to a txt file with the custom words. One per line.
  readr::read_lines(file = x)
}


