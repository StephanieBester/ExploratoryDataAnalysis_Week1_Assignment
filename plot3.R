#set working directory
setwd(
        "C:/Users/Ryall & Stephanie/Desktop/Data scientist course/04 Exploratory Data Analysis/Week 1/Assignment"
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

#change columns to numeric
epcsubset$Sub_metering_1 <- as.numeric(epcsubset$Sub_metering_1)
epcsubset$Sub_metering_2 <- as.numeric(epcsubset$Sub_metering_2)

#set up plotting area
par(mfrow = c(1, 1))


#plotting data
png("plot3.png")

plot(
        epcsubset$DateTime,
        epcsubset$Sub_metering_1,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering"
)
lines(
        epcsubset$DateTime,
        epcsubset$Sub_metering_2,
        xlab = "",
        ylab = "Energy sub metering",
        col = "red"
)
lines(
        epcsubset$DateTime,
        epcsubset$Sub_metering_3,
        xlab = "",
        ylab = "Energy sub metering",
        col = "blue"
)
legend(
        "topright",
        lty = 1,
        col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

dev.off()