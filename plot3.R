source("Utils.R")

#load data, perform the plot and write PNG file. All login in the common utils.R file.
  initPNG("plot3.png")
  df <- loadDF()
  plot3(df)
  dev.off()
  



