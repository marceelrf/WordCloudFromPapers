library(webshot)
library(htmlwidgets)
webshot::install_phantomjs()
set.seed(42)



(
hw <- wordcloud2(freq_tokens,
                 size = .75,
                 minRotation = -pi/2, maxRotation = -pi/2)

)
saveWidget(hw,"1.html",selfcontained = F)

webshot::webshot("1.html",
                 file = "wc2.png",
                 vwidth = 1000,
                 vheight = 1000,
                 delay =30,
                 zoom = 5)

png(filename = "wc_v2.png",
     width = 10000,height = 10000,res = 600)
wordcloud::wordcloud(words = freq_tokens$tokens, freq = freq_tokens$n,
          min.freq = 1,scale=c(18,.5),
          max.words=2000,random.color =T, 
          random.order=FALSE, rot.per=0.5,
          colors=RColorBrewer::brewer.pal(11, "Spectral"))
dev.off()
