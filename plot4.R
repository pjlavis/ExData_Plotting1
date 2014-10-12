setwd("./Documents/Exploratory Data Analysis")

RawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

RawData[,1] <- as.Date(RawData[,1], format = "%d/%m/%Y")

Date1 = as.Date("2007-02-01")
Date2 = as.Date("2007-02-02")

data <- RawData[RawData$Date == Date1 | RawData$Date == Date2 ,]

graphdata <- data[, 3]
graphdata1 <- data[, 7]
graphdata2 <- data[, 8]
graphdata3 <- data[, 9]
graphdata4 <- data[, 5]
graphdata5 <- data[, 4]

png("plot4.png", width = 480, height = 480)

      par(mfrow = c(2,2))

      x <- 1:length(graphdata)
      plot(x, graphdata, type = "n", ylab = "Global Active Power", xlab = "", axes = FALSE)
      lines(x, graphdata)
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(0, 2, 4,6))
      box()

      plot(x, graphdata4, type = "n", ylab = "Voltage", xlab = "datetime", axes = FALSE)
      lines(x, graphdata4)
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(234, 238, 242, 246))
      box()

      plot(x, graphdata1, type = "n", ylab = "Energy sub metering", xlab = "", axes = FALSE)
      lines(x, graphdata1)
      lines(x, graphdata2, col = "red")
      lines(x, graphdata3, col = "blue")
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(0, 10, 20, 30))
      box()
      legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

      plot(x, graphdata5, type = "n", ylab = "Global_reactive_power", xlab = "datetime", axes = FALSE)
      lines(x, graphdata5)
      axis(1, at=c(1, length(x)/2, length(x)), lab=c("Thu","Fri", "Sat"))
      axis(2, at=c(0, 0.1, 0.2, 0.3, 0.4, 0.5))
      box()


dev.off()