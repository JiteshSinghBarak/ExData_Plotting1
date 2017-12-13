## Read data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## take the required data
requiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## merge date and time
datetime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## make all required variables as numbers
globalActivePower <- as.numeric(requiredData$Global_active_power)
subMetering1 <- as.numeric(requiredData$Sub_metering_1)
subMetering2 <- as.numeric(requiredData$Sub_metering_2)
subMetering3 <- as.numeric(requiredData$Sub_metering_3)

## plot on png device
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()