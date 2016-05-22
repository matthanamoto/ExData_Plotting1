# plot 3
## Energy sub metering by day of the weeks
## Note there are 3 types of sub metering
### By Energy sub metering on Y-Axis
### BY day of week on X-Axis
#### Make it a line chart (3 colors, black = 1, red = 2, blue = 3)

power <- read.csv("D:/Users/US47800/Desktop/Hanalytics/Coursera/Expl_Data/assn_1/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power$Date = as.Date(power$Date, "%d/%m/%Y")
beg = power$Date > "2007-01-31" 
end = power$Date < "2007-02-03"
date.mask = beg & end
power = power[date.mask,]
power$Time = strptime(power$Time, "%H:%M:%S")
power$Time = format(power$Time, format = "%H:%M:%S")
power$Date = as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
power$Global_active_power = as.numeric(power$Global_active_power)
power$Global_reactive_power = as.numeric(power$Global_reactive_power)
power$Global_intensity = as.numeric(power$Global_intensity)
power$Voltage = as.numeric(power$Voltage)
power$Sub_metering_1 = as.numeric(power$Sub_metering_1)
power$Sub_metering_2 = as.numeric(power$Sub_metering_2)
power$Sub_metering_3 = as.numeric(power$Sub_metering_3)

plot(power$Date, power$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(power$Date, power$Sub_metering_2, type="l", col = "red")
lines(power$Date, power$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1))

dev.copy(png, "D:\\Users\\US47800\\Desktop\\Hanalytics\\Coursera\\Expl_Data\\assn_1\\plot_3.png")
dev.off()
