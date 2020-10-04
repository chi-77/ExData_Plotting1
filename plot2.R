consumptionData <- read.table("household_power_consumption.txt", 
                              header=TRUE, 
                              sep=";", 
                              na.strings = "?")
subset_data <- subset(consumptionData, Date %in% c("1/2/2007","2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

with(subset_data, plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png")
dev.off()
