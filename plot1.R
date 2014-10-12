setwd("./Documents/Exploratory Data Analysis")

RawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

RawData[,1] <- as.Date(RawData[,1], format = "%d/%m/%Y")

Date1 = as.Date("2007-02-01")
Date2 = as.Date("2007-02-02")

data <- RawData[RawData$Date == Date1 | RawData$Date == Date2 ,]

graphdata <- data[, 3]

png("plot1.png", width = 480, height = 480)

      hist(graphdata, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()