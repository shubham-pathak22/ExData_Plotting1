#read table
powerConsumption <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?")
#format Date
powerConsumption$Date <- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset of data for dates 2007-02-01 & 2007-02-02
powerConsumptionSubset <- subset(powerConsumption,powerConsumption$Date == as.Date("2007-02-01") | powerConsumption$Date == as.Date("2007-02-02"))
#generating additional column datetime
powerConsumptionSubset$datetime <- as.POSIXct(paste(powerConsumptionSubset$Date, powerConsumptionSubset$Time), format="%Y-%m-%d %H:%M:%S")

#draw plot
par(mfrow=c(2,2))

with(powerConsumptionSubset,{
        #plot1
        plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power")
        lines(datetime,Global_active_power)
        #plot2
        plot(datetime,Voltage,type="n")
        lines(datetime,Voltage)
        #plot3
        plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
        lines(datetime,Sub_metering_1)
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright",cex=0.5,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
        #plot4
        plot(datetime,Global_reactive_power,type="n")
        lines(datetime,Global_reactive_power)
        
        
})
dev.copy(png,file="plot4.png")
dev.off()