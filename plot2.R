## Read data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## take the required data
requiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## merge date and time
datetime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## make gloabl active power as numeric 
power <- as.numeric(subSetData$Global_active_power)

## draw the graph
png("plot2.png", width=480, height=480)
plot(datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

