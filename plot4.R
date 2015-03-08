mydata <- read.table("household_power_consumption.txt",sep=';', header=T)
mydata_2007 = subset(mydata,  Date == "1/2/2007" | Date == "2/2/2007")
head(mydata)
head(mydata_2007)

Date_Time = as.POSIXct(paste(mydata_2007[,c(1)], mydata_2007[,c(2)]), format="%d/%m/%Y %H:%M:%S")
Global_active_power = as.numeric(as.character( mydata_2007[,c(3)]) )
Global_reactive_power = as.numeric(as.character( mydata_2007[,c(4)]) )
Voltage = as.numeric(as.character( mydata_2007[,c(5)]) )
Global_intensity = as.numeric(as.character( mydata_2007[,c(6)]) )
Sub_metering_1 = as.numeric(as.character( mydata_2007[,c(7)]) )
Sub_metering_2 = as.numeric(as.character( mydata_2007[,c(8)]) )
Sub_metering_3 = as.numeric(as.character( mydata_2007[,c(9)]) )

mydata_2007_df <- data.frame(Date_Time,
			     Global_active_power, 
				Global_reactive_power,
				Voltage,
				Global_intensity,
				Sub_metering_1,
				Sub_metering_2,
				Sub_metering_3)
head(mydata_2007_df)

# Plot 4
png("plot4.png")

par(mfrow = c(2,2))

plot(mydata_2007_df$Date_Time,mydata_2007_df$Global_active_power, type="l",xlab="",ylab="Global Active Power(kilowatts)")

plot(mydata_2007_df$Date_Time,mydata_2007_df$Voltage, type="l",xlab="datetime",ylab="Voltage")

plot(mydata_2007_df$Date_Time,mydata_2007_df$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(mydata_2007_df$Date_Time,mydata_2007_df$Sub_metering_2, type="l",col="red")
lines(mydata_2007_df$Date_Time,mydata_2007_df$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty = c(1, 1, 1),pch = c(NA, NA, NA))

plot(mydata_2007_df$Date_Time,mydata_2007_df$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

