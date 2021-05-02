#set working directory
setwd(
        "Your WD"
)

#import the file
epc <-
        read.delim("dataset/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";")

#cleaning data
library(lubridate)
epc$Date <- dmy(epc$Date)

#subset dates to dates that is required
epcsubset <-
        subset(epc, epc$Date == "2007-02-01" | epc$Date == "2007-02-02")

#creating date time column
epcsubset$DateTime <-
        as_datetime(paste(epcsubset$Date, epcsubset$Time))

#change column to numeric
epcsubset$Global_active_power <-
        as.numeric(epcsubset$Global_active_power)

#set up plotting area
par(mfrow = c(1, 1))

#plotting data
png("plot2.png")

plot(
        epcsubset$DateTime,
        epcsubset$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
)

dev.off()
