data <- read.csv("./household_power_consumption.txt", sep = ";", header= TRUE,
                 colClasses = c("character", "character",
                                "numeric", "numeric", "numeric", "numeric",
                                "numeric", "numeric"), na.strings = "?" )

data$Date <- as.Date(data$Date, "%d/%m/%Y")

x <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

x$dateTime <- as.POSIXct(dateTime)

x <- x[complete.cases(x),]

with(x, {
  plot(Sub_metering_1~dateTime, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2~dateTime, col = "red")
  lines(Sub_metering_3~dateTime, col = "blue")
})

legend("topright", lty= 1:1, col = c("black","red", "blue") , c(1,1,1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "Plot3.png", width = 480, height = 480)

dev.off()
