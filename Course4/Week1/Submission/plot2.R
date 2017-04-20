#DataScience - Exploratory Data Analysis (course #4)
#Week 1 - Project
# Jetzgetzlos, 04/04/2017

#Set the day labels in English !
Sys.setlocale(category = "LC_ALL", locale = "english")

#read the file : Electric power consumption 
#read only the first 90k rows
epc_df <- read.csv2(file = "household_power_consumption.txt", na.strings = "?", nrows = 90000 )

#Merge data and time characters
epc_df[,"DateTime"] <- paste(epc_df[,"Date"],epc_df[,"Time"])
#Convert the Date and Time variables to Date/Time classes 
epc_df[,"DateTime"] <- as.POSIXct(strptime(epc_df[,"DateTime"],format = "%d/%m/%Y %H:%M:%S"))


#date filter
filter <- (epc_df[,"DateTime"] >= "2007-02-01") & (epc_df[,"DateTime"] < "2007-02-03") 
epc_df <- epc_df[filter,]

#Convert relevant Data to Numeric format
epc_df[,"Global_active_power"] <- as.numeric(as.character(epc_df[,"Global_active_power"]))

#Set the device with the PNG requirements (480*480)
png("Submission/plot2.png", width= 480, height = 480)

plot(x = epc_df[,"DateTime"],
     y = epc_df[,"Global_active_power"],
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l"
    )

#Close the device
dev.off()