tidy.R
if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(c(pdftools,tidyr,dplyr,wordcloud2,stopwords,tokenizers,
                 webshot,htmlwidgets,readr))

# Define a function to display usage instructions
print_usage <- function() {
  cat("Usage: Rscript PATH_TO/pdf2wc.R <inputdir>\n")
  cat("  <inputdir>: Path to the input PDF files\n")
  cat("\n\n")
  cat("output will be three different txt files:\n")
  cat("\n\n")
}

# Check for the number of command-line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the help option is provided
if ("--help" %in% args || "-h" %in% args) {
  print_usage()
  quit(status = 0)
}

# Check if the correct number of arguments is provided
if (length(args) != 1) {
  cat("Error: Incorrect number of arguments.\n")
  print_usage()
  quit(status = 1)
}