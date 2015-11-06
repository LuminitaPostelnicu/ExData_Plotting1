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
#make the plot
plot(newdat, data$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#copy the plot to the png file "plot2.png", and close the device
dev.copy(png, file = "plot2.png")
dev.off()

