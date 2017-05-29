#function to load the data frame
loadDF <-function() { 
  
  df<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
  
  #filter out all data other than for the two days of interest
  df1 <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
  
  # convert factors into appropriate data types for rendering
  df1$Global_active_power<-as.numeric(df1$Global_active_power)
  df1$Global_reactive_power <-as.numeric(df1$Global_reactive_power)
  df1$Voltage <-as.numeric(df1$Voltage)
  df1$Global_intensity <-as.numeric(df1$Global_intensity)
  df1$Sub_metering_1 <-as.numeric(df1$Sub_metering_1)
  df1$Sub_metering_2 <-as.numeric(df1$Sub_metering_2)
  df1$Sub_metering_3 <-as.numeric(df1$Sub_metering_3)
  
  #create a clean date time column to use on the x-axis
  DateTime <- paste(df1$Date, df1$Time)
  df1$pt <- as.POSIXct(DateTime, "%d/%m/%Y %H:%M:%S", tz="EST" )
  
  
  
  df1
  
}

#plot the first graph
plot1<-function(df) {
  
  hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power(Kilowatts)", ylab = "Frequency", col="Red" )
}

#plot the second graph
plot2<-function(df) {
  
  plot(as.numeric(df$pt), df$Global_active_power, type='s', xaxt="n", ylab="Global Active Power(KiloWatts)", xlab="")
  
  #Adjust the x axis rendering to match requirements
  axis(side=1, at =c(1170300000, 1170400000, 1170480000), labels=c("Thu", "Fri", "Sat"))
  
  
}

# Plot the 3rd plot
plot3<-function(df) {
  
  #Create the base plot with one time series
  plot(as.numeric(df$pt), df$Sub_metering_1, type='s', xaxt="n", ylab="Energy sub metering", xlab="", col="black")
  #Add additional timeseries as seperate graphs.
  lines(as.numeric(df$pt), df$Sub_metering_2, type='s', col="red")
  lines(as.numeric(df$pt), df$Sub_metering_3, type='s', col="blue")
  axis(side=1, at =c(1170300000, 1170400000, 1170480000), labels=c("Thu", "Fri", "Sat"))
  
  # add legends
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black", "red", "blue"))

}

# plot the 4th plot
plot4<-function(df) {
  
  #assuming mfrow as been set .. plot the component graphs in sequence.

  plot2(df) #graph 1
  
  #graph2 
  plot(as.numeric(df$pt), df$Voltage, type='s', xaxt="n", ylab="Voltage", xlab="", col="black")
  axis(side=1, at =c(1170300000, 1170400000, 1170480000), labels=c("Thu", "Fri", "Sat"))
  
  #graph3
  plot3(df)
  
  #graph4
  plot(as.numeric(df$pt), df$Global_reactive_power, type='s', xaxt="n", ylab="Global_reactive_power", xlab="", col="black")
  axis(side=1, at =c(1170300000, 1170400000, 1170480000), labels=c("Thu", "Fri", "Sat"))
}

#will write PNG file with input file name and close the png device.
initPNG <- function(filename) {
  png(file=filename, width=480, height=480)
}




