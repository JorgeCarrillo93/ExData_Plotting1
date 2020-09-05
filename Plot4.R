data <- read.csv("./household_power_consumption.txt", sep = ";", header= TRUE,
                 colClasses = c("character", "character",
                                "numeric", "numeric", "numeric", "numeric",
                                "numeric", "numeric", na.strings = "?" ))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

x <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

x$dateTime <- as.POSIXct(dateTime)

x <- x[complete.cases(x),]

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(x, {
  plot(Global_active_power~dateTime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage~dateTime, type = "l", xlab = "dateTime", ylab= "Voltage")
  plot(Sub_metering_1~dateTime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~dateTime, col= "red")
  lines(Sub_metering_3~dateTime, col= "blue")
  legend("topright", col=c("black","red","blue"), lty = 1, lwd = 2, bty = "n", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type = "l",
       xlab = "dateTime", ylab = "Global Reactive Power")
})

dev.copy(png, "plot4.png", width = 480, height = 480)  
dev.off()