## Plot 2: Time series of the global active power

# Reading & Organizing the data file
header <- read.delim("household_power_consumption.txt", header = FALSE, nrows = 1, sep = ";")
dataset <- read.delim("household_power_consumption.txt", header = FALSE, skip = 66637,
                      nrows = 2880, sep = ";")
colnames(dataset) <- unlist(header)
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
datafinal <- data.frame(datetime,dataset[,3:9])

# Time series of the global active power
dev.new(width = 480, height = 480, unit = "px")
plot(datafinal$datetime, datafinal$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "Plot2.png")
dev.off()