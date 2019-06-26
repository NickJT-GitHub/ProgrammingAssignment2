#creating plot #1
#adding libraries
library(lubridate)
library(dplyr)

#set working directory
setwd("~/R Files/week1")

#reading data
fileloc <- "household_power_consumption.txt"
data <- read.table(fileloc, sep = ";", header = TRUE, na.strings = "?")

#minipulating the data
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data2 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#to save space
rm(data)

#creating graph
png(filename="plot1.png")
hist(data2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()