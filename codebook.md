# Code Book

# Variables and Units

All the variables/measurements started with 't' are in time-domain, while variables started with 'f' are in frequency domain
Column "subject" in tidy dataset represents the person who was doing that measurement.
Column "activity" in tidy dataset represents the activity the person was doing in that measurement

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
