library(tokenizers)
library(stopwords)
library(wordcloud2)
library(dplyr)



# Esse script realiza a tokenização do texto ------------------------------

# Passo 1 - converter para um unico vetor

Text <- text_list %>% unlist() %>% paste(collapse = ".")


# Passo 2 - Tokenizar baseado na ISO
(
freq_tokens <- Text %>%
  tokenize_words() %>%
  dplyr::tibble() %>%
  tidyr::unnest(.) %>%
  dplyr::rename("tokens" = ".") %>%
  dplyr::filter(!(tokens %in% stopwords(source ="stopwords-iso"))) %>%
  dplyr::count(tokens) %>%
  dplyr::arrange(desc(n)) %>%
  #manual filter
  dplyr::filter(!(tokens %in% c("1","â","nha","wiley","figure",
                                "crossref","https","online",
                                "pubmed","doi","estadual","bezerra",
                                "ferreira","zambuzzi","bergamo","fernandes",
                                "w.f","m.r","silva","nyu","unesp",
                                as.character(1990:2030),
                                as.character(1:1000))))
)


# Passo 3 - filtragem 


# word_nmax <- 3000
# word_freqmin <- 50
# 
# freq_tokens %>% 
#   slice_max(order_by = n, n = word_nmax) %>% 
#   filter(n > word_freqmin)