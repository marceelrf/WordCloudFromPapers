
# Esse script importa/Processa todos os PDF da pasta Papers ---------------

# Passo 1 - listar todos os pdfs disponíveis

pdfs <- list.files(path = "Papers_gembio/",full.names = T)

# Passo 2 - importar via loop

text_list <- list()

for(i in seq_along(pdfs)) {
  text_list[[i]] <- pdftools::pdf_text(pdfs[i])
}
