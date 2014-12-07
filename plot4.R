file <- "household_power_consumption.txt"
alldata <- read.csv2(file)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)

Global_active_power <- as.numeric(as.character(data$Global_active_power))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(as.character(data$Sub_metering_1))
subMetering2 <- as.numeric(as.character(data$Sub_metering_2))
subMetering3 <- as.numeric(as.character(data$Sub_metering_3))
Voltage <- as.numeric(as.character(data$Voltage))
Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# Plot 4

png(file="plot4.png", height=480, width=480)

par(mfrow=c(2,2))

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, c("black", "red", "blue"), cex=0.5)

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
