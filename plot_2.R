# plot 2
## Global Active Power (Kilowatts) by day of the week
### By Global Active Power (Kilowatts) on Y axis
### By Day of week on X-Axis
#### Make it a Line-graph

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

plot(power$Date, power$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "D:\\Users\\US47800\\Desktop\\Hanalytics\\Coursera\\Expl_Data\\assn_1\\plot_2.png")
dev.off()
