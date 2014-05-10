## read in data
DT <- read.csv("household_power_consumption.txt",na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# select rows with required dates
dat <- DT[DT$Date=="1/2/2007"|DT$Date=="2/2/2007",c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
datetime<-as.POSIXct(strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S"))

## make plot
plot(datetime,dat$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
lines(datetime,dat$Sub_metering_1,type="l",col="black")
lines(datetime,dat$Sub_metering_2,type="l",col="red")
lines(datetime,dat$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))

## save to png
dev.copy(png,file="plot3.png")
dev.off()
