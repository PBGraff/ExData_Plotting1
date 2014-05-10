## read in data
DT <- read.csv("household_power_consumption.txt",na.strings=c("?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# select rows with required dates
GAP <- DT$Global_active_power[DT$Date=="1/2/2007"|DT$Date=="2/2/2007"]

## make plot
hist(GAP,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## save to png
dev.copy(png,file="plot1.png")
dev.off()