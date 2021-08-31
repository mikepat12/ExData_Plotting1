# Course Project 1 - Explanatory Data
# Plot 1

library(tidyverse) 
setwd("~/Downloads")

# Read in the data
Data1 <- data.table::fread(input = "household_power_consumption.txt")
head(Data1)
str(Data1)

# Converting to Date type. Also needed to convert global active power to numeric
Data1$Date <- as.Date(Data1$Date, format =  "%d/%m/%Y")
Data1$Global_active_power <- as.numeric(Data1$Global_active_power, na.rm = T)

str(Data1)


# Filter data to include only the dates we want
Data2 <- Data1[Date >= "2007-02-01" & Date <= "2007-02-02", ]

# Plot 1
# Global power on X. Frequency on Y. Red filled bars. Global active power title

hist(Data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")




