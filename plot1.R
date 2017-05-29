source("utils.R")
  
#load data, perform the plot and write PNG file. All login in the common utils.R file.
  initPNG("plot1.png")
  df<- loadDF()
  plot1(df)
  dev.off()

  

  


