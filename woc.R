library(ggplot2)
library(plyr)
library(wordcloud)
library(RColorBrewer)

View(dataSet)

cJobT = plyr::count(dataSet$job_title)

cJobT = cJobT[order(cJobT$freq,decreasing = T),]
cJobT = cJobT[1:100,]
cJobT["sqrtFreq"] = sqrt(cJobT$freq)
cJobT
set.seed(4)
wordcloud(words = cJobT$x,freq = cJobT$sqrtFreq,colors = brewer.pal(8,"Dark2"),random.order = T,
          random.color = T,scale = c(4,0.25),use.r.layout = T,rot.per = 0.2)


set.seed(25)
wordcloud(words = cJobT$x,freq = cJobT$sqrtFreq,colors = brewer.pal(8,"Dark2"),random.order = T,
          random.color = T,scale = c(3,0.5),use.r.layout = T)

?wordcloud


ggplot(dataSet,aes())



library(wordcloud2)


wordcloud2(cJobT[c(1,3)])
