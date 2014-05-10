## data downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip on 5/10/14

## read in data
DT <- read.csv("household_power_consumption.txt",na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# select rows with required dates
dat <- DT[DT$Date=="1/2/2007"|DT$Date=="2/2/2007",c("Date","Time","Global_active_power")]
GAP <- dat$Global_active_power
datetime<-as.POSIXct(strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S"))

## make plot
plot(datetime,GAP,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## save to png
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()
