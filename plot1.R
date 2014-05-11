library(dplyr)


hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data<-filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

