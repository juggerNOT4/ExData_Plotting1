library(tidyr)
library(dplyr)
library(readr)

#read the data
mydata <- read.table("household_power_consumption.txt", na.strings = '?', header = TRUE, sep = ";")

#save the Dates column as dates class
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")


#selecting data for any 2 days in Feb 2007, storing it in mydata2
mydata2 <- mydata%>%filter(Date>=as.Date("2007-2-16") & Date<=as.Date("2007-2-17"))

#open the png graphics device and save the plot as plot1
png("plot1.png")

#plot the histogram
hist(mydata2$Global_active_power, 
              col="Red", 
              main="Global Active Power", 
              xlab = "Global Active Power (killowatts)", 
              ylab = "Frequency")

#off the png device
dev.off()
