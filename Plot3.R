#Read the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Convert the date variable into the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data in accordance with the instructions
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Format dates and time
data$datetime <- as.POSIXct(data$datetime)

##This is where to start if the coding continues from plot 2
#Visualise the data 
attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save to a png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)
