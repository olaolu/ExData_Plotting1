
data = fread("household_power_consumption.txt")

data$Date = as.Date(data$Date, format="%d/%m/%Y")
class(data$Date)


datasub= data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]

datasub = data.frame(datasub)

for(i in c(3:9)) {datasub[,i] <- as.numeric(as.character(datasub[,i]))}


datasub$DateTime = paste(datasub$Date, datasub$Time)

datasub$DateTime =strptime(datasub$DateTime, format="%Y-%m-%d %H:%M:%S")


png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(data_subset$Date_Time, data_subset$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
## Sets up the plot, but does not populate with any data

lines(data_subset$Date_Time, data_subset$Sub_metering_1, col = "black", type = "S")

lines(data_subset$Date_Time, data_subset$Sub_metering_2, col = "red", type = "S")

lines(data_subset$Date_Time, data_subset$Sub_metering_3, col = "blue", type = "S")


legend("topright", lwd = c(1, 1, 1), lty = c(1, 1),  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
