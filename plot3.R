#rplot3.R

# Include 'sqldf' library for SQL like selection of the data
require(sqldf)

## Reading data file - reading the subset for 2 required dates only
hhpowerconsDS = read.csv.sql( file='household_power_consumption.txt', sep=";", 
                              sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)

# Plotting graph 3 - Energy Sub-Metering by Weekday - writting to output device and shutting it down
hhpowerconsDS$DateTime <- strptime(paste(hhpowerconsDS$Date,hhpowerconsDS$Time),"%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)
plot(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_1, type = "l", col = "black")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_2, type = "l", col = "red")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2, col = c("black","red","blue"))
dev.off()