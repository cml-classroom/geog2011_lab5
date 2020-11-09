##Script for the Lab 5 assignment
##Note that the hashtags on these lines allow for comments in code

##To fill in this script, complete the code in places marked with -!!!-
##You will need to delete the -!!!- and replace with the needed code

#You may need to install packages for this lab.
#To do so, remove the hashtag on the next line and run that function.
#install.packages(c("tidyverse","tmap","sf"))

#Loading the required packages 
library(tidyverse)
library(tmap)
library(sf)

#Fill in the code below to load Google mobility data from the file specified in the walkthrough.
mobility_county <- read_csv(-!!!-)
mobility_county$date_format <- as.Date(mobility_county$date, "%m/%d/%y")

#Now filter these data for for just workplaces in Georgia.
mobility_ga_workplaces<- mobility %>%
  filter(-!!!-)

#Now create a line graph of mobility change by date. In this graph, label x axis as "Date", 
#label the y axis as "% Mobility Change (smoothed)", give the plot a main title "Line Graph of Mobility change (smoothed) in GA",
#make the color of the line red and give a title ("% Mobility Change of Workplaces area by Date in GA) to this plot.
#See resources link provided in the walkthrough or search on Google

ggplot(data = mobility_ga_workplaces)+
  geom_line(aes(x = -!!!-, y = -!!!-,group= -!!!-), colour="-!!!-")+
  xlab("Date")+
  ylab("% Mobility Change")+
  labs(title = "-!!!-")

#Save this file to your working folder when done.

#Now create two objects with mobility data of workplaces type in Georgia on March 12 and April 16.

mobility_ga_counties_0312 = mobility_county %>% 
  filter(state == "Georgia",
         type == "workplaces", 
         date_format == "-!!!-")

mobility_ga_counties_0416 = mobility_county %>% 
  filter(state == "Georgia",
         type == "workplaces", 
         date_format == "-!!!-")

#Now we will read in the county boundary file. Fill in the name of the right function to do so. 
counties<- -!!!- ("data/uscounties.gpkg", stringsAsFactors = FALSE) 

#Join the mobility data to the county boundaries 
counties_ga_mobility_0312 <- counties %>%
  inner_join( -!!!- )

counties_ga_mobility_0416 <- counties %>%
  inner_join( -!!!- )


#Creating two maps using tmap similar to Figure 9 in the walkthrough
#Use the PCT_DIFF variable for your choropleth map and the fixed classification scheme for these two maps (the breaks 
#and intervals should be the same for both maps)
#Also add a title "Mobility Change of Workplaces in GA, March 12"  and "Mobility Change of Workplaces in GA, April 16".

tm_shape(-!!!-)+
  tm_polygons(-!!!-)+
  tm_layout(main.title="-!!!-",
            legend.outside = TRUE)


tm_shape(-!!!-)+
  tm_polygons(-!!!-)+
  tm_layout(main.title="-!!!-",
            legend.outside = TRUE)

#Save a graphic of each map to your working folder. 


######################################################################################################################
#
#For 1 point extra credit
#Create interactive version of the two maps you created in Lab5_script (Similar to walkthrough figure 8)
#It should be semi-transparent and use OpenStreetMap's basemap.
#Just take a screenshot of those maps 
#
######################################################################################################################

######################################################################################################################
#
#For 1 more point extra credit
#Create a small multiple map of Georgia for one of the two dates used in the lab, showing 
#workplaces, residential, and parks. 
#See the end of the walkthrough document for a template
#Take a screen shot of it once it's done
#
######################################################################################################################


