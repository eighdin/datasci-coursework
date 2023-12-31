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
cost_vector <- census_data$cellcost
cost_vector <- cost_vector[!is.na(cost_vector)]

range(census_data$cellcost)
range(cost_vector)
hist(census_data$cellcost)
hist(cost_vector)

census_data$cellcost
cellcost <- census_data$cellcost[!is.na(census_data$cellcost)]
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
legend(43, 12, unique(iris$Species), fill = palette.colors(n = 3, palette = "Set3"))

# creates a table of different categories, ex: species
flower_table <- table(iris$Species, iris$Petal.Length)
flower_table[1, "1.5"]# I can use the name of the column to pull data or I can use just the column number

boxplot(iris$Petal.Length ~ iris$Species, horizontal = TRUE)

vaccine_data <- read.csv("EUvaccine.csv")
View(vaccine_data)
barplot(vaccine_data$Perc_vaccinated ~ vaccine_data$region)
barplot(table(vaccine_data$region, vaccine_data$Perc_vaccinated))

# 10/2/2023 Classwork

library(maps)
library(ggplot2)
library(tidyverse)
mapdata <- map_data("world")
View(mapdata)

data1 <- data.frame(ID = 1:2, x1 = c("a1", "a2"), stringsAsFactors =  FALSE)
data2 <- data.frame(ID = 2:3, x2 = c("b1", "b2"), stringsAsFactors =  FALSE)
inner_join(data1, data2, by = "ID") #displays rows where there's an entry for data1 and data2
left_join(data1, data2, by = "ID") #display rows where there's an entry for data1
right_join(data1, data2, by = "ID") #display rows where there's an entry for data2
full_join(data1, data2, by = "ID") #display all rows
#mutating mapdata and vaccine_data

map_vaccine_data <- left_join(mapdata, vaccine_data, by = "region")
View(map_vaccine_data)

# set clean_map_vaccine_data as the combined data sets, then filter out all rows that have NA as Perc_vax
clean_map_vaccine_data <- filter(!is.na(map_vaccine_data$Perc_vaccinated))
View(clean_map_vaccine_data)

# Midterm Work 1
cool_pallete_color <- palette.colors(n = 1, palette = "Set3")
mosher_test_scores <- c(86, 81, 79, 71, 58, 87, 52, 71, 87, 87, 93, 64, 94, 81, 76, 98, 94, 68)

barplot(sort(mosher_test_scores), xlab = "Student", ylab = "Score %", col = cool_pallete_color)

# 10/9/2023 Classwork

install.packages(c("tm", "Snowballc", "wordcloud", "RColorBrewer"), dependencies = TRUE)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

text <- readLines(file.choose()) # select the speech from downloads file /home/bigguy/Downloads/speech.txt
View(text)
docs <- Corpus(VectorSource(text)) # seperate the speech into more docs
inspect(docs)

# filter the data
to_space <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, to_space, "/")
docs <- tm_map(docs, to_space, "@")
docs <- tm_map(docs, to_space, "\\|")

docs <- tm_map(docs, content_transformer(tolower))

docs <- tm_map(docs, removePunctuation)
# docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english"))

# 10/11/23 Work

docs <- tm_map(docs, stripWhitespace)
# docs <- tm_map(docs, stemDocument, language = "english")
docs_tdm <- TermDocumentMatrix(docs) # create TDM from filtered speech
docs_tdm_matrix <- as.matrix(docs_tdm)
v <- sort(rowSums(docs_tdm_matrix), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)
head(d, 10)

# create term-document matrix
test_doc <- c("Text analysis is fun", "I like doing text analysis")
vector_source <- Corpus(VectorSource(test_doc))
test_doc_term_matrix <- TermDocumentMatrix(vector_source)
inspect(test_doc_term_matrix)

# create word cloud
set.seed(1234)
rnorm(5)
wordcloud(
    words = d$word, freq = d$freq, min.freq = 1, max.words = 200,
    random.order = FALSE, rot.per = .2, colors = brewer.pal(8, "Dark2")
)

# 10/16/2023 Classwork

apple <- read.csv(file.choose(), header = TRUE)
str(apple)

apple_corpus <- Corpus(VectorSource(apple))

# 10/18/2023 classwork

install.packages(c("syuzhet", "lubridate", "ggplot2", "scales", "reshape2", "dplyr"))
library(syuzhet)
# syuzhet: sentiment analysis
# lubridate: useful for looking at dates of things and relating things to time
# ggplot2: useful for more sophisticated graphs
# scales: scaling data when visualizing data
# reshape2: restructure data visually
# dplyr: useful for manipulating dataframes

apple <- read.csv(file.choose(), header = TRUE)
tweets <- iconv(apple$text, to = "UTF-8")

sentiment <- get_nrc_sentiment(tweets)
head(sentiment, 10)

barplot(
    colSums(sentiment), las = 2, col = rainbow(10),
    ylab = "Total Count", main = "Sentiment analysis for apple tweets"
)

# HW 4
install.packages("ozmaps", dependencies = TRUE)
library(ggplot2)
library(ozmaps)
library(tidyverse)
str(ozmap_states) # Data is 9 rows x 2 columns
View(ozmap_states)

oz_states <- ozmap_states[ozmap_states$NAME != "Other Territories"]
oz_states <- ozmap_states %>% filter(NAME != "Other Territories")
oz_states <- ozmap_states[1:8, ]
oz_states <- ozmap_states[-9, ]
oz_states <- ozmap_states[9, 2]

View(oz_states)
australia_map <- ggplot() + geom_sf(data = oz_states, aes(fill = NAME))
australia_map <- ggplot(data = oz_states) + geom_sf(fill = ozmap_states$NAME)
australia_map

# 10/20/2023 classwork

basket <- read.csv("shoppingcart.csv", header = FALSE)
View(basket)

dim(basket)
colnames(basket) <- c("Date", "Transaction_ID", "Item")
colSums(is.na(basket)) #checks for missing values
any(is.null(basket)) #checks for null values

nrow(unique(basket)) # checks for duplicate values

basket <- unique(basket) # filters out duplicates
most_sold <- basket %>% group_by(Item) %>% count() %>% arrange(desc(n))

wordcloud2(most_sold, size = 0.13, shape = "circle")

# 10/25/2023 Classwork

basket$Year <- sapply(basket$Date, FUN = function(x) strsplit(x, split = "-") [[1]][1]) #Adding year column
mostsold_yr <- basket %>% group_by(Year) %>% count() %>% arrange(desc(n)) #new var storing the years & amt sold

ggplot(
    mostsold_yr,
    aes(x = Year, y = n)
) + geom_bar(
    stat = "identity",
    aes(fill = as.factor(Year)),
    show.legend = FALSE
) + ggtitle(
    "Yearly Sales"
) + theme_bw()

barplot(mostsold_yr$n, names.arg = mostsold_yr$Year, col = palette.colors(n = 3, palette = "Set 3"))

# HW# 5

# i)
raw_health_data <- read.csv("TeamHealthRawDataForDemo.txt")
health_data <- Corpus(VectorSource(raw_health_data))
to_space <- content_transformer(function(x, pattern) gsub(pattern, " ", x))

health_data <- tm_map(health_data, content_transformer(tolower))
health_data <- tm_map(health_data, removePunctuation)
health_data <- tm_map(health_data, removeWords, stopwords("english"))

health_data_tdm <- TermDocumentMatrix(health_data)
health_data_tdm_matrix <- as.matrix(health_data_tdm)
health_data_vector <- sort(rowSums(health_data_tdm_matrix), decreasing = TRUE)
health_data_df <- data.frame(word = names(health_data_vector), freq = health_data_vector)
head(health_data_df, 5)

# ii)
ggplot(
    head(health_data_df),
    aes(x = reorder(word, freq), y = freq)
) + geom_bar(
    stat = "identity",
    aes(fill = as.factor(word)),
    show.legend = FALSE
) + ggtitle(
    "Word Frequency"
)

# iii)
head(health_data_df, 8)

# iv)
set.seed(1234)
wordcloud(
    words = health_data_df$word, freq = health_data_df$freq, min.freq = 5, max.words = 100,
    random.order = FALSE, rot.per = .4, colors = brewer.pal(8, "Dark2")
)

# Days i Missed

basket$Month <- sapply(basket$Date, FUN = function(x) strsplit(x, split = "-") [[1]][2]) #Adding year column
basket$Date <- as.Date(basket$Date)
basket$Month <- format(basket$Date, "%m")

mostsold_month <- basket %>% group_by(Month) %>% count() %>% arrange(desc(n)) #new var storing the years & amt sold
ggplot(
    mostsold_month,
    aes(x = Month, y = n)
) + geom_bar(
    stat = "identity",
    aes(fill = as.factor(Month)),
    show.legend = FALSE
) + ggtitle(
    "Sales over Months"
)

# 11/1/2023 classwork

basket_trans <- split(x = basket[, "Item"], f = basket$Transaction_ID)

basket_trans <- as(basket_trans, "transactions")
summary(basket_trans)

#visualize item freq
itemFrequencyPlot(basket_trans, topN = 20, type = "absolute")

#apriori algorithm
apriori_rules <- apriori(basket_trans, parameter = list(sup = 0.15, conf = 0.8, target = "rules"))
summary(apriori_rules)
inspect(apriori_rules)

install.packages("arulesViz", dependencies = TRUE)
library(arulesViz)

#11/6/2023 classwork
plot(apriori_rules)
plot(head(sort(apriori_rules, by = "lift"), 22), method = "graph")

#interactive maps
plot(head(sort(apriori_rules, by = "lift"), 22), method = "graph", interactive = TRUE)

plot(head(sort(apriori_rules, by = "lift"), 22), method = "graph", engine = "html")

# grouped data
plot(apriori_rules, method = "grouped")

# display rules in decreasing order

inspect(sort(apriori_rules, by = "lift", decreasing = TRUE))
apriori_rules %>% sort(by = "lift", decreasing = TRUE) %>% inspect()

best_rules <- apriori_rules[quality(apriori_rules)$lift > 1.215]

# more classwork
advertising_data <- read.csv('Advertising.csv')
dim(advertising_data)

simple_lin <- lm(formula = Sales ~ Radio, data = advertising_data)
summary(simple_lin)

# Multi-layered visual
ggplot(simple_lin, aes(x = Radio, y = Sales)) + geom_point() + stat_smooth(method = "lm", col = "red", fill = "yellow")

#scatter-plot with line of best fit
plot(advertising_data$Radio, advertising_data$Sales, main = "Radio vs Sales", col = "blue")
abline(simple_lin, col = "red", lwd = 2)
plot(advertising_data)

#multiple linear regression
multi_lin <- lm(Sales ~ Radio + TV + Newspaper, data = advertising_data)
summary(multi_lin)
plot(advertising_data$Radio ~ advertising_data$Sales)
summary(mtcars)
plot(mtcars)
