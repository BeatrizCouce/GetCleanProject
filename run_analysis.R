




# 
library(data.table)
library(dplyr)
library(tidyr)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClass="numeric")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", colClass="numeric")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClass="numeric")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", colClass="numeric")
features <- readLines("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)


# 1. Merges the training and the test sets to create one data set.
x_both <- rbind(x_test, x_train, all =TRUE)
y_both <- rbind(y_test, y_train, all =TRUE)

names(x_both) <-features

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
m_mean<-sapply(x_both,mean)
m_sd <- sapply(x_both, sd)

names(m_mean) <-paste("mean of", features) 
names(m_sd) <-paste("standard deviation of", features) 


# 3. Uses descriptive activity names to name the activities in the data set



# 4. Appropriately labels the data set with descriptive variable names. 


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

step5 <-data.table(m_mean, m_sd)



