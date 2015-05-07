#rplot4.R

# Include 'sqldf' library for SQL like selection of the data
require(sqldf)

## Reading data file - reading the subset for 2 required dates only
hhpowerconsDS = read.csv.sql( file='household_power_consumption.txt', sep=";", 
                              sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)
# Parsing Dates
hhpowerconsDS$DateTime <- strptime(paste(hhpowerconsDS$Date,hhpowerconsDS$Time),"%d/%m/%Y %H:%M:%S")

# Starting to plot graphs to device - setup
png("plot4.png",width=480,height=480)
par(mfcol = c(2,2))

# Plotting sub-graph 1 - writting to output device
plot(hhpowerconsDS$DateTime,hhpowerconsDS$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Plotting sub-graph 2 - writting to output device
plot(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_1, type = "l", col = "black")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_2, type = "l", col = "red")
lines(hhpowerconsDS$DateTime,hhpowerconsDS$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black","red","blue"), bty = "n")
# Plotting sub-graph 3 - writting to output device
plot(hhpowerconsDS$DateTime,hhpowerconsDS$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Plotting sub-graph 4 - writting to output device
plot(hhpowerconsDS$DateTime,hhpowerconsDS$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Shutting device down
dev.off()