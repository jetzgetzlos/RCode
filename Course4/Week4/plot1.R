#DataScience - Exploratory Data Analysis (course #4)
#Week 4 - Project
# Jetzgetzlos, 05/04/2017

library(dplyr)

#LOAD FILE
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Use dplyr package to to group it by year and compute the sum per year
years <- group_by(NEI, year)
sumEmission_by_year <- summarize(years, Emissions = sum(Emissions), na.rm = TRUE)


#Set the device with the PNG requirements (480*480)
png("plot1.png", width= 480, height = 480)

barplot(sumEmission_by_year$Emissions/1000000, names = sumEmission_by_year$year,
        xlab = "year",
        ylab = "Emission (Mtons)",
        main = "US Total PM2.5 emission (from all sources)",
        col = "Red")

#Close the device
dev.off()