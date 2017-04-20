#DataScience - Exploratory Data Analysis (course #4)
#Week 1 - Project
# Jetzgetzlos, 03/04/2017

#read the file : Electric power consumption (takes time and RAM memory ... it's a huge file)
epc_df <- read.csv2(file = "household_power_consumption.txt", na.strings = "?")

#Convert the Date variable to Date/Time classes
# Use strptime() and as.Date () as asked in the instruction file
# For plot1, it's not necessary to convert the Time column
epc_df[,"Date"] <- as.Date(strptime(epc_df[,"Date"],"%d/%m/%Y"))

#date filter
filter <- (epc_df[,"Date"] >= "2007-02-01") & (epc_df[,"Date"] <= "2007-02-02") 
epc_df <- epc_df[filter,]

#Convert relevant Data to Numeric format
epc_df[,"Global_active_power"] <- as.numeric(as.character(epc_df[,"Global_active_power"]))

#Set the device with the PNG requirements (480*480)
png("Submission/plot1.png", width= 480, height = 480)
hist(epc_df[,"Global_active_power"],
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "Red")

#Close the device
dev.off()
                    
    