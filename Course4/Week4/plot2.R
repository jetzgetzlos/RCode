#DataScience - Exploratory Data Analysis (course #4)
#Week 4 - Project
# Jetzgetzlos, 05/04/2017

library(dplyr)

#LOAD FILE
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Use dplyr package to filter the dataset and then to group it by year
#and compute the sum per year
balty <- filter(NEI, fips == "24510")
years <- group_by(balty, year)
sumEmission_by_year <- summarize(years, Emissions = sum(Emissions))

#Set the device with the PNG requirements (480*480)
png("plot2.png", width= 480, height = 480)

barplot(sumEmission_by_year$Emissions, names = sumEmission_by_year$year,
        xlab = "year",
        ylab = "Emission (tons)",
        main = "Total PM2.5 emission (from all sources) - Baltimore City",
        col = "Red")

#Close the device
dev.off()