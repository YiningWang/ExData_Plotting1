#ReadData
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubData <- data[as.Date(data$Date, "%d/%m/%Y") >="2007-02-01" & as.Date(data$Date, "%d/%m/%Y") <="2007-02-02",]

#AssignVariable
datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(SubData$Global_active_power)
#Plot_GlobalActivePower_Date
png("plot2.png", width=480, height=480,units="px")
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()