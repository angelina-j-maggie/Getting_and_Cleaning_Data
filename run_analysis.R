# run_analysis.R created by angelina.j.maggie
# Script will collect and clean the UCI HAR data set

library(data.table)
library(dplyr)
library(tidyr)

# Get the data

# Each dataset has 128 readings, per the recording (columns) and then n rows for the no. of recordings and has a extra dimension of being per person (subject_train.txt) - Inertial Signals
# The 561 different features are in features.txt and are columns in X_train.txt
# y_train.txt has the corresponding activity type for X_train.txt

train_y <- read.table("train/y_train.txt")
train_Xfr <- fread("train/X_train.txt")
test_Xfr <- fread("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
train_sub <- read.table("train/subject_train.txt")
test_sub <- read.table("test/subject_test.txt")

# This gives the names of the column variables in train_X
feature_names <- read.table("features.txt")
train_x_colnames <- feature_names$V2

# Remove the brackets, commas and dashes from the colnames
train_x_colnames <- gsub("-|,|\\(|\\)", "", train_x_colnames)
train_x_colnames <- tolower(train_x_colnames)

# The activities and subjects merged with train_X
colnames(train_Xfr) <- train_x_colnames
colnames(test_Xfr) <- train_x_colnames

train_Xfr$activity <- cbind(train_y)
test_Xfr$activity <- cbind(test_y)
train_Xfr$dataset <- "train"
test_Xfr$dataset <- "test"

train_Xfr$subject <- cbind(train_sub)
test_Xfr$subject <- cbind(test_sub)


# Merge the training and test sets into one dataset
merge_X <- rbind(train_Xfr, test_Xfr) # dims 10299 564

# Extract the mean and standard deviation for each measurement
merge_X_av <- select(merge_X, grep("mean|std|activity|subject|dataset", colnames(merge_X)))

# Name each of the activities in the dataset
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

merge_X_av$activity <- gsub(1, "walking", merge_X_av$activity)
merge_X_av$activity <- gsub(2, "walkingupstairs", merge_X_av$activity)
merge_X_av$activity <- gsub(3, "walkingdownstairs", merge_X_av$activity)
merge_X_av$activity <- gsub(4, "sitting", merge_X_av$activity)
merge_X_av$activity <- gsub(5, "standing", merge_X_av$activity)
merge_X_av$activity <- gsub(6, "laying", merge_X_av$activity)

# write the first tidy file to csv
write.csv(merge_X_av, "merge_x_av.csv")

# Create a tidy data set with the average of each variable for each activity and subject

# Remove std from the above data set
merge_X_av_nostd <- select(merge_X_av, grep("mean|activity|subject|dataset", colnames(merge_X_av))) # dims 10299 56

# Tidy on the activity type and subject
act_tidy <- gather(merge_X_av_nostd, activity, subject) # dims 56146 4

# write second tidy file to csv
write.csv(act_tidy, "act_tidy.csv")


