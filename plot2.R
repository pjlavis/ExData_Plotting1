setwd("./Documents/Exploratory Data Analysis")

RawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

RawData[,1] <- as.Date(RawData[,1], format = "%d/%m/%Y")

Date1 = as.Date("2007-02-01")
Date2 = as.Date("2007-02-02")

data <- RawData[RawData$Date == Date1 | RawData$Date == Date2 ,]

graphdata <- data[, 3]

png("plot2.png", width = 480, height = 480)

      x <- 1:length(graphdata)
      plot(x, graphdata, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "", axes = FALSE)
      lines(x, graphdata)
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(0, 2, 4,6))
      box()

dev.off()