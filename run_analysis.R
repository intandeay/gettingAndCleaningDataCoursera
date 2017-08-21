# download file and then unzip

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "dataset.zip"

# Check if zip file is already exists or not. If not, download from the url
if (!file.exists(zipFileName)){
  print("Download File")
  download.file(fileUrl, zipFileName)
}

# Check if zip file is unzipped. If not, unzip it
if (!file.exists("UCI HAR Dataset")){
  print ("Unzip File")
  unzip(zipFileName)
}

# load all required tables
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Task 1: Merge the training and the test sets to create one data set.

# Merge the test table with corresponding order: subject, y, x table
test_data <- cbind(subject_test, y_test, x_test)
# Merge the train table: subject, y, x table
train_data <- cbind(subject_train, y_train, x_train)
# Merge test and train data 
merge_tbl <- rbind(test_data, train_data)

# Task 4: Appropriately labels the data set with descriptive variable names.
# Rename column with respected variable
colnames(merge_tbl) <- c("subject", "activity", as.character(features[,2]))

# Task 2: Extracts only the measurements on the mean and standard deviation 
# for each measurement.
# subset column
mean_std_cols <- grep("mean|std", features[,2], value = "TRUE")
subset_tbl <- merge_tbl[,c("subject", "activity", mean_std_cols)]

# Task 3: Uses descriptive activity names to name the activities in the data set
subset_tbl$activity <- as.character(activity_labels[subset_tbl$activity, 2])

# Task 4: Appropriately labels the data set with descriptive variable names.
# Replace "-()" with empty string
colnames(subset_tbl) <- gsub("[-()]", "", colnames(subset_tbl))
# Replace "mean" and "std" with "Mean" and "Std"
colnames(subset_tbl) <- gsub("mean", "Mean", colnames(subset_tbl))
colnames(subset_tbl) <- gsub("std", "Std", colnames(subset_tbl))

# Task 5: creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
tidy_data <- aggregate(.~subject + activity, subset_tbl, mean)
# Order data by subject and by activity
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity),]

write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)