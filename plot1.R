plot1 <- function(){
 #This function plots the global active power in a histogram and saves it as a .png using the 
  #UC Irvine machine learning repository electric power database
  #from dates 2007-02-01 and 2007-02-02
  
  #load data
  dat<- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
  
  #Filter out correct dates
  datF<-dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007", ]
  
  #Open PNG Graphics device
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  #Plot histogram with custom breaks, red columns, custom title and custom xlabel
  hist(as.numeric(as.character(datF$Global_active_power)), col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
  
}