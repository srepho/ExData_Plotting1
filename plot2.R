library(dplyr)
library(zoo)

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data<-filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$dt<-paste(data$Date, data$Time, sep=" ")
data$dt<-as.POSIXlt(data$dt)
ptwo<-zoo(data$Global_active_power, data$dt)

png("plot2.png", width=480, height=480)
plot(ptwo, ylab="Global Active Power (kilowatts)")
dev.off()
