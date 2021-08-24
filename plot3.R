library(tidyr)
library(dplyr)
library(readr)

#read the data
mydata <- read.table("household_power_consumption.txt", na.strings = '?', header = TRUE, sep = ";")

#save the Dates column as dates class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")


#selecting data for any 2 days in Feb 2007, storing it in mydata2
mydata2 <- mydata%>%filter(Date>=as.Date("2007-2-16") & Date<=as.Date("2007-2-17"))

#create a new variable datetime, which will have the date and time 
datetime <- paste(as.Date(mydata2$Date), mydata2$Time)

#change the class of datetime using strptime, according to the proper format
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

#plot the graph
png("plot3.png")
with(mydata2, plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
points(datetime, mydata2$Sub_metering_1, type = "l")
points(datetime, mydata2$Sub_metering_2, type = "l", col="red")
points(datetime, mydata2$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()

