# First plot

setwd("~/Dropbox/coursera/")

# read in data
plotdat<-read.table("household_power_consumption.txt",sep=";",header=T)

# Format dates
plotdat$Date<-as.Date(plotdat$Date,format="%d/%m/%Y")

# Choose desired dates
febdat<-plotdat[(plotdat$Date=="2007-02-01"|plotdat$Date=="2007-02-02"),]

# format data
febdat$Global_active_power<-as.numeric(as.character(febdat$Global_active_power))


# plot
hist(febdat$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main=paste("Global Active Power"))
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()