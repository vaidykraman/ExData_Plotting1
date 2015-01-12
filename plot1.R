
plot1 <- function() {
## Read the household power consumption data
## Convert the Data and Time columns to Date and POSIXCt respectively
## Subset the Data Frame to extract relevant Dates
## Convert the String to numeric
## OPen the Graphic Device (PNG) to create the plot
## Construct the histogram
## Switch off the Device

	housePCData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
	
	housePCData$Time <- strptime(paste(housePCData$Date,housePCData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

	housePCData$Date <- as.Date(housePCData$Date,"%d/%m/%Y")
	
	
	reqdPCData <- housePCData[housePCData$Date == as.Date("2007-02-01","%Y-%m-%d") | housePCData$Date == as.Date("2007-02-02","%Y-%m-%d"),]

	reqdPCData$Global_active_power <- as.numeric(reqdPCData$Global_active_power)
	
	png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

	hist(reqdPCData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")
	
	dev.off()

}


