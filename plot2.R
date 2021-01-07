plot2 <- function() {
        file_name <- ".//exdata_data_household_power_consumption//household_power_consumption.txt"
        full_data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?")
        
        two_day_data <- subset(full_data, (full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"))
        
        two_day_data$Date <- as.Date(two_day_data$Date, "%d/%m/%y")
        
        two_day_data$Time <- strptime(two_day_data$Time, format = "%H:%M:%S")
        
        print(head(two_day_data$Date))
        print(tail(two_day_data$Time))
        
        # png(filename = "plot2.png")
        
        # hist(two_day_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
        #      main = "Global Active Power")
        
        # dev.off()
}