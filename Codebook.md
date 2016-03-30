# Codebook for run_analysis.R

This script requires the data from the UCI HAR experiment on subject movement in different exercises:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It can be downloaded and then unzipped using:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectiles%2FUCI%20HAR%20Dataset.zip


# Variables in the code

The variables below describe the 3D movement in space for each subject and these form the columns in the data.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Of interest were the mean and standard deviations of these. And then they are further tidied by activity type and subject. 


# Operations in the code

The run_analysis.R code will input from the UCI HAR Dataset directory. It will take the information for each activity and subject in the training and test sets. 

It merges the training and test sets, using tidy variable names and outputs to "merge_x_av.csv"

It then reformats the merged dataset so that the means of each variable are recorded by activity and subject. This is then outputted as "act_tidy.csv"

# Output of the code

There are two outputs:

1. Provides the mean and standard deviations for the above variables for each activity and subject in both the training and test data sets

"merge_x_av.csv"

2. Provides the mean values for the above variables according to activity and subject

"act_tidy.csv"
