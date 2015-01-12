
plot3 <- function() {
## Read the household power consumption data
## Convert the Data and Time columns to Date and POSIXCt respectively
## Subset the Data Frame to extract relevant Dates
## Convert the String to numeric
## OPen the Graphic Device (PNG) to create the plot
## Construct the plot with type = "n"
## Add multiple lines with required color for each sub metering
## Switch off the Device

	housePCData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
	
	housePCData$Time <- strptime(paste(housePCData$Date,housePCData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

	housePCData$Date <- as.Date(housePCData$Date,"%d/%m/%Y")
	
	
	reqdPCData <- housePCData[housePCData$Date == as.Date("2007-02-01","%Y-%m-%d") | housePCData$Date == as.Date("2007-02-02","%Y-%m-%d"),]

	reqdPCData$Sub_metering_1 <- as.numeric(reqdPCData$Sub_metering_1)
	reqdPCData$Sub_metering_2 <- as.numeric(reqdPCData$Sub_metering_2)
	reqdPCData$Sub_metering_3 <- as.numeric(reqdPCData$Sub_metering_3)

	png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

	plot(reqdPCData$Time,reqdPCData$Sub_metering_1,type="n",main="",xlab="",ylab="Energy sub metering")
	lines(reqdPCData$Time,reqdPCData$Sub_metering_1,col="black")
	lines(reqdPCData$Time,reqdPCData$Sub_metering_2,col="red")
	lines(reqdPCData$Time,reqdPCData$Sub_metering_3,col="blue")
	
	legend("topright", lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	


	dev.off()

}


