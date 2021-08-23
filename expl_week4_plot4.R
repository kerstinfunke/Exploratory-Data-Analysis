#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


## Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)
library(data.table)


#filter for coal sectors

SCC_codes_coal<- SCC_codes[SCC$EI.Sector %like% "Coal", ]


NEI_coal<- NEI[NEI$SCC %in% SCC_codes_coal$SCC, ]


#aggregate by year
NEI_coal_aggregate<- aggregate(NEI_coal$Emissions, by = list(year=NEI_coal$year), FUN=sum)
NEI_coal_aggregate<- rename(NEI_coal_aggregate, Emissions = x)



#build plot
ggplot(NEI_coal_aggregate, aes(year, Emissions)) + geom_line() 


#write png
dev.copy(png,'expl_week4_plot4.png', width = 480, height = 480)
dev.off()

#The data shows a decrease till 2008 in coal related emissions
