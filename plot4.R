Sys.setlocale(category = "LC_TIME", locale = "English")
rawdata <- read.table("household_power_consumption.txt", sep=";", header=T)
data <- transform(rawdata, Date_=as.Date(Date, format='%d/%m/%Y'))
data1 <- subset(data, (Date_ >= as.Date("01/02/2007", format='%d/%m/%Y')) & (Date_ <= as.Date("02/02/2007", format='%d/%m/%Y')))
data1 <- transform(data1, Date = as.character(Date))
data1 <- transform(data1, Time = as.character(Time))
data1 <- transform(data1, Global_active_power = as.numeric(as.character(Global_active_power)))
data1 <- transform(data1, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
data1 <- transform(data1, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
data1 <- transform(data1, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
data1 <- transform(data1, Voltage = as.numeric(as.character(Voltage)))
data1 <- transform(data1, Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
data1 <- transform(data1, datetime = as.POSIXct(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

par(bg = "white")
par(mfcol = c(2, 2))

with(data1, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(data1, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data1, points(datetime, Sub_metering_2, type="l", col = "red"))
with(data1, points(datetime, Sub_metering_3, type="l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

with(data1, plot(datetime, Voltage, type="l", ylab="Voltage"))

with(data1, plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power"))

dev.copy(png, file = "plot4.png") 
dev.off()

