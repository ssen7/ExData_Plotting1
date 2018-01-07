source("readRecords.R")

df <- readRecords()

## plot and save the png file
png("plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
