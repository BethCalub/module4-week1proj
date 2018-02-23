## Reading the data set
df <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Extracting needed values
dfdata <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
dfdatetime <- paste(as.Date(dfdata$Date), dfdata$Time)
dfdata$Datetime <- as.POSIXct(dfdatetime)

## Generating Plot 2
plot(dfdata$Global_active_power ~ dfdata$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

#Creating a copy of the screen into a png file
dev.copy(png, "plot2.png")
dev.off()

