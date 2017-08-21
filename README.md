# gettingAndCleaningDataCoursera
This repository contains the files for final project from course Getting and Cleaning Data in Coursera

# Dataset

Dataset processed in this repository comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Files Inside This Repo

- run_analysis.R = script that processes the dataset into tidy data set
- tidy_data.txt = tidy dataset output achieved by running run_analysis.R
- codebook.md = code book explaining run_analysis.R and the variables inside the data set and the script
- README.md = note about this repository

# Steps to achieve the tidy dataset

1. Check whether the file has already been downloaded or not.
2. If not, download the data set.
3. Check whether the data set has been unzipped or not
4. If not, unzip the dataset
5. Load all the required tables:
	- subject_test.txt
	- x_test.txt
	- y_test.txt
	- subject_train.txt
	- x_train.txt
	- y_train.txt
	- features.txt
	- activity_labels.txt
6. Bind the subject_test, x_test, and y_test in/by column
7. Bind the subject_train, x_train, and y_train in/by column
8. Bind the resulting table from step 6 and 7 in/by row
9. Name the first two columns with "subject" and "activity", and name the rest of the columns with the content of second column in features.txt
10. Obtain all the column names that have "mean" or "std" in their names.
11. Subset those columns and subject and activity columns
12. Change content of column "activity" by matching them with activity_labels.txt
13. Tidy/beautify column names
14. Make a new table which contains the mean of every combination of subject and activity.
15. Create a new file from that table
