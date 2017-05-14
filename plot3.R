# Third plot

setwd("~/Dropbox/coursera/")

# read in data, format date, and subset desired dates
plotdat<-read.table("household_power_consumption.txt",sep=";",header=T)
plotdat$Date<-as.Date(plotdat$Date,format="%d/%m/%Y")
febdat<-plotdat[(plotdat$Date=="2007-02-01"|plotdat$Date=="2007-02-02"),]

# format properly and create DateTime variable
febdat$Sub_metering_1<-as.numeric(as.character(febdat$Sub_metering_1))
febdat$Sub_metering_2<-as.numeric(as.character(febdat$Sub_metering_2))
febdat$Sub_metering_3<-as.numeric(as.character(febdat$Sub_metering_3))
febdat$DateTime<-as.POSIXct(paste(febdat$Date,febdat$Time))

# plot
plot(febdat$DateTime,febdat$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(febdat$DateTime,febdat$Sub_metering_2,type="l",col="red")
lines(febdat$DateTime,febdat$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()