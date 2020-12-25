## Plot 1: Frequency of the global active power

# Reading & Organizing the data file
header <- read.delim("household_power_consumption.txt", header = FALSE, nrows = 1, sep = ";")
dataset <- read.delim("household_power_consumption.txt", header = FALSE, skip = 66637,
                      nrows = 2880, sep = ";")
colnames(dataset) <- unlist(header)
datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
datafinal <- data.frame(datetime,dataset[,3:9])

# Plot a histogram
dev.new(width = 480, height = 480, unit = "px")
hist(datafinal$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.copy(png, "Plot1.png")
dev.off()