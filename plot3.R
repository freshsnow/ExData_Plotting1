#figure out class time of columns to aid in faster data loading
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char = "",  nrows=100, na.strings = c("?"))
classes <- sapply(initial, class)

#read raw data and extract rows pertaining to period of interets
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char = "", colClasses = classes, na.strings = c("?"))
d = hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

#d<-dget("d.R") #relevant data across period of interest has been extracted into d.R

#create DateTime column with the proper class
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

#Set png as graphics device. 
#Plot first series and add subsequent series using lines
#Add legend
png(filename = "plot3.png", width = 480, height = 480)
plot(d$DateTime, d$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red", "blue"))
dev.off()