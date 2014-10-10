## Read data
dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

## Convert data format
dat$Date <-as.Date(dat$Date,format = "%d/%m/%Y")

## Only include data from 2007-02-01 and 2007-02-02
data_sub <-subset(dat,Date == "2007-02-01" | Date =="2007-02-02")

## Combine date and time info
data_sub$DateTime <-as.POSIXct(paste(data_sub$Date,data_sub$Time))

## Plot 3
with(data_sub, {
plot(Sub_metering_1~DateTime, type="l",xlab="",ylab="Energy sub metering")
lines(Sub_metering_2~DateTime, type="l",col="red")
lines(Sub_metering_3~DateTime, type="l",col="blue")
})
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png",height=480, width=480)
dev.off()


