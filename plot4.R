source("utils.R")

#load data, perform the plot and write PNG file. All login in the common utils.R file.
initPNG("plot4.png")
#set multi graph layout to have 2 rows and 2 columns
op<-par(mfrow=c(2,2))
df<-loadDF()
plot4(df)
dev.off()
par(op)