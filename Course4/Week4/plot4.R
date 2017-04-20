#DataScience - Exploratory Data Analysis (course #4)
#Week 4 - Project
# Jetzgetzlos, 06/04/2017 

library(ggplot2)
library(dplyr)

#LOAD FILE
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the combustion related items in SCC (using "SCC.Level.One" column)
#Find the coal related items in combustion related items (using "SCC.Level.Four" column)
filter <- grepl("combustion", SCC$SCC.Level.One, ignore.case = T) & 
    grepl("coal", SCC$SCC.Level.Four, ignore.case = T)

#Intersec NEI & SCC
SCCcomb_coal <- SCC[filter,]
NEIcomb_coal <- NEI[NEI$SCC %in% SCCcomb_coal$SCC,]

#Use dplyr package to filter the dataset and then to group it by year
#and compute the sum per year
years <- group_by(NEIcomb_coal, year, type)
sumEmission_by_year <- summarize(years, Emissions = sum(Emissions))
sumEmission_by_year <- transform(sumEmission_by_year, year = factor(year) )

# geom_bar(stat = "identity") (otherwise it's a hist plot with frequency)
g <- ggplot(sumEmission_by_year, aes(year, Emissions/1000000)) + 
    geom_bar(stat = "identity") + 
    labs(title = "Total PM2.5 Emission from coal combustion-related sources") +
    labs(y = "Total emissions (MTons)")

ggsave(filename="plot4.png", plot=g)
