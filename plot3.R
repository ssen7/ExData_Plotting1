df <- readRecords()

## combine date and time
df$DateTime <- paste(df$Date, df$Time)

## format date and time
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

x <- df$DateTime
y1 <- df$Sub_metering_1
y2 <- df$Sub_metering_2
y3 <- df$Sub_metering_3

png("plot3.png", width = 480, height = 480, units = "px")
plot(x, y1, type = "n", ylab = "Energy sub metering", xlab = "datetime")
lines(x, y1)
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = rep(1,3))
dev.off()