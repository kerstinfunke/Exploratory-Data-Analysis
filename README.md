# Exploratory-Data-Analysis
Week 4 emission project of Exploratory Data Analysis course in Data Science specialization of John-Hopkins university in coursera.com:

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI).

The data for this assignment are the rds files.
\color{red}{\verb|fips|}fips: A five-digit number (represented as a string) indicating the U.S. county
\color{red}{\verb|SCC|}SCC: The name of the source as indicated by a digit string (see source code classification table)
\color{red}{\verb|Pollutant|}Pollutant: A string indicating the pollutant
\color{red}{\verb|Emissions|}Emissions: Amount of PM2.5 emitted, in tons
\color{red}{\verb|type|}type: The type of source (point, non-point, on-road, or non-road)
\color{red}{\verb|year|}year: The year of emissions recorded

png files represent the answers according to project requirements (6 tasks/questions).

The project requirements:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?
