managers_data <- read.csv("C:/Users/AoibheannSims/Downloads/managers.csv")
managers_data

more_managers_data <- read.csv("C:/Users/AoibheannSims/Downloads/MoreData.csv")
more_managers_data


View(managers_data)
View(more_managers_data)

# check structure of data frames
str(managers_data)
str(more_managers_data)

# show headers of both dataset
names(managers_data)
names(more_managers_data)

# update more_managers_data with mathc

more_managers_data <- more_managers_data[, c("Date",
                                             "Country",
                                             "Gender",
                                             "Age",
                                             "Q1",
                                             "Q2",
                                             "Q3",
                                             "Q4",
                                             "Q5")]
View(more_managers_data)

#Confirm that both data frames are identical
head(managers_data)
head(more_managers_data)

rbind(managers_data, more_managers_data)

attach(more_managers_data)
more_managers_data$AgeCat[Age >= 45] <- "Elder"
more_managers_data$AgeCat[Age >= 26 & Age <= 44] <- "Middle Aged"
more_managers_data$AgeCat[Age <= 25] <- "Young"
more_managers_data$AgeCat[is.na(Age)] <- "Elder"
detach(more_managers_data)

head(more_managers_data)

attach(more_managers_data)
more_managers_data$Answer.total <- Q1 + Q2 + Q3 +Q4 +Q5
more_managers_data$mean.value <- rowMeans(more_managers_data[5:9])
detach(more_managers_data)

names(managers_data)
names(more_managers_data)
                                        

# get rid of x column as it has no significance
managers_data_1 <- managers_data[,2:13]

managers_data_1 <- rbind(managers_data_1, more_managers_data)

View(managers_data_1)

