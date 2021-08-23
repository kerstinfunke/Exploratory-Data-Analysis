## Reading data
NEI <- readRDS("summarySCC_PM25.rds")


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

#filter for Baltimore City, Maryland 
NEIBaltimore<-subset(NEI, fips=="24510") 

#build plot
plot(unique(NEIBaltimore$year), 
     tapply(NEIBaltimore$Emissions, NEIBaltimore$year, FUN=sum),
     type="l", 
     ylab="Total Emission from PM2.5 in Baltimore City, Maryland", 
     xlab="Year", 
     main= "Total Emission from PM2.5 in Baltimore City, Maryland by Year")

#write png
dev.copy(png,'expl_week4_plot2.png', width = 480, height = 480)
dev.off()

#The data shows a decrease in 2002, an increase relative to 2002 in 2006 and an overall decrease in 2008

