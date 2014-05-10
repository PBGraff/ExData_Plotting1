## read in data
DT <- read.csv("household_power_consumption.txt",na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# select rows with required dates
dat <- DT[DT$Date=="1/2/2007"|DT$Date=="2/2/2007",c("Date","Time","Global_active_power","Sub_metering_1","Sub_metering_2","Sub_metering_3","Global_reactive_power","Voltage")]
datetime<-as.POSIXct(strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S"))

## set multi-plot structure
par(mfcol=c(2,2))

## make plot 1
plot(datetime,dat$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)")
## make plot 2
plot(datetime,dat$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
lines(datetime,dat$Sub_metering_1,type="l",col="black")
lines(datetime,dat$Sub_metering_2,type="l",col="red")
lines(datetime,dat$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
## make plot 3
plot(datetime,dat$Voltage,ylab="Voltage",type="l",col="black")
## make plot 4
plot(datetime,dat$Global_reactive_power,ylab="Global_reactive_power",type="l",col="black")

## save to png
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()
