#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


## Reading data
NEI <- readRDS("summarySCC_PM25.rds")

library(dplyr)
library(ggplot2)

#filter for Baltimore City, Maryland 
NEIBaltimore<-subset(NEI, fips=="24510") 


#aggregate by type and year
NEItype<- aggregate(NEIBaltimore$Emissions, 
                    by = list(year=NEIBaltimore$year, type=NEIBaltimore$type),
                    FUN=sum)
NEItype<- rename(NEItype, Emissions = x)


#build plot
ggplot(NEItype, aes(year, Emissions, color= type)) + geom_line()


#write png
dev.copy(png,'expl_week4_plot3.png', width = 480, height = 480)
dev.off()
