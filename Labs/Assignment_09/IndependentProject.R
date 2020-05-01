# MARINA AYALA
# INDEPENDENT PROJECT EBIO 4420 SPRING 2020
# Dataset obtained from Dryad
# Study: Jenkins, Brittany R. et al. (2014), Data from: An experimental analysis of the heritability of variation in glucocorticoid concentrations in a wild avian population, Dryad, Dataset, https://doi.org/10.5061/dryad.h14kk
####################################################################################
# setting the working directory to obtain the dataset
setwd("~/Documents/Courses/EBIO4420/CompBioLabsAndHomework/Labs/Assignment_09")

# uploading the data file and converting any string as factors to false
NestlingData <- read.csv("Nestling.csv", stringsAsFactors = FALSE)

# looking at the structure of the data file
str(NestlingData)
# I just want to look at the first few rows for each variable to see what the data is structured like
head(NestlingData)

# filtering out the NAs for baseline and stress CORT levels using the filter function from the tidyverse
install.packages("tidyverse")
library(tidyverse)
nafilter <- NestlingData %>%
	filter(!is.na(X.Baseline....ng.ml.),         
				 !is.na(X.Stress...ng.ml.),
				 !is.na(Elapsed.Time))            

# I want to create a variable for just the baseline glucocorticoid levels
Baseline <- nafilter$X.Baseline....ng.ml.
# I want to create a variable for just the stress glucocorticoid levels
Stress <- nafilter$X.Stress...ng.ml.

# I just want to look at at elapsed time because this is the total amount of time for disturbance for each individual between measurements
ElapsedTime <- nafilter$Elapsed.Time

# creating a dataframe for visualization for the stress and baseline CORT levels over time
StressAndBaselineLevelsPLusElapsedTimeDF <- data.frame(Baseline, Stress, ElapsedTime)


#creating a grey theme so that I have seamless axes 
grey_theme <- theme(axis.text.x = element_text(family = "Times", colour = "grey20", size = 6, angle = 90, hjust = 0.5, vjust = 0.5),
										axis.text.y = element_text(family = "Times",  colour = "grey20", size = 10),
										text = element_text(size = 12))

# creating a boxplot for baseline cort levels over elapsed time using both a boxplot and a dotplot so individual points can be visualized along with the mean and standard error between data points for the same timestamp
plot1<-ggplot(StressAndBaselineLevelsPLusElapsedTimeDF, aes(x = ElapsedTime, y = Baseline)) +
	geom_boxplot(color = "mediumvioletred", fill = "pink", alpha = 0.2) +
	labs( x = "Elapsed Time (24 Hour Time)", y = "Baseline CORT Levels (ng/mL)") +
	geom_dotplot(binaxis='y',
							 binwidth = 0.2,
							 stackdir='center', 
							 dotsize = .4, 
							 fill="maroon4") +
	ggtitle("Baseline CORT Levels (ng/mL) for Multiple Individuals Over Elapsed Time") +
	theme(plot.title = element_text(family = "Times", face = "bold", colour= "black", size = 12, hjust = 0.5)) +
	theme(axis.title.x = element_text(family = "Times", face = "bold", colour= "black"))+
	theme(axis.title.y = element_text(family = "Times", face = "bold", colour= "black"))+
	grey_theme 
print(plot1)


# creating a boxplot for stress cort levels over elapsed time using both a boxplot and a dotplot so individual points can be visualized along with the mean and standard error between data points for the same timestamp
plot2 <- ggplot(StressAndBaselineLevelsPLusElapsedTimeDF, aes(x = ElapsedTime, y = Stress))+
	geom_boxplot(color = "firebrick3", fill = "firebrick1", alpha = 0.2) +
	labs( x = "Elapsed Time (24 Hour Time)", y = "Stress CORT Levels (ng/mL)") +
	geom_dotplot(binaxis='y',
							 binwidth = 0.5,
							 stackdir='center', 
							 dotsize = .5, 
							 fill="red4") +
	ggtitle("Stress CORT Levels (ng/mL) for Multiple Individuals Over Elapsed Time") +
	theme(plot.title = element_text(family = "Times", face = "bold", colour= "black", size = 12, hjust = 0.5)) +
	theme(axis.title.x = element_text(family = "Times", face = "bold", colour= "black"))+
	theme(axis.title.y = element_text(family = "Times", face = "bold", colour= "black"))+
	grey_theme 
print(plot2)

# vizualizing both boxplots at once using an R package called gridExtra
install.packages("gridExtra")
library(gridExtra)
finalplot <- grid.arrange(plot1, plot2, ncol = 2, widths = c(4, 4))
# this plot is huge so in order to view, you must press zoom or it overlaps

# turning ElapsedTime to a numeric instead of a  string so I can run the two-way ANOVA
x <- strptime(ElapsedTime, format = "%H:%M:%S",)

# getting rid of the dates and the timezone because it is uncessary, I only want to look at the timestamps
format(x, "%H:%M:%S",usetz = F)

# using the lubridate package from R to fix the dates and change to numerics
install.packages("lubridate")
library("lubridate")

hour(x) 			# hour function
minute(x)     # minute function
second(x)     # second function
x_hours <- hour(x) + minute(x)/60 + second(x)/3600 #converting the timestamp to hours
print(x_hours) # print out the hours

x_minutes <- hour(x) * 60 + minute(x) + second(x) / 60 #converting the timestamp to minutes
print(x_minutes) # print out the minutes

x_seconds <- hour(x) * 3600 + minute(x) + second(x) #converting the timestamp to seconds
print(x_seconds)  # print out the seconds

# creating a new variable for elapsed time as a numeric rather than as a string
ElapsedTimeasANumeric <- x_hours + x_minutes + x_seconds


# conducting the two-way ANOVA to measure for significance
# installing a package to conduct the ANOVA from R called "car"
install.packages("car")
# constructing the model
model = lm(ElapsedTimeasANumeric ~ Baseline + Stress, data = NestlingData)
# using the car function from my R library
library(car)
# this creates the type I sum of squares
Anova(model, type ="II")
# this creates the r-square, p-value, and parameter estimate
anova(model)
summary(model)
