#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?


## Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)
library(data.table)


#Filter for Baltimore or LA data and Vehicle related sources

SCC_codes_vehicles<- SCC[SCC$Short.Name %like% "Veh", ]

NEI_veh<- NEI[NEI$SCC %in% SCC_codes_vehicles$SCC, ]
NEI_veh_LA_BAL<-subset(NEI_veh, fips=="24510" | fips=="06037") 

#aggregate by year
NEI_veh_LA_BAL_agg<- aggregate(NEI_veh_LA_BAL$Emissions, by = list(year=NEI_veh_LA_BAL$year, Location = NEI_veh_LA_BAL$fips), FUN=sum)
NEI_veh_LA_BAL_agg<- rename(NEI_veh_LA_BAL_agg, Emissions = x)

#build plot
plot(unique(NEI_veh_LA_BAL$year), 
     tapply(NEI_veh_LA_BAL$Emissions, list(NEI_veh_LA_BAL$year), FUN=sum, color=NEI_veh_LA_BAL$fips),
     ylab="Vehicle Emission from PM2.5 in Baltimore City, Maryland", 
     xlab="Year", 
     main= "Vehicle Emission from PM2.5 in Baltimore City, Maryland by Year")




#build plot
ggplot(NEI_veh_LA_BAL_agg, aes(year, Emissions)) + 
  facet_grid(Location~., scales= "free") + 
  geom_line() + 
  ggtitle(expression("Vehicle related Emissions Baltimore City (24510) vs. LA (06037)")) 



#write png
dev.copy(png,'expl_week4_plot6.png', width = 480, height = 480)
dev.off()

#The data shows a decrease in emissions from vehicles in Baltimore but a slight increase in LA vs. the first measured date

  


