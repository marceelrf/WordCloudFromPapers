#cat("--------Check dependencies--------\n")
#system("sudo apt-get install libpoppler-cpp-dev", intern = TRUE)  # intern = TRUE captures the output as a character vector

if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(pdftools,tidyr,dplyr,wordcloud2,stopwords,tokenizers,
                 webshot,htmlwidgets,readr,crayon)

# Define a function to display usage instructions
print_usage <- function() {
  cat("Usage: Rscript PATH_TO/pdf2wc.R -i <inputdir> -o <outputdir> [OPTIONS...]\n")
  cat("  -i, --input <inputdir>: Path to the input PDF files.\n")
  cat("\n")
  cat("  -o, --output <outputdir>: Where you will save the wordcloud? [DEFAULT: current dir]\n")
  cat("\n\n")
  cat("[OPTIONS]:\n")
  cat("  --word_nmax [INT], Maximum number of words in the word cloud [DEFAULT: 1000].\n")
  cat("  --word_freqmin [INT], Minimum word frequency for inclusion in the word cloud [DEFAULT: 50].\n")
  cat("  --custom_stopwords [TXT FILE], Path to a custom stopword file.\n")
  cat("  --seed [INT], Seed value for reproducibility.\n")
  cat("\n")
  cat("created by " %+% red$bold("Marcel Ferreira") %+% " " %+%
        silver$underline("<marcel.ferreira@unesp.br>") %+% "\n\n")
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

# Get the input file from command-line arguments
input_file <- args[1]

