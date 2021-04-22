# 1
# File downloaded from blackboad into data farme
# Read in the london crime data file

london_crime <- read.csv("london-crime-data.csv", na = "")
str(london_crime)
# Using the paste() function, amalgamate the month and year variables into a new variable
# called Date
converted_date <- paste(london_crime$month, london_crime$year, sep = "/")
converted_date

converted_date <- paste("01", london_crime$month, london_crime$year, sep = "/")
converted_date


# Show the structure 
str(london_crime)

# 2
# convert the variable names
# Make the relevant changes to the content of
# London_crime so that your variables are correctly named
names(london_crime) 
names(london_crime)[2] <- "Borough" 
names(london_crime)[3] <- "MajorCategory" 
names(london_crime)[4] <- "SubCategory" 
names(london_crime)[5] <- "Value" 
names(london_crime)[8] <- "CrimeDate" 

names(london_crime)

attach(london_crime)                                                            
london_crime <- subset(london_crime, select=c("Borough", "MajorCategory", "SubCategory", "Value", "CrimeDate"))  
detach(london_crime)
str(london_crime)

# 3 
# Convert the CrimeDate variable so that it is a variable of type Date

london_crime$Date <- as.Date(converted_date, "%d/%m/%Y")
# show the structure 

str(london_crime)


# 4
# Plot a chart to show the summary of the borough information to see where the crimes occur
# convert to factor variable

london_crime$Borough <- factor(london_crime$Borough)
str(london_crime$Borough)

# Plot the data to show summery of borough
plot(london_crime$Borough, main="No. of Crime by Borough", xlab='Borough', ylab='No. of crime',col='#FFC300')

#  show the summery Summary the data
summary(london_crime$Borough)

# Comment for the highest and lowest number of crime: 
# The borough has the highest level of crime in Croydon: 5226
# The borough has the lowest level of crime in City of London: 86

# 5
# Display the MajorCategory variable data in a pie chart
# Convert to factor variable
london_crime$MajorCategory <- factor(london_crime$MajorCategory)

# show the structure
str(london_crime$MajorCategory)

# Summary the data
major_category <- summary(london_crime$MajorCategory)

# Plot the data in a pie chart
pie(major_category,  main="The percentage of crime by major category")

# comment for the highest and lowest highest and lowest major catogories of crime in london
#  major category had the highest level of crimes in: Theft and Handling
#  major category had the lowest level of crimes in: Sexual offence

#6
# Categorise each borough in the London_crime dataset into the general area
# create a new variable called Region and store
# within it the correct region for each borough
# check that all Boroughs have been assigned to a region
# regions that contain NA, replace them with a suitable Region

london_crime$Region[london_crime$Borough == 'Barking and Dagenham'] <- 'East'
london_crime$Region[london_crime$Borough == 'Barnet'] <- 'North'
london_crime$Region[london_crime$Borough == 'Bexley'] <- 'East'
london_crime$Region[london_crime$Borough == 'Brent'] <- 'West'
london_crime$Region[london_crime$Borough == 'Bromley'] <- 'South'
london_crime$Region[london_crime$Borough == 'Camden'] <- 'North'
london_crime$Region[london_crime$Borough == 'Croydon'] <- 'South'
london_crime$Region[london_crime$Borough == 'Ealing'] <- 'West'
london_crime$Region[london_crime$Borough == 'Enfield'] <- 'North'
london_crime$Region[london_crime$Borough == 'Greenwich'] <- 'East'
london_crime$Region[london_crime$Borough == 'Hackney'] <- 'North'
london_crime$Region[london_crime$Borough == 'Hammersmith and Fulham'] <- 'West'
london_crime$Region[london_crime$Borough == 'Haringey '] <- 'North'
london_crime$Region[london_crime$Borough == 'Harrow  '] <- 'West'
london_crime$Region[london_crime$Borough == 'Havering'] <- 'East'
london_crime$Region[london_crime$Borough == 'Hillingdon '] <- 'West'
london_crime$Region[london_crime$Borough == 'Hounslow'] <- 'West'
london_crime$Region[london_crime$Borough == 'Islington'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Kensington and Chelsea'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Kingston upon Thames '] <- 'East'
london_crime$Region[london_crime$Borough == 'Lambeth '] <- 'Central'

london_crime$Region[london_crime$Borough == 'Lewisham'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Merton '] <- 'South'
london_crime$Region[london_crime$Borough == 'Newham'] <- 'East'

london_crime$Region[london_crime$Borough == 'Redbridge '] <- 'East'
london_crime$Region[london_crime$Borough == 'Richmond upon Thames '] <- 'West'
london_crime$Region[london_crime$Borough == 'Southwark'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Sutton '] <- 'South'
london_crime$Region[london_crime$Borough == 'Tower Hamlets'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Waltham Forest '] <- 'Central'
london_crime$Region[london_crime$Borough == 'Wandsworth '] <- 'East'
london_crime$Region[london_crime$Borough == 'Westminster'] <- 'Central'


london_crime$Region[is.na(london_crime$Region)] <- 'Central'

# 7
# Display which region in London has the highest recorded crime rate
# show the number of reported crimes by region.
# label the chart and its axes

london_crime$Region <- factor(london_crime$Region)

# Show the structure
str(london_crime$Region)

# plot

plot(london_crime$Region, main="No. of Crime by Region", 
     xlab='Region', 
     ylab='No. of crime',
     col='#FFC300')

# Summary the data
summary(london_crime$Region)

# highest crimes: Central with 50000+
# lowest number of crimes : South with 10000

# 8
# extract out the subset of data that had the highest
# number of crimes
attach(london_crime)

highest_crime_data <- subset(london_crime, Region == "Central")
highest_crime_data

#lowest crime data
lowest_crime_data <- subset(london_crime, Region == "South")
lowest_crime_data

# 9
# plot the content of both of your data
#frames side by side


#10
# save the modified london_crime data frame as
#london-crime-modified.csv

write.csv(london_crime, file = "London-Crime-Modified.csv")


















