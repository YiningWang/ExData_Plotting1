#ReadData
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubData <- data[as.Date(data$Date, "%d/%m/%Y") >="2007-02-01" & as.Date(data$Date, "%d/%m/%Y") <="2007-02-02",]

#AssignVariable
GAP <- as.numeric(SubData$Global_active_power)
#HistGlobalActivePower
png("plot1.png", width=480, height=480,units="px")
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()