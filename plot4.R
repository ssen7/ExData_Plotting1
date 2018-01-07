df <- readRecords()

## combine date and time
df$DateTime <- paste(df$Date, df$Time)

## format date and time
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

x <- df$DateTime
gap <- df$Global_active_power
volt <- df$Voltage
sub1 <- df$Sub_metering_1
sub2 <- df$Sub_metering_2
sub3 <- df$Sub_metering_3
grp <- df$Global_reactive_power

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), mar = c(5,4,4,2))

plot(x, gap, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "datetime")
lines(x, gap)

plot(x, volt, type = "n", ylab = "Voltage", xlab = "datetime")
lines(x, volt)

plot(x, sub1, type = "n", ylab = "Energy sub metering", xlab = "datetime")
lines(x, sub1)
lines(x, sub2, col = "red")
lines(x, sub3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = rep(1,3))

plot(x, grp, type = "n", ylab = "Global_reactice_power", xlab = "datetime")
lines(x, grp)
dev.off()