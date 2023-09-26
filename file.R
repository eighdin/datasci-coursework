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

my_frame <- data.frame(name_vector, age_vector, gender_vector)
print(my_frame)
# Prints out only the name vector
print(my_frame[, "name_vector"])
print(my_frame[, 1])

# you can use row, column to print out the data in a frame
my_frame[1, 1:2]

# you can use the $ to be able to read a vector from the data frame
my_frame$name_vector

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

#census school data

census_data <- read.csv("CensusSchool.csv")
print(str(census_data))
census_data$travel <- as.factor(census_data$travel)
census_data$travel

range(census_data$cellcost)
hist(census_data$cellcost)

census_data$cellcost
cellcost <- census_data$cellcost[!is.na(census_data$cellcost)]
cellcost
hist(cellcost)
#Exercise: Gender Disparity

str(cardiodata) #show structure of data and see what can be gleaned from it
cardiodata$Gender <- as.factor(cardiodata$Gender) # gender to factor
gender_vector <- cardiodata$Gender
gender_vector <- as.factor(gender_vector)
male_vector <- gender_vector[gender_vector == "Male"]
percent_of_males <- (length(male_vector) / length(gender_vector)) * 100
percent_of_females <- (
    ((length(gender_vector) - length(male_vector)) / length(gender_vector)) * 100
)
pie_slices <- c(percent_of_males, percent_of_females)
pie_slice_names <- c("Percent Male", "Percent Female")
pie(pie_slices, labels = pie_slice_names)

# 9/20/2023 Class Work

data(VADeaths)
str(VADeaths)

# Creating normal histograms with a built in data source
hist(VADeaths, breaks = 10, col = "red", main = "VA Deaths")
hist(VADeaths, col = "red", main = "bah")

# 9/22/2023 Class Work

# install rcolorbrewer and use it to set colors from a pallate
install.packages("RColorBrewer")
library(RColorBrewer)
palette.pals()

# partition command, sets rules for displaying data, we set the window
# to display 1 row with two columns for histograms.
par(mfrow = c(1, 2))
hist(VADeaths, breaks = 10, col = "red", main = "VA Deaths")
hist(VADeaths, breaks = 20, col = palette.colors(n = 1, palette = "Set3"))
# could use col = c(r, g, b) to set the color as well

# drawing line charts
plot(AirPassengers)

# using iris data
str(iris)
par(mfrow = c(1, 1))
barplot(
    c(iris$Species, iris$Petal.Length),
    col = "yellow",
    xlab = "Species",
    ylab = "Petal Length (cm)"
)

barplot(
    table(iris$Species, iris$Petal.Length),
    col = palette.colors(n = 3, palette = "Set3"),
    xlab = "Petal Length (cm)",
    ylab = "Frequency"
)

# can use levels(iris$Species) as well. this picks out unique values in the data
# instead of putting x, y for position you can use locator() function
legend(43, 12, unique(iris$Species), col = palette.colors(n = 3, palette = "Set3"))

# creates a table of different categories, ex: species
flower_table <- table(iris$Species, iris$Petal.Length)
flower_table[1, "1.5"]# I can use the name of the column to pull data or I can use just the column number
