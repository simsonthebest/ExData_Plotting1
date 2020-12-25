## Plot 4: Overview of all data

# Reading & Organizing the data file
header <- read.delim("household_power_consumption.txt", header = FALSE, nrows = 1, sep = ";")
dataset <- read.delim("household_power_consumption.txt", header = FALSE, skip = 66637,
                      nrows = 2880, sep = ";")
colnames(dataset) <- unlist(header)
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
datafinal <- data.frame(datetime,dataset[,3:9])

# Time series of the global active power per location
dev.new(width = 480, height = 480, unit = "px")
par(mfrow = c(2,2))
plot(datafinal$datetime, datafinal$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(datafinal$datetime, datafinal$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(datafinal$datetime, datafinal$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(datafinal$datetime, datafinal$Sub_metering_2, col = "red")
lines(datafinal$datetime, datafinal$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 1, bty = "n")

plot(datafinal$datetime, datafinal$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "Plot4.png")
dev.off()