setwd("./Documents/Exploratory Data Analysis")

RawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

RawData[,1] <- as.Date(RawData[,1], format = "%d/%m/%Y")

Date1 = as.Date("2007-02-01")
Date2 = as.Date("2007-02-02")

data <- RawData[RawData$Date == Date1 | RawData$Date == Date2 ,]

graphdata1 <- data[, 7]
graphdata2 <- data[, 8]
graphdata3 <- data[, 9]

png("plot3.png", width = 480, height = 480)

      x <- 1:length(graphdata)
      plot(x, graphdata1, type = "n", ylab = "Energy sub metering", xlab = "", axes = FALSE)
      lines(x, graphdata1)
      lines(x, graphdata2, col = "red")
      lines(x, graphdata3, col = "blue")
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(0, 10, 20, 30))
      box()
      legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)      

dev.off()