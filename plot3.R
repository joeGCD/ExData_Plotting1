file <- "household_power_consumption.txt"
alldata <- read.csv2(file)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(as.character(data$Sub_metering_1))
subMetering2 <- as.numeric(as.character(data$Sub_metering_2))
subMetering3 <- as.numeric(as.character(data$Sub_metering_3))

# Plot 3

png(file="plot3.png", height=480, width=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()
