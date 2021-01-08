plot4 <- function() {
    file_name <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
    full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?")
    
    two_day_data <- subset(full_data, (full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"))
    
    two_day_data$DateTime <- as.POSIXlt(paste(two_day_data$Date, two_day_data$Time), tz="",
                                        "%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot4.png")
    
    par(mfrow = c(2, 2))
    
    # first plot
    plot(two_day_data$DateTime, two_day_data$Global_active_power, type = 'l',
         xlab = "", ylab = "Global Active Power")
    
    # second plot
    plot(two_day_data$DateTime, two_day_data$Voltage, type = 'l',
         xlab = "datetime", ylab = "Voltage")
    
    # third plot
    plot(two_day_data$DateTime, two_day_data$Sub_metering_1, type = 'l',
         xlab = "", ylab = "Energy sub metering")
    lines(two_day_data$DateTime, two_day_data$Sub_metering_2, type = 'l',
          xlab = "", col = 'red')
    lines(two_day_data$DateTime, two_day_data$Sub_metering_3, type = 'l',
          xlab = "", col = 'blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), lty = 1, bty = "n")
    
    # fourth plot
    plot(two_day_data$DateTime, two_day_data$Global_reactive_power, type = 'l',
         xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
}