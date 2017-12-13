## read the data
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## take its date value as date format so that we can make the comparision
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## subset the required data
data <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## make its global_active_variable as numeric to make the histogram
power <- as.numeric(data$Global_active_power)

## make the histogram in png device
png("plot1.png", width=480, height=480)
hist(power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()