# LAB 05 
# MARINA AYALA EBIO 4420

# Step 1 of Part 1: Practicing conditionals
# Question #1: creating a variable x and assigning a numeric value to it
x <- 2

# designing a nested for loop in order to run code in R
if (x > 5){
	print("it is greater than 5")
}else {
	print("it is less than 5")
}

# Step 2 of Part 1: importing ExampleData.csv
setwd("Documents/Courses/EBIO4420/CompBioLabsAndHomework/Labs/Lab05")
exampleData <- read.csv("ExampleData.csv") 
# looking at the structure of the data 
str(exampleData)
# converting the data into all numerics and storing it in a vector
data <- exampleData$x

# 2a changing the data that has is a negative value into a NA
for (x in data){
	data[data < 0] <- NA
}
# double checking that I changed the negative numbers into NAs
data > is.na(NA)
str(data)

# 2b converting NAs to NaN values
is.na(data)
sum(is.na(data))
data[is.na(data)] <- NaN
# double checking I turned to NAs in NaN values
str(data)

# 2c using a which statement to change NaN values to zero
which(data > NaN) #checking the data to see where the NaN(s) are
data[which(is.nan(data))] <- 0 # converting NaNs to zero
#checking to see if it worked
str(data)

# 2d Find the values that fall between 50 and 100
dataFiftytoOneHundred <- sum(data >= 50 & data <= 100)
print(dataFiftytoOneHundred) # checking to see how many values there are
# there are 498 values that fall between 50 and 100

# 2e Creating a vector of data that has all the values that fall between 50 and 100
FiftyToOneHundred <- data[data >= 50 & data <= 100]
print(FiftyToOneHundred) #checking to make sure the vector was created correctly

# 2f Creating a csv file to save my vector I just created
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# Step 3 of Part 1: Importing the CO2 emissions data from last week's lab 
CO2Data <- read.csv("CO2_data_cut_paste.csv")

# 3a The first year for which data on "Gas" emissions were non-zero
str(CO2Data)
print(CO2Data) # in these two places I am looking at what the data looks like
# indexing to find the first year in which gas emissions were greater than 0 using the which function
FirstYear <- CO2Data[ which(CO2Data[,"Gas"] > 0) [1], "Year"] # the year I obtain is 1885

#3b The years in which the "Total" emissions were between 200-300 million metric tons
TotalEmissions <-(CO2Data[,"Total"] >= 200 & CO2Data[,"Total"] <= 300)
YearsBetweenTotalEmissions <- CO2Data[TotalEmissions, "Year"]
print(YearsBetweenTotalEmissions) # the years are 1879-1887 in which the total emissions are between 200-300 metric tons of carbon

# Part 2: Loops + conditionals + biology
# Using the Lokta-Volterra equation(s)
# n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
# p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1]
# above are the two equations for the Lokta- Volterra model
# n[t] = abundance of prey at time (t)
# p[t] = abundance of predators at time (t)
# prey increasing exponentially = (a * n [t-1] * p[t-1])
# a = attack rate of predators on prey
# predators increase in abundance due to eating prey (k * a * n[t-1] * p[t-1])
# k = conversion constant (represents the conversion of consumed prey into biomass of predators)
# predators die at a constant mortality rate = (m *p[t-1])
# m = intrinsic mortality rate 
# this was a useful summary of the background knowledge used for this equation

# setting up the parameter values
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

# setting up the time vector 
time <- seq(1, totalGenerations)

# storing the other two values (n over time, and p)
n <- rep(0, totalGenerations) # n is for the prey
n[1] <- initPrey #starting with the initial prey abundance for n[1]

p <- rep(0, totalGenerations) # p is for the predator
p[1] <- initPred #starting with the inital predator abundance for p[1]

# writing a loop that implements the calculations
for (t in seq(2, totalGenerations)) {
	n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
	p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
	if (n[t] < 0) {
		n[t] <- 0
	}
	if(p[t] < 0){
		p[t] <- 0
	}
}

# plotting the abundances of prey and predators over time
quartz() # I use this to help me look at the graphs
plot(time, n, type = 'l',
		 xlab = "Number of Generations",
			ylab = "Abundance",
		 ylim = c(0, max(n)),
		 xlim = c(0, 500),
			main = "Predator and Prey Abundance Over Time")
lines(time, p, col = "hotpink")
lines(time, n, col = "purple")

# creating a matrix called MyResults
myResults <- cbind(time, n, p)

# naming the columns of the matrix I just created
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
#print(myResults) #checking it to make sure the matrix looks correct

# writing it to a csv file 
write.csv(x = myResults, file = "PredPreyResults.csv")


