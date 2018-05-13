#Read the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Convert the date variable into the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data in accordance with the instructions
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Format dates and time
data$datetime <- as.POSIXct(data$datetime)

##This is where to start if the coding continues from plot 3
#Set the layout
par(mfrow = c(2, 2))

##Visualise the data 
#Plot 1
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")

#Plot 2
plot(Voltage ~ datetime, type = "l")

#Plot 3
plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="n", cex = 0.6)

#Plot 4
plot(Global_reactive_power ~ datetime, type = "l")

#Save to a png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(data)