#!/usr/bin/Rscript

if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(pdftools,tidyr,dplyr,wordcloud,
               stopwords,tokenizers,readr,crayon)

# Define a function to display usage instructions
print_usage <- function() {
  cat("Usage: Rscript PATH_TO/pdf2wc.R -i <inputdir> -o <outputdir> [OPTIONS...]\n")
  cat("  -i, --input <inputdir>: Path to the input PDF files.\n")
  cat("\n")
  cat("  -o, --output <outputdir>: Where you will save the wordcloud? [DEFAULT: current dir]\n")
  cat("\n\n")
  cat("[OPTIONS]:\n")
  cat("  --word_nmax [INT], Maximum number of words in the word cloud [DEFAULT: 3000].\n")
  cat("  --word_freqmin [INT], Minimum word frequency for inclusion in the word cloud [DEFAULT: 45].\n")
  cat("  --custom_stopwords [TXT FILE], Path to a custom stopword file.\n")
  cat("  --seed [INT], Seed value for reproducibility.\n")
  cat("\n")
  cat("created by " %+% red$bold("Marcel Ferreira") %+% " " %+%
        silver$underline("<marcel.ferreira@unesp.br>") %+% "\n\n")
}

# Check the number of command-line arguments
if (length(commandArgs(trailingOnly = TRUE)) < 2) {
  print_usage()
  quit(status = 1, save = "no")
}

# Retrieve command-line arguments
inputdir <- commandArgs(trailingOnly = TRUE)[1]
outputdir <- commandArgs(trailingOnly = TRUE)[2]
seed <- as.integer(commandArgs(trailingOnly = TRUE)[3])
word_nmax <- as.integer(commandArgs(trailingOnly = TRUE)[4])
word_freqmin <- as.integer(commandArgs(trailingOnly = TRUE)[5])
custom_stopword <- commandArgs(trailingOnly = TRUE)[6]

# Set default values for optional arguments
seed <- ifelse(is.na(seed), 42, seed)
word_nmax <- ifelse(is.na(word_nmax), 3000, word_nmax)
word_freqmin <- ifelse(is.na(word_freqmin), 45, word_freqmin)
inputdir <- ifelse(identical(inputdir, ""), getwd(), inputdir)
outputdir <- ifelse(identical(outputdir, ""), getwd(), outputdir)
DEFAULT_STOPWORD_FILE <- "Ex/default_stopwords.txt"
custom_stopword <- ifelse(identical(custom_stopword, ""),
                          readr::read_lines(file = DEFAULT_STOPWORD_FILE),
                          readr::read_lines(custom_stopword))
orange <- make_style("orange")
bgPurple <- make_style("purple",bg=TRUE)
# Check if input and output directories exist
if (!dir.exists(inputdir)) {
  cat(red("Error: Input directory does not exist."), "\n")
  quit(status = 1, save = "no")
}

if (!dir.exists(outputdir)) {
  cat(red("Error: Output directory does not exist."), "\n")
  quit(status = 1, save = "no")
}

# Step 1 - List all available PDFs
cat(orange$bgPurple("Step 1\n"))
pdfs <- list.files(path = inputdir, full.names = TRUE)

# Step 2 - Import PDF text via loop
cat(orange$bgPurple("Step 2\n"))
text_list <- list()

for (i in seq_along(pdfs)) {
  tryCatch({
    text_list[[i]] <- pdftools::pdf_text(pdfs[i])
  }, error = function(e) {
    cat(red("Error reading PDF:"), pdfs[i], "\n")
    cat(red$italic("Error message:"), conditionMessage(e), "\n")
    text_list[[i]] <- NA
  })
}

# Step 3 - Tokenization
cat(orange$bgPurple("Step 3\n"))
Text <- text_list %>% unlist() %>% paste(collapse = ".")

freq_tokens <- Text %>%
  tokenize_words() %>%
  tibble() %>%
  unnest(c(tokens = ".")) %>%
  rename("tokens" = ".") %>%
  filter(!(tokens %in% stopwords(source = "stopwords-iso"))) %>%
  count(tokens) %>%
  arrange(desc(n)) %>%
  filter(!(tokens %in% custom_stopword))



# Step 4 - Generating Word Cloud
cat(orange$bgPurple("Step 4\n"))
png(filename = file.path(outputdir, "wordcloud.png"), width = 10000, height = 10000, res = 600)
wordcloud::wordcloud(
  words = freq_tokens$tokens,
  freq = freq_tokens$n,
  min.freq = word_freqmin,
  scale = c(18, .5),
  max.words = word_nmax,
  random.color = TRUE,
  random.order = FALSE,
  rot.per = 0.5,
  colors = RColorBrewer::brewer.pal(11, "Spectral")
)
dev.off()

