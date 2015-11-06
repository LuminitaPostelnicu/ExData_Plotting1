setwd("/Users/Lumi/R_courses/DataScienceSpecialization/Exploratory Data Analysis/Week1/CourseProject1")
#check the size of the dataset
object.size(read.table("household_power_consumption.txt"))
#read the large dataset
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
#subset only the data that we need (i.e. from 1st and 2nd February 2007)
data <- subset(data1, data1$Date %in% c("1/2/2007", "2/2/2007"))
#concatenate the variables Date and Time and convert them to the date and time format
newdat <- paste(data$Date,data$Time)
newdat <- strptime(newdat, format = "%d/%m/%Y %H:%M:%S")
#set the plotting area to two rows by two columns and set the margins
par(mfrow=c(2,2), mar = c(4,5,2,1))
#make the four plots
plot(newdat, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(newdat, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.axis = .8)
plot(newdat, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(newdat, data$Sub_metering_2, type = "l", col = "red")
lines(newdat, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = .75)
plot(newdat, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.axis = .6)
#copy the plot to the png file "plot4.png", and close the device
dev.copy(png, file = "plot4.png")
dev.off()
