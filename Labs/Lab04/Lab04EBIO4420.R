# LAB 04 EBIO4420
# MARINA AYALA

# Question #1: Practicing a for loop to print "hi" 10 times
printHi <- for ( i in seq(1,10) ) {
}

# Question #2:Print a for loop for when Tim has an starts with $10 and he earns allowance at $5 a week, and he spends $2.68 a week on (2 packs of gum) that each cost $1.34 a week plus tax,
# I want to see how much money he has after 8 weeks
piggybank <- 10 #($)
TimsAllowance <- 5 #($)
GumPriceForTwoPacks <- 2.68 #($)

for (i in seq(1:8)) {
	TimsMoney <- ((piggybank + TimsAllowance) - GumPriceForTwoPacks) 
	piggybank <- TimsMoney
	print(piggybank)
}

# Question #3: Conservation biologist trying to determine how much a population size is shrinking per year
PopulationSize <- 2000 #individuals
decreaseBy <- 0.05 #%

for (i in seq(1:7)) {
	decreaseInPopulation <- (PopulationSize * decreaseBy) #changed the percentage here from subtracted to multiplied
	PopulationSize <- decreaseInPopulation
	print(PopulationSize)
}

# Question #4: discrete-time logic growth equation
# n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K ) # this is the equation
# n[t] # is the abundance of population 
# t # time
# r # intrinsic growth rate of the population
# K # carrying capacity of the population

#n[1] = 2500, K = 10000, and r = 0.8

n <- 2500  #n[1]
r <- 0.8
K <- 10000
# logisticGrowth <- (n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K ))

for (i in seq(2,12)) {
	n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K )
	NewGrowth <- n[i]
	print(NewGrowth)
}

# Question #5: Practice using an array for my for loops
# Question #5a
zeros <- rep(0,18)

# Question 5b 
# print i to the ith value 3x the iterator variable
for ( i in seq(1,18) ) {
	zeros[i] <- i * 3
	print(zeros[i])}

# Question 5c
myVec <- rep(0,18) # the initial vector of zeros but this time called myVec rather than zeros b/c it makes 												more sense to me

 #I just want one line of code with 18 zeros
myVec <- rep(0,18)
myVec [1] <- 1 # here I want to change the first zero to a 1 so I got rid of the unecessary for loop
print(myVec)

	

# Question 5d # taking the sequence from above and making it + 1 and then 2* the previous sequence 
for(i in seq(2, 18)){
	myVec [i] <- 1 + (2 *(myVec[i - 1])) # this is the for loop  to make the sequence
}

print(myVec) # this prints and makes sure I am right 


# Question 6 # the Fibonacci sequence 
fib_seq  <- rep(0,20)
# print(fib_seq) I did this so I could make sure all the values were 0 
fib_seq[2] <- 1 # this makes it so that the second number in the sequence becomes the value 1
# print(fib_seq) I did this to check and make sure the value was 1 for the second number 

for (i in seq(3,20)){
	fib_seq[i] <- fib_seq[ i - 2 ] + fib_seq[ i - 1 ] # this is the for loop 
} 
print(fib_seq)  #here I can see the sequence

# Question 7
# I already stored the values in vectors above
time <- 1:12

print(time) # making sure I did this correctly

#storing the abundance vector and creating a plot
abundance <- n
plot(time,abundance)


