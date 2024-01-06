library(tokenizers)
library(stopwords)
library(wordcloud2)
library(dplyr)



# Esse script realiza a tokenização do texto ------------------------------

# Passo 1 - converter para um unico vetor

Text <- text_list %>% unlist() %>% paste(collapse = ".")


# Passo 2 - Tokenizar baseado na ISO
freq_tokens <- Text %>%
  tokenize_words() %>%
  dplyr::tibble() %>%
  tidyr::unnest(.) %>%
  dplyr::rename("tokens" = ".") %>%
  dplyr::filter(!(tokens %in% stopwords(source ="stopwords-iso"))) %>%
  dplyr::count(tokens) %>%
  dplyr::arrange(desc(n)) %>%
  #manual filter
  dplyr::filter(!(tokens %in% c("1","â","nha","wiley","2019")))
