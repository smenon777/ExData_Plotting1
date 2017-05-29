source("loadDF.R")

#load data, perform the plot and write PNG file. All login in the common utils.R file.
initPNG("plot2.png")
df <- loadDF()
plot2(df)
dev.off()


  

