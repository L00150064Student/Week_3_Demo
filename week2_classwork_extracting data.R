# Deleting attributes from data


managers <- read.csv("C:/Users/AoibheannSims/Downloads/managers.csv")
managers

# This command shows all attributes where Q3 or Q4 are contained
# The ! operator reverses this choice 
include_list <- names(managers) %in% c("Q3", "Q4") 
include_list
# This list can be used to extract this data 
new_data <- managers[(include_list)]
new_data
is.data.frame(new_data)

# Using the subset function
# to extract all records from my_data where age > 35 or age < 24. Only select the 
# listed attributes

new_data <- subset(managers, managers$Age >= 35 | managers$Age < 24, select = c(Q1, Q2, Q3, Q4)) 
new_data



#How would we select a subset of managers called new_managers where gender = M 
#and age > 25. Show all attributes between Gender and Q4 only
attach(managers)
new_managers <- subset(managers, Gender == 'M' & Age>25, select= c(4:9))
new_managers



# Selecting a random sample from my_data my_sample <-

my_sample <- managers[sample(1:nrow(managers), 3, replace = FALSE),] 
my_sample

my_sample <- managers[sample(1:nrow(managers), 10, replace = TRUE),] 
my_sample
