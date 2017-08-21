# Code Book

# Variables and Units

All the variables/measurements started with 't' are in time-domain, while variables started with 'f' are in frequency domain
Column "subject" in tidy dataset represents the person who was doing that measurement.
Column "activity" in tidy dataset represents the activity the person was doing in that measurement

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

# Variables in run_analysis.R

- fileUrl = link of the raw dataset
- zipFileName = file name assigned for the downloaded dataset
- x_test = dataset read from x_test.txt. 
- y_test = dataset read from y_test.txt. 
- subject_test = dataset read from subject_test.txt
- x_train = dataset read from x_train.txt. 
- y_train = dataset read from y_train.txt. 
- subject_train = dataset read from subject_train.txt
- features = dataset read from features.txt
- activity_labels = dataset read from activity_labels.txt
- test_data = merged table that comes from x_test, y_test, subject_test
- train_data = merged table that comes from x_train, y_train, subject_train
- merge_tbl = table merged from test_data and train_data
- mean_std_cols = all the value in features that contains "mean" or "std"
- subset_tbl = table came from merge_tbl that only contains the feature having "mean" or "std" in their names and also activity and subject
- tidy_data = dataset from subset_tbl that is derived by calculating the mean of every combination of subject and activity
