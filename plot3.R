consumptionData <- read.table("household_power_consumption.txt", 
                              header=TRUE, 
                              sep=";", 
                              na.strings = "?")
subset_data <- subset(consumptionData, Date %in% c("1/2/2007","2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

with(subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty= 1,
       lwd = 1)


dev.copy(png, "plot3.png")
dev.off()
