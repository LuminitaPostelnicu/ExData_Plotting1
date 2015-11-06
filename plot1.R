setwd("/Users/Lumi/R_courses/DataScienceSpecialization/Exploratory Data Analysis/Week1/CourseProject1")
#check the size of the dataset
object.size(read.table("household_power_consumption.txt"))
#read the large dataset
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
#subset only the data that we need (i.e. from 1st and 2nd February 2007)
data <- subset(data1, data1$Date %in% c("1/2/2007", "2/2/2007"))
#make the histogram
hist(data$Global_active_power, breaks = 13, col="red", border = "black", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", yaxt = "n")
axis(side = 2, ylim=c(0, 1200), cex.axis=0.7)
#copy the histogram to the png file "plot1.png", and close the device
dev.copy(png, file = "plot1.png")
dev.off()

