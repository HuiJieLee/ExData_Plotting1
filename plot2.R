## Read data
dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

## Convert data format
dat$Date <-as.Date(dat$Date,format = "%d/%m/%Y")

## Only include data from 2007-02-01 and 2007-02-02
data_sub <-subset(dat,Date == "2007-02-01" | Date =="2007-02-02")

## Combine date and time info
data_sub$DateTime <-as.POSIXct(paste(data_sub$Date,data_sub$Time))

## Plot 2
png("plot2.png",height=480, width=480,bg="white")
plot(data_sub$DateTime,data_sub$Global_active_power,,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


