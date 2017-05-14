# Second plot

setwd("~/Dropbox/coursera/")

# read in data, format date, and subset desired dates
plotdat<-read.table("household_power_consumption.txt",sep=";",header=T)
plotdat$Date<-as.Date(plotdat$Date,format="%d/%m/%Y")
febdat<-plotdat[(plotdat$Date=="2007-02-01"|plotdat$Date=="2007-02-02"),]

# format properly and create DateTime variable
febdat$Global_active_power<-as.numeric(as.character(febdat$Global_active_power))
febdat$DateTime<-as.POSIXct(paste(febdat$Date,febdat$Time))

# plot
plot(febdat$DateTime,febdat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()