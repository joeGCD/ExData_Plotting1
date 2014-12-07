file <- "household_power_consumption.txt"
alldata <- read.csv2(file)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)

Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Plot 1
png(file="plot1.png", height=480, width=480)

hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
