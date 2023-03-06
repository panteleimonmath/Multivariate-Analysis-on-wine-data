####  ERGASIA POLUMETBLHTHS ####

###1-a
library(foreign)
df <- read.spss('/home/user/POLYMETABLHTH/Εργασίες/labEx1Dat.sav',header=T)
df <- as.data.frame(df)
head(df,5)
fqual <- factor(df$quality,levels=c('bad','medium','good'),labels=c(1,2,3))
attach(df)
df <- cbind(df,fqual)

library(reshape2)
dfn <- df[,-c(6)]
dfn <- melt(dfn)
ggplot(dfn,aes(x=variable,y=value,fill=fqual)) +
geom_boxplot()

psych::pairs.panels(df[,-c(6,7)],gap=0,bg=c('blue','red','green')[fqual],pch=21)

library(gridExtra)
p1<-ggplot(df,aes(x=quality,y=Year,fill=quality)) +
geom_boxplot()
p2<-ggplot(df,aes(x=quality,y=Temperature,fill=quality)) +
geom_boxplot()
p3<-ggplot(df,aes(x=quality,y=sun,fill=quality)) +
geom_boxplot()
p4<-ggplot(df,aes(x=quality,y=heat,fill=quality)) +
geom_boxplot()
p5<-ggplot(df,aes(x=quality,y=rain,fill=quality)) +
geom_boxplot()


grid.arrange(p1,p2,p3,p4,p5,ncol=2)

library(heplots)
heplots::covEllipses(df[,-c(6,7)], df$quality,fill = TRUE, pooled = FALSE,col = c("blue", "red",'purple'), variables = c(1:5), fill.alpha = 0.05)

###1-b

dfn1 <- df[,-c(7)]
dfn1 <- melt(dfn1)
aggregate(value ~ quality+ variable,data=dfn1,mean)








