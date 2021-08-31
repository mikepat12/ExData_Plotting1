# Course Project 1 - Explanatory Data
# Plot 2

library(tidyverse) 
setwd("~/Downloads")

# Read in the data
Data1 <- data.table::fread(input = "household_power_consumption.txt")
head(Data1)
str(Data1)


# Merging Date and Time columns and converting using POSIXct. Also needed to convert global active power to numeric
Data1$Global_active_power <- as.numeric(Data1$Global_active_power, na.rm = T)

Data1$Datetime <-paste(Data1$Date, Data1$Time, sep=" ")
Data1$Datetime <- as.POSIXct(Data1$Datetime, format = "%d/%m/%Y %H:%M:%S")

str(Data1)
head(Data1)

# Filter data to include only the dates we want
Data2 <- Data1[Datetime >= "2007-02-01" & Datetime < "2007-02-03", ]
head(Data2)


# Plot 2: Active power on Y. Dates on X. No title, only y axis label. 
with(Data2, plot(Datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))





