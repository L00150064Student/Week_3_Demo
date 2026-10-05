
Subject <- c(1:7)
Gender <- c("Male", "Male", "Male", NA, "Female", "Female", "Female")
Age <- c(23, 34, 32, 54, 65, 45, 35)
Weight <- c(67.5, NA, 63.7, 56.8, 89.9, 87.5, 77.5)

Trial <- data.frame(Subject, Gender, Age, Weight)

View(Trial)


Trial[4,3]
Trial[,3]
Trial[4,]

install.packages("data.table")
library(data.table)
setnames(Trial, old='Subject', new='Participant')

View(Trial)

# identify null values
Trial[!complete.cases(Trial), ]

#Set weight of participant 2 to 65

Trial$Weight[Trial$Participant==2] <- 65.0

Trial$Gender[Trial$Participant==4] <- 'Female'

#survey table

manager <- 1:5
date <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country <- c("US", "US", "IRL", "IRL", "IRL")
gender <- c("M", "F", "F", "M", "M")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

managers_data <- data.frame(manager, date, country, gender, age, q1, q2, q3, q4, q5)

View(managers_data)

column_names <- c("Manager", "Date", "Country", "Gender", "Age",
                  "Q1", "Q2", "Q3", "Q4", "Q5")

colnames(managers_data) <- column_names
# Show the first 5 rows
head(managers_data, 5)

# Show the structure of the data frame
str(managers_data)
managers_data$Age[managers_data$A==99] <- NA

#drop managers column
managers_data1 <- subset(managers_data, select = -Manager)
managers_data1
View(managers_data1)

#drop first column - same result as previous
managers_data2 <- subset(managers_data, select = -1)
managers_data2
View(managers_data2)

managers_data <- managers_data[, c(2:10)]

#Create new attribute called AgeCat and set values

managers_data$AgeCat <- 5
managers_data

managers_data$AgeCat <- c(1:5)

managers_data <- managers_data[, c(1:9)]
managers_data

# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age NA to Elder
managers_data$AgeCat[managers_data$Age <= 25] <- "Young"
managers_data$AgeCat[managers_data$Age >= 26 & managers_data$Age <= 44] <- "Middle Aged"
managers_data$AgeCat[managers_data$Age >= 45] <- "Elder"
managers_data$AgeCat[is.na(managers_data$Age)] <- "Elder"
View(managers_data)

class(managers_data$AgeCat)

# Recode AgeCat so that it is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll store the ordinal factored data in variable 'AgeCat'
managers_data$AgeCat <- factor(managers_data$AgeCat, 
                               order = TRUE, 
                               levels = c("Young", "Middle Aged", "Elder"))


#factor(managers_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

class(managers_data$AgeCat)

# Replace managers's AgeCat attribute with newly ordinal factored data
managers_data$AgeCat <- AgeCat
managers_data

#Contains a summary of each row

managers_data$summary_col <- managers_data$Q1 + managers_data$Q2 
+ managers_data$Q3 + managers_data$Q4

View(managers_data)

#managers_data <- managers_data[, c(1:10)]
#managers_data

summary_col <- managers_data$Q1 + managers_data$Q2 
+ managers_data$Q3 + managers_data$Q4

managers_data <- data.frame(managers_data, summary_col)

managers_data