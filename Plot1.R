data <- read.csv("./household_power_consumption.txt", sep = ";", header= TRUE,
                 colClasses = c("character", "character",
                                "numeric", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"), na.strings = "?" )

data$Date <- as.Date(data$Date, "%d/%m/%Y")

x <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

x$dateTime <- as.POSIXct(dateTime)

x <- x[complete.cases(x),]

hist(x$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png, "plot1.png", width = 480, height = 480)

dev.off()

