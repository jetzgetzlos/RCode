#DataScience - Exploratory Data Analysis (course #4)
#Week 1 - Project
# Jetzgetzlos, 04/04/2017

#Set the day labels in English !
Sys.setlocale(category = "LC_ALL", locale = "english")

#read the file : Electric power consumption 
#read only the first 90k rows
epc_df <- read.csv2(file = "household_power_consumption.txt", na.strings = "?", nrows = 90000 )

#Convert the Date and Time variables to Date/Time classes 
# Use strptime() and as.Date () as asked in the instruction files

#Merge data and time characters
epc_df[,"DateTime"] <- paste(epc_df[,"Date"],epc_df[,"Time"])
#Convert the Date and Time variables to Date/Time classes 
epc_df[,"DateTime"] <- as.POSIXct(strptime(epc_df[,"DateTime"],format = "%d/%m/%Y %H:%M:%S"))


#date filter
filter <- (epc_df[,"DateTime"] >= "2007-02-01") & (epc_df[,"DateTime"] < "2007-02-03") 
epc_df <- epc_df[filter,]

#Convert relevant Data to Numeric format
epc_df[,"Global_active_power"] <- as.numeric(as.character(epc_df[,"Global_active_power"]))
epc_df[,"Global_reactive_power"] <- as.numeric(as.character(epc_df[,"Global_reactive_power"]))
epc_df[,"Voltage"] <- as.numeric(as.character(epc_df[,"Voltage"]))
epc_df[,"Sub_metering_1"] <- as.numeric(as.character(epc_df[,"Sub_metering_1"]))
epc_df[,"Sub_metering_2"] <- as.numeric(as.character(epc_df[,"Sub_metering_2"]))
epc_df[,"Sub_metering_3"] <- as.numeric(as.character(epc_df[,"Sub_metering_3"]))


#Set the device with the PNG requirements (480*480)
png("Submission/plot4.png", width= 480, height = 480)

par(mfcol= c(2,2))

#1st plot
plot(x = epc_df[,"DateTime"],
     y = epc_df[,"Global_active_power"],
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l"
)

#2nd plot
plot(x = epc_df[,"DateTime"],
     y = epc_df[,"Sub_metering_1"],
     xlab = "",
     ylab = "Energy sub metering",
     type = "l",
     col = "black")

lines(x = epc_df[,"DateTime"],
      y = epc_df[,"Sub_metering_2"],
      col = "red")

lines(x = epc_df[,"DateTime"],
      y = epc_df[,"Sub_metering_3"],
      col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1),
       bty = "n")


#3rd plot
plot(x = epc_df[,"DateTime"],
     y = epc_df[,"Voltage"],
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

#4th plot
plot(x = epc_df[,"DateTime"],
     y = epc_df[,"Global_reactive_power"],
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")


#Close the device
dev.off()