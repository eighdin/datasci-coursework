# x <- "25"
# class(x)
# y <- 5
# z <- as.numeric(x) + y # nolint
charvector <- c("low", "medium", "high", "medium", "low")
class(charvector)

var1 <- factor(charvector)
class(var1)

myfactor <- factor(c(1, 3.4, 5, 6))

thisvector  <- 1:10
class(thisvector)
class(thisvector[0])

m1 <- matrix(thisvector, nrow = 3, ncol = 2, byrow = TRUE)

print(m1[3, ])
# Create an array consisting of 2 tables using #'s 1 thru 24
a1 <- array(1:24, dim <- c(4, 3, 2))
print(a1)

a1[, , 2]

# Data Frame

name_vector <- c("Roy", "Jane", "Joe", "Josh")
age_vector <- c(21, 33, 18, 28)
gender_vector <- c("M", "F", "M", "M")

data_frame <- data.frame(name_vector, age_vector, gender_vector)
print(data_frame)
# Prints out only the name vector
print(data_frame[, "name_vector"])
print(data_frame[, 1])

# you can use row, column to print out the data in a frame
data_frame[1, 1:2]

# you can use the $ to be able to read a vector from the data frame
data_frame$name_vector

# List

# we create several vectors of different sizes,
# and we can combine them into a list.
num_vector <- c(1, 2)
char_vector <- c("A", "B", "C")
float_vector <- c(3.4)

my_list <- list(num_vector, char_vector, float_vector)
print(my_list)

# print my_list[2] will print out the second vector in the list
print(my_list[2])


# HW #2

numbervector <- seq(from = 10, to = 90, by = 10)
my_matrix <- matrix(numbervector, nrow = 3, ncol = 3, byrow = TRUE)
my_matrix[2, 2] <- 100

arr <- array(2:13, dim = c(2, 3, 2))

x <- c("3.33", "3.14", "9.95")
class(x)
x <- as.numeric(x)
class(x)

mean(x)
median(x)

# Display the Mean, Range and mode of a dataset
setwd("/home/bigguy/Documents/School/DATASCI/")
cardiodata <- read.csv("CardioGoodFitness.csv")
mean(cardiodata$Miles)
range(cardiodata$Miles)
mode(cardiodata$Miles)

# Create a histogram displaying frequency distribution of miles

miles <- cardiodata$Miles
hist(miles, col = "red")

school_data <- read.csv("CensusSchool.csv")
print(str(school_data))
