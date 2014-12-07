
data = fread("household_power_consumption.txt")

data$Date = as.Date(data$Date, format="%d/%m/%Y")



datasub= data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]

datasub = data.frame(datasub)

for(i in c(3:9)) {datasub[,i] <- as.numeric(as.character(datasub[,i]))}


datasub$DateTime = paste(datasub$Date, datasub$Time)

datasub$DateTime =strptime(datasub$DateTime, format="%Y-%m-%d %H:%M:%S")


png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2))

plot(datasub$DateTime, datasub$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")


lines(datasub$DateTime, datasub$Global_active_power, type="S")



plot(datasub$DateTime, datasub$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")


lines(datasub$DateTime, datasub$Voltage, type="S")



plot(datasub$DateTime, datasub$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

lines(datasub$DateTime, datasub$Sub_metering_1, col = "black", type = "S")

lines(datasub$DateTime, datasub$Sub_metering_2, col = "red", type = "S")

lines(datasub$DateTime, datasub$Sub_metering_3, col = "blue", type = "S")


legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datasub$DateTime, datasub$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")


lines(datasub$DateTime, datasub$Global_reactive_power, type="S")



dev.off()
