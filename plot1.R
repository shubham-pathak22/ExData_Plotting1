#read table
powerConsumption <- read.table(file = "household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?")
#format Date
powerConsumption$Date <- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset of data for dates 2007-02-01 & 2007-02-02
powerConsumptionSubset <- subset(powerConsumption,powerConsumption$Date == as.Date("2007-02-01") | powerConsumption$Date == as.Date("2007-02-02"))
hist(powerConsumptionSubset$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()