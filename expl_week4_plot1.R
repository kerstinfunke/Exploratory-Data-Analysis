## Reading data
NEI <- readRDS("summarySCC_PM25.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

tapply(NEI$Emissions, NEI$year, FUN=sum)

plot(unique(NEI$year), 
     tapply(NEI$Emissions, NEI$year, FUN=sum),
     type="l", 
     ylab="Total Emission from PM2.5 in the US", 
     xlab="Year", 
     main= "Total Emission from PM2.5 in the US by Year")

dev.copy(png,'expl_week4_plot1.png', width = 480, height = 480)
dev.off()

#The data sows a decrease in emissions