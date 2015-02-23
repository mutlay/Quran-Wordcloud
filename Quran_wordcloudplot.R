#Load the packages
library(tm)
library(wordcloud)
require(RColorBrewer)
#Read text file of Al-Qur'an in string format:
qurantxt <- readLines("The_Holy_Quran_Translated_by_Abdullah_Yusuf_Ali.txt")
#Convert strign to corpus:
Quran <- Corpus(VectorSource(qurantxt))
#Delete unnecessary words/signs and stopwords from the text:
Quran <- tm_map(Quran, removeNumbers)
Quran <- tm_map(Quran, removePunctuation)
Quran <- tm_map(Quran , stripWhitespace)
Quran <- tm_map(Quran, tolower)
Quran <- tm_map(Quran, removeWords, stopwords("english")) 
a <- tm_map(a, stemDocument, language = "english")
pal2 <- brewer.pal(8,"Dark2")
library(Cairo)
#Open the svg device:
Cairo(800,800,file="cairo_2.svg",type="svg",bg="transparent",pointsize=12, units="in",dpi=400, width=20, height=20)
#Plot wordcloud:
wordcloud(Quran, scale=c(8,.2),min.freq=3, max.words=Inf, random.order=FALSE, rot.per=.15, colors=pal2)
#Close svg device:
dev.off()
