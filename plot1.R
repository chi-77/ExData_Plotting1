consumptionData <- read.table("household_power_consumption.txt", 
                              header=TRUE, 
                              sep=";", 
                              na.strings = "?")
subset_data <- subset(consumptionData, Date %in% c("1/2/2007","2/2/2007"))
hist(subset_data$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.copy(png, "plot1.png")
dev.off()