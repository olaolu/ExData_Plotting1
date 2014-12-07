
data = fread("household_power_consumption.txt")

data$Date = as.Date(data$Date, format="%d/%m/%Y")
class(data$Date)


datasub= data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]

datasub = data.frame(datasub)

for(i in c(3:9)) {datasub[,i] <- as.numeric(as.character(datasub[,i]))}


datasub$DateTime = paste(datasub$Date, datasub$Time)

datasub$DateTime =strptime(datasub$DateTime, format="%Y-%m-%d %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")


plot(datasub$DateTime, datasub$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")


lines(datasub$DateTime, datasub$Global_active_power, type="S")

dev.off()
