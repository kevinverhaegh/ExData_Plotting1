plot2 <- function(){
  #This function plots the global active power in a date/timetrace and saves it as a .png using the 
  #UC Irvine machine learning repository electric power database
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
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  #Make lineplot of day vs global active power, with no x-label, custom y-label
  plot(DateTime, as.numeric(as.character(datF$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #Close PNG graphics deivce
  dev.off()
  
  
}