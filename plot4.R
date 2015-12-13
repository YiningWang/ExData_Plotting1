#ReadData
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubData <- data[as.Date(data$Date, "%d/%m/%Y") >="2007-02-01" & as.Date(data$Date, "%d/%m/%Y") <="2007-02-02",]

#AssignVariable
datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(SubData$Global_active_power)
GRP <- as.numeric(SubData$Global_reactive_power)
voltage <- as.numeric(SubData$Voltage)
subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)

#Plot4_Combined
png("plot4.png", width=480, height=480,units="px")
par(mfrow = c(2, 2))
## Top-Left
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power")
## Top-Right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
## Bottom-Left
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd=1, col=c("black", "red", "blue"), bty="o")
## Bottom-Right
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()