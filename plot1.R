#figure out class time of columns to aid in faster data loading
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char = "",  nrows=100, na.strings = c("?"))
classes <- sapply(initial, class)

#read raw data and extract rows pertaining to period of interets
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char = "", colClasses = classes, na.strings = c("?"))
d = hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

#d<-dget("d.R") #relevant data across period of interest has been extracted into d.R

#set png as graphics device, plot histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(d$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()