# Getting_and_Cleaning_Data
Course 3 Assignment in Data Science Coursera

# Overview
The aim for the script, run_analysis.R is to tidy up the data set UCI HAR. 

The data set contains information on 30 subjects doing 6 different activities.

# Code
The run_analysis.R file works in 6 steps:

1. Load in data and assign train/test
2. Add tidy column names to determine what they are
3. Assign the activity to each
4. Merge the 2 data sets
5. Remove all columns that are not the mean and standard deviation of each variable
6. Create a second tidy data set with the average of each variable for each activity and subject


# Output Files
"merge_x_av.csv" provides a format that gives both the mean and standard deviations for each variable in the data set. 

"act_tidy.csv" provides a data set whereby the variable means are provided by activity type and then subject person. 
