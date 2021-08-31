# Course Project 1 - Explanatory Data
# Plot 4

library(tidyverse) 
setwd("~/Downloads")

# Read in the data
Data1 <- data.table::fread(input = "household_power_consumption.txt")
head(Data1)
str(Data1)


# Merging Date and Time columns and converting using POSIXct. Change columns I need to numeric.
Data1$Sub_metering_1 <- as.numeric(Data1$Sub_metering_1, na.rm = T)
Data1$Sub_metering_2 <- as.numeric(Data1$Sub_metering_2, na.rm = T)
Data1$Sub_metering_3 <- as.numeric(Data1$Sub_metering_3, na.rm = T)

Data1$Global_active_power <- as.numeric(Data1$Global_active_power, na.rm = T)
Data1$Global_reactive_power <- as.numeric(Data1$Global_reactive_power, na.rm = T)
Data1$Voltage <- as.numeric(Data1$Voltage, na.rm = T)


Data1$Datetime <-paste(Data1$Date, Data1$Time, sep=" ")
Data1$Datetime <- as.POSIXct(Data1$Datetime, format = "%d/%m/%Y %H:%M:%S")

str(Data1)
head(Data1)


# Filter data to include only the dates we want
Data2 <- Data1[Datetime >= "2007-02-01" & Datetime < "2007-02-03", ]
head(Data2)


# Plot 4: 2 by 2 plots. X axis all the same. 
par(mfrow = c(2, 2))
    # Plot 1
with(Data2, plot(Datetime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l"))
    # Plot 2
with(Data2, plot(Datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))
    # Plot 3
plot(Data2$Datetime, Data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Data2$Datetime, Data2$Sub_metering_2,col="red")
lines(Data2$Datetime, Data2$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1), lwd = c(1, 1), cex = 0.2) # Had to make it small to fit
    # Plot 4
with(Data2, plot(Datetime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l"))







