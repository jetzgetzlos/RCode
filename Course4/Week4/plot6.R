#DataScience - Exploratory Data Analysis (course #4)
#Week 4 - Project
# Jetzgetzlos, 06/04/2017 

library(ggplot2)
library(dplyr)

#LOAD FILE
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the motor vehicle sources items in SCC (using "SCC.Level.Two" column)
filter <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)

#Intersec NEI & SCC
SCCmotor_vehicle <- SCC[filter,]
NEImotor_vehicle <- NEI[NEI$SCC %in% SCCmotor_vehicle$SCC,]

#Filter only the Baltimore Source
baltimore_vehicle <- filter(NEImotor_vehicle, fips == "24510")

#Filter only the LA Source
la_vehicle <- filter(NEImotor_vehicle, fips == "06037")

#Merge Baltimore and LA items
vehicle_items <- rbind(baltimore_vehicle,la_vehicle )

#Add a factor variable to indicate which city the data come from.
vehicle_items <- mutate(vehicle_items,
                        city = factor(rep(c("baltimore","LA"), c(nrow(baltimore_vehicle), nrow(la_vehicle)))))

#Use dplyr package to filter the dataset and then to group it by year
#and compute the sum per year
years <- group_by(vehicle_items, year, city)
sumEmission_by_year <- summarize(years, Emissions = sum(Emissions))
sumEmission_by_year <- transform(sumEmission_by_year, year = factor(year) )

# geom_bar(stat = "identity") (otherwise it's a hist plot with frequency)
# last exercice ==> set the colour !!
g <- ggplot(sumEmission_by_year, aes(year, Emissions/1000, city)) + 
    geom_bar(stat = "identity",fill="pink", colour="red") + 
    facet_grid(. ~ city, scales = "free", space = "free") + 
    labs(title = "Total PM2.5 Emission from motor vehicle sources in Baltimore City and LA") +
    labs(y = "Total emissions (kTons)")

ggsave(filename="plot6.png", plot=g)