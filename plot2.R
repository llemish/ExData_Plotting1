plot2 <- function() {
        file_name <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
        full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?")
        
        two_day_data <- subset(full_data, (full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"))
        
        two_day_data$DateTime <- as.POSIXlt(paste(two_day_data$Date, two_day_data$Time), tz="",
                                            "%d/%m/%Y %H:%M:%S")
        
        png(filename = "plot2.png")
        
        plot(two_day_data$DateTime, two_day_data$Global_active_power, type = 'l',
             xlab = "", ylab = "Global Active Power (kilowatts)")

        dev.off()
}