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

# Making  plot 1
hist(Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power.(kilowatts)", ylab="Frequency", col="Red")

# Saving the plot in  png format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()