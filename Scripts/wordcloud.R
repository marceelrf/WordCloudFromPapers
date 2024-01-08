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
                 vheight = 800,
                 delay =30,
                 zoom = 10)

