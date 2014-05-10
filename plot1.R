## data downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip on 5/10/14

## read in data
DT <- read.csv("household_power_consumption.txt",na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# select rows with required dates
GAP <- DT$Global_active_power[DT$Date=="1/2/2007"|DT$Date=="2/2/2007"]

## make plot
hist(GAP,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## save to png
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()
