# plot 4
## Plot 4 graphs
### Plot 1 = GAP/DOW
### Plot 2 = Voltage/DOW
### Plot 3 = ESM/DOW
### Plot 4 = GRP/DOW

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

par(mfrow = c(2,2), mar= c(3,4,3,3))
plot(power$Date, power$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
plot(power$Date, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$Date, power$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(power$Date, power$Sub_metering_2, type="l", col = "red")
lines(power$Date, power$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1), cex=.6, bty="n")

plot(power$Date, power$Global_reactive_power, type="l", xlab ="datetime", ylab = "Global_reactive_power")

dev.copy(png, "D:\\Users\\US47800\\Desktop\\Hanalytics\\Coursera\\Expl_Data\\assn_1\\plot_4.png")
dev.off()

