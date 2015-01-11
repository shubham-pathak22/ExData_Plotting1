#read table
powerConsumption <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?")
#format Date
powerConsumption$Date <- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset of data for dates 2007-02-01 & 2007-02-02
powerConsumptionSubset <- subset(powerConsumption,powerConsumption$Date == as.Date("2007-02-01") | powerConsumption$Date == as.Date("2007-02-02"))
#generating additional column datetime
powerConsumptionSubset$datetime <- as.POSIXct(paste(powerConsumptionSubset$Date, powerConsumptionSubset$Time), format="%Y-%m-%d %H:%M:%S")

#draw plot
with(powerConsumptionSubset,plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(powerConsumptionSubset,lines(datetime,Global_active_power))
dev.copy(png,file="plot2.png")
dev.off()