# MARINA AYALA
# EBIO 4420 LAB 03

# Lab step #3: Star wars party that I am hosting so I need to create a variable for the amount of hot cheetos I have and the number of guests coming to my party 
chips <- 5
guests <- 8

# Lab step #5: each guest eats 0.4 bag(s) of chips
eat <-  0.4

# Lab step #7: I eat 0.4 bags of chips, and so does my 8 guests, so I need to concatenate how many chips I have leftover
chipseaten <- (guests +1) / (chips * eat) 

# Lab step #8: ranking the Stars Wars movies w/ my friends 
Self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

# Lab step #9: indexing Penny's ranking for episode IV
PennyIV <- Penny[4]

# Lab step #10: concatenate all 4 sets of rankings into a single data object
myMat <- cbind(Self, Penny, Lenny, Stewie)

# Lab step #11: inspect the structure of PennyIV and Penny
str(PennyIV) # this is Penny's ranking of episode IV
str(Penny) # this is Penny's ranking of all the Star Wars movies

# Lab step #12: creating a data frame using the names of people
myDf <- data.frame(Self, Penny, Lenny, Stewie)
my_second_DF <- as.data.frame(myMat)

# Lab step #13: the similarities and differences between the cbind used in step 10 and data frame in step 12 is that they both use the variables 
dim(myDf) # it gave me 9 and 4 ( this is the amount of rows and columns)
dim(myMat) # it also gave me 9 and 4 (this is the amount of rows and columns)
str(myDf) # this is 9 obs of 4 variables and lists my matrix
str(myMat) # this lists the characters/types of variables I used in my matrix 
my_data_frame <- myDf[myDf == "Lenny"] #how to find strings in my data frame
my_matrix <- myMat[myMat == myDf] #these have the same values inside the matrix for both of them
typeof(myMat) # it is a "double"
typeof(myDf) # it is a list

# Lab step #14: making a vector of the episode names
episodes <- c("I","II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

# Lab step #15: naming the rows from steps 10 and 12
row.names(myMat) <- c(episodes)
row.names(myDf) <- c(episodes)

# Lab step #16: accessing the third row of the matrix from step 10
myMat [3,]

# Lab step #17: accessing the fourth column of the data frame from step 12
myDf [,4]

# Lab step #18: access ranking for episode V
myMat [4,1]

# Lab step #19: access Penny's ranking for episode II
myMat [2,2]

# Lab step #20: access everyone's ranking for episodes IV-VI
myMat [4:6,]

# Lab step #21: access everyone's rankings for episodes II, V, VII
myMat[ c(2,5,7)]

# Lab step #22: access rankings for Penny and Stewie for episodes IV and VI
myMat[c(4,6), c(2,4)]

# Lab step #23: swapping Lenny's rankings for 2 and 5
temp <- myMat[2,3]
myMat [2,3] <- myMat [5,3]


# Lab step 24: trying the example with allrankings for Penny from step 10 
myMat["III", "Penny"]

# Lab step #25: undo the switch made in step 23
myMat["II", "Lenny"] <- myMat["V", "Lenny"]
# Using the $ to access rankings
myDf$Lenny[2] <- myDf$Lenny[5]

# Lab step #26: re-doing the switch from step 23
myDf$Lenny[5] <- myDf$Lenny[2]
