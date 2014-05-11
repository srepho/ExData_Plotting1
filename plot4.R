library(dplyr)
library(zoo)

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data<-filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$dt<-paste(data$Date, data$Time, sep=" ")
data$dt<-as.POSIXlt(data$dt)

#Open Connection to PNG
png("plot4.png", width=480, height=480)

#set up layout
par(mfrow=c(2,2))

#Plot 1 
GAP<-zoo(data$Global_active_power, data$dt)
plot(GAP, ylab="Global Active Power", xlab="")
#Plot 2
Volt<-zoo(data$Voltage, data$dt)
plot(Volt, ylab="Voltage", xlab="datetime")
#Plot 3
sm1<-select(data, Sub_metering_1)
sm2<-select(data, Sub_metering_2)
sm3<-select(data, Sub_metering_3)
p1<-zoo(sm1, data$dt)
p2<-zoo(sm2, data$dt)
p3<-zoo(sm3, data$dt)
plot(p1, ylab="Energy sub metering", xlab="")
lines(p2, col="red")
lines(p3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
#Plot 4
GRP<-zoo(data$Global_reactive_power, data$dt)
plot(GRP, ylab="Global_reactive_power", xlab="datetime")

#Close connection
dev.off()