#Reading the downloaded file
Datafull <- read.csv("/home/avrajit/R-coursera/Exploratory_data/exdata/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259)
Datafull$Date <- as.Date(Datafull$Date, format="%d/%m/%Y")

# Subsetting the Datafull by dates and removing the Datafull
Data <- subset(Datafull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Datafull)

# Date conversion
Datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(Datetime)

# Making  plot 3
with(Data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
# Saving the plot in  png format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()