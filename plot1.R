library(data.table)
data=fread("./household_power_consumption.txt", sep=";", na.strings = "?", colClasses=c("Date", "Time", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") )
#adata=as.Date(data$Date, format="%d/%m/%y")
#data$Date=adata
data$Date = as.Date(data$Date, format="%d/%m/%Y")
datasub = data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]
datasub$Global_active_power=as.numeric(datasub$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480, units = "px" )
hist(datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
