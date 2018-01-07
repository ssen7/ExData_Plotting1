df <- readRecords()

## combine date and time
df$DateTime <- paste(df$Date, df$Time)

## format date and time
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")

x <- df$DateTime
y <- df$Global_active_power

## plot and save in plot2.png
png("plot2.png", width = 480, height = 480, units = "px")
plot(x, y, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "datetime")
lines(x, y)
dev.off()