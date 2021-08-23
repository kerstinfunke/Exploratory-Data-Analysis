#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


## Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)
library(data.table)


#Filter for Baltimore data and Vehicle related sources

SCC_codes_vehicles<- SCC[SCC$Short.Name %like% "Veh", ]

NEI_veh<- NEI[NEI$SCC %in% SCC_codes_vehicles$SCC, ]
NEIBaltimore_veh<-subset(NEI_veh, fips=="24510") 


#build plot
plot(unique(NEIBaltimore_veh$year), 
     tapply(NEIBaltimore_veh$Emissions, NEIBaltimore_veh$year, FUN=sum),
     type="l", 
     ylab="Vehicle Emission from PM2.5 in Baltimore City, Maryland", 
     xlab="Year", 
     main= "Vehicle Emission from PM2.5 in Baltimore City, Maryland by Year")

#write png
dev.copy(png,'expl_week4_plot5.png', width = 480, height = 480)
dev.off()

#The data shows a decrease in emissions from vehicles in Baltimore leading up to the measurement in 2008

