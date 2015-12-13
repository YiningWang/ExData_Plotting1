#ReadData
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubData <- data[as.Date(data$Date, "%d/%m/%Y") >="2007-02-01" & as.Date(data$Date, "%d/%m/%Y") <="2007-02-02",]

#AssignVariable
datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Hist_SubMetering
subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)
png("plot3.png", width=480, height=480,units="px")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
dev.off()