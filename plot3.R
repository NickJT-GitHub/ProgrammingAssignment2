#creating plot #3

#set working directory
setwd("~/R Files/week1")

#reading data
fileloc <- "household_power_consumption.txt"
data <- read.table(fileloc, sep = ";", header = TRUE, na.strings = "?")

#minipulating the data
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#to save space
rm(data)

#creating graph
png(filename="plot3.png")
with(data2, plot(DateTime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)",
                 xlab = ""))
with(data2, lines(DateTime, Sub_metering_2, col = "red"))
with(data2, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()