library(dplyr)
library(zoo)

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data<-filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$dt<-paste(data$Date, data$Time, sep=" ")
data$dt<-as.POSIXlt(data$dt)
sm1<-select(data, Sub_metering_1)
sm2<-select(data, Sub_metering_2)
sm3<-select(data, Sub_metering_3)
p1<-zoo(sm1, data$dt)
p2<-zoo(sm2, data$dt)
p3<-zoo(sm3, data$dt)

png("plot3.png", width=480, height=480)
plot(p1, ylab="Energy sub metering")
lines(p2, col="red")
lines(p3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
