#Read the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Convert the date variable into the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data in accordance with the instructions
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##This is where to start if the coding continues from plot 1
#Format dates and time
data$datetime <- as.POSIXct(data$datetime)

#Visualise the data 
attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save to a png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)