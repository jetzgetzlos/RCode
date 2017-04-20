#DataScience - Exploratory Data Analysis (course #4)
#Week 4 - Project
# Jetzgetzlos, 05/04/2017 

library(ggplot2)
library(dplyr)

#LOAD FILE
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Use dplyr package to filter the dataset and then to group it by year
#and compute the sum per year

balty <- filter(NEI, fips == "24510")
years <- group_by(balty, year, type)
sumEmission_by_year <- summarize(years, Emissions = sum(Emissions))
sumEmission_by_year <- transform(sumEmission_by_year, type = factor(type) )
sumEmission_by_year <- transform(sumEmission_by_year, year = factor(year) )


#png("plot3.png")
# geom_bar(stat = "identity") (otherwise it's a hist plot with frequency)
g <- ggplot(sumEmission_by_year, aes(year, Emissions/1000, type)) + 
    geom_bar(stat = "identity") + 
    facet_grid(. ~ type, scales = "free", space = "free") + 
    labs(title = "Emission per type / Baltimore City - from all sources") + 
    labs(y = "Total emissions (kTons)")

ggsave(filename="plot3.png", plot=g)
