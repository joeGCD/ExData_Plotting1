file <- "household_power_consumption.txt"
alldata <- read.csv2(file)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)

Global_active_power <- as.numeric(as.character(data$Global_active_power))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot 2
png(file="plot2.png", height=480, width=480)

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
