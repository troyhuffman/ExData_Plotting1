#Reads data that was uploaded to R Sandbox in Coursera
pwrdata <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Selects data between date range specified in project
pwrsubdata <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(pwrsubdata$Global_active_power)
globalReactivePower <- as.numeric(pwrsubdata$Global_reactive_power)
voltage <- as.numeric(pwrsubdata$Voltage)
subMetering1 <- as.numeric(pwrsubdata$Sub_metering_1)
subMetering2 <- as.numeric(pwrsubdata$Sub_metering_2)
subMetering3 <- as.numeric(pwrsubdata$Sub_metering_3)

#Create time series per project specifications
timeS <- strptime(paste(pwrsubdata$Date, pwrsubdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(timeS, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Save plot as PNG file
dev.copy(png,"plot2.png", width=480, height=480)
