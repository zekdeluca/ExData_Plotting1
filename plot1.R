#rplot1.R

# Include 'sqldf' library for SQL like selection of the data
require(sqldf)

## Reading data file - reading the subset for 2 required dates only
hhpowerconsDS = read.csv.sql( file='household_power_consumption.txt', sep=";", 
                              sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)

# Plotting graph 1 - Global Active Power Frequency - writting to output device and shutting it down
png("plot1.png",width=480,height=480)
hist(hhpowerconsDS$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", c="red")
dev.off()