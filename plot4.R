plot4 <- function(){
  #This function creates four subplots and saves it as a .png: 
  #-global active power as a date/time trace
  #-sub metering as a date/time trace
  #-voltage as a date/time trace
  #-Global reactive power as a date/time trace
  #using the UC Irvine machine learning repository electric power database
  #from dates 2007-02-01 and 2007-02-02
  
  #load data
  dat<- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
  
  #Filter out correct dates
  datF<-dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007", ]
  
  #Convert date and time
  #First paste date and time strings
  DateTimeString<-paste(datF$Date, datF$Time)
  #use strptime for conversion
  DateTime<- strptime(DateTimeString, format = "%d/%m/%Y %H:%M:%S")
  
  #Open PNG graphics device
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  
  #prepare multi-plot window
  par(mfrow=c(2,2))
  
  #Make first plot (global active power as a date/time trace)
  plot(DateTime, as.numeric(as.character(datF$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
  
  #Make second plot (voltage as a date/time trace)
  plot(DateTime, as.numeric(as.character(datF$Voltage)), type="l", xlab="datetime", ylab="Voltage")
  
  #Make third plot (sub metering as a date/time trace)
  plot(DateTime, as.numeric(as.character(datF$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
  #Add lineplot of day vs sub metering 2 with colour red
  lines(DateTime, as.numeric(as.character(datF$Sub_metering_2)), col="red")
  #Add lineplot of day vs sub metering 3 with colour blue
  lines(DateTime, as.numeric(as.character(datF$Sub_metering_3)), col="blue")
  #Add legend
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=0.75, bty="n")
  
  #Make fourth plot (Global reactive power as a date/time trace)
  plot(DateTime, as.numeric(as.character(datF$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
  #Close PNG graphics deivce
  dev.off()
  
  
}