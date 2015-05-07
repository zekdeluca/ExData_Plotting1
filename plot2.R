#rplot2.R

# Include 'sqldf' library for SQL like selection of the data
require(sqldf)

## Reading data file - reading the subset for 2 required dates only
hhpowerconsDS = read.csv.sql( file='household_power_consumption.txt', sep=";", 
                              sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)

# Plotting graph 2 - Global Active Power by Weekday - writting to output device and shutting it down
hhpowerconsDS$DateTime <- strptime(paste(hhpowerconsDS$Date,hhpowerconsDS$Time),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(hhpowerconsDS$DateTime, hhpowerconsDS$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()