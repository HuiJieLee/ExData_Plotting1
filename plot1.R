## Read data
dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

## Convert data format
dat$Date <-as.Date(dat$Date,format = "%d/%m/%Y")

## Only include data from 2007-02-01 and 2007-02-02
data_sub <-subset(dat,Date == "2007-02-01" | Date =="2007-02-02")

## Plot 1
png("plot1.png",height=480, width=480,bg="white")
hist(data_sub$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
dev.off()


