library(webshot)
library(htmlwidgets)
webshot::install_phantomjs()
set.seed(42)


tiff(filename = paste0("papers",Sys.Date(),".tif"),
     width = 450,height = 450,res = 600)
wordcloud2(freq_tokens,
           size = .75,
           minRotation = -pi/2, maxRotation = -pi/2)
dev.off() 

(
hw <- wordcloud2(freq_tokens,
                 size = .75,
                 minRotation = -pi/2, maxRotation = -pi/2)

)
saveWidget(hw,"1.html",selfcontained = F)

webshot::webshot("1.html",
                 file = "wc.png",
                 vwidth = 1000,
                 vheight = 800,
                 delay =30,zoom = 10)

