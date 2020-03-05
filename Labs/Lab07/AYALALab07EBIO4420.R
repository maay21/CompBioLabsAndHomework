# AYALA EBIO 4420
# LAB 07

# Problem 1: writing a function for the area of a triangle with a function called triangleArea
triangleArea <- function(b, h) {
	Area <- (0.5 * b * h)
	return(Area)
}
# checking to see if my function works
triangleArea(10,9)

# Problem 2: using the absolute value function to create a function named myAbs
# I created it so that if the function is (positive or negative) it returns the absolute value 
myAbs <- function(x) {
	for (i in 1:length(x)){
		if(x[i] < 0){
			x[i] <- x[i]*(-1)
		}
		if(x[i] >= 0){
			x[i] <- x[i]
		}	
	}
	return(x)
}
# testing to see if it works on the number 5
myAbs(5)
# testing to see if it works on the number -2.3
myAbs(-2.3)
# Part 2b: revising the function to make sure it works on vectors
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

# Problem 3: Fibonacci sequence 
fibonacci <- function(n,i){
	sequence <- rep_len(0,i)
	sequence[2] <- 1
	sequence[1] <- n
		for (f in 3:20){
		sequence[f] <- sequence[ f - 2 ] + sequence[ f - 1 ] 
	}
	return(sequence)
	}
# calling the fibonacci function 
fibonacci(0,20) # seeing if the function works
# Question #3a
fibonacci(1,20) # seeing if it works for 1
fibonacci(2,20) # seecing if it works for 2 
# I did not add conditionals so I am unsure if this is correct or not for bonus 3a

# Problem #4a writing a function that takes two numbers as arguments and returns the square of the difference b/w them
squaresdifference <- function(x,y){
	difference <- (x-y)^2
	return(difference)
}
# checking to make sure it works correctly
squaresdifference(2,4)
squaresdifference(c(2,4,6,8),12)

# Problem #4b calculating the average of a vector of numbers
x <- c(5,15,10) # this is the given vector to see if the function works right
CalcAverageVector <- function(x){
	meanofnums <- sum(x)/length(x)
	return(meanofnums)
}
# checking if it works properly with the vector given
CalcAverageVector(x) 

# Now using data to see if it works correctly 
setwd("~/Documents/Courses/EBIO4420/CompBioLabsAndHomework/Labs/Lab07") 
# above I am just resetting the working directory for my local computer
# importing the data as a data frame first
dataForLab07 <- read.csv('DataForLab07.csv')
# changing the data frame to a vector
dataForLab07 <- dataForLab07$x
# then checking to see if it works properly
CalcAverageVector(dataForLab07) 

# Problem #4c "sum of squares" 
SumofSquares <- function(x){
	datamean <- CalcAverageVector(x)
	return(sum(squaresdifference(x,datamean)))
}
# above, I used the CalcAverageVector function to find the mean of the data then I stored it as a vector called datamean
# then I found the sum using the squaresdifference function and the new vector datamean
# calling the function for the data to see if it works with the inputted data
SumofSquares(dataForLab07)
