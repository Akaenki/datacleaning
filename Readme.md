# Introduction

This is an R program that convert the [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to a more descriptive and tidy form. Please make sure the dataset is in a folder named "Dataset" before running the script

# Description of run_analysis.R
This script requires the "dplyr" packaged. First load the package:
```
library(dplyr)
```
Then load the feature data of the original dataset
```
features <- read.table("Dataset/features.txt")
```
Here we only need the mean and standard deviation of each measurements, which contains "mean()" and "std()". This line find the indices of those measurements.
id <- grep("(mean[(][)])|(std[(][)])",features[,2])

Read the train and test files,  with the column name described in features.
```
train <- read.table("Dataset/train/X_train.txt", col.names = features[,2],colClasses = "numeric")
test <- read.table("Dataset/test/X_test.txt", col.names = features[,2],colClasses = "numeric")
```
Subsetting the loaded data for the measurements we wnat.
```
train <- train[,id]
test <- test[,id]
```
Append the activity and subject data of the train and test data to the end of each datasets and create a new column called "dataset" to indicate whether the data is come from train or test after combination.
```
train$activity <- as.vector(read.table("Dataset/train/y_train.txt")[[1]])
train$subject <- as.vector(read.table("Dataset/train/subject_train.txt")[[1]])
train$dataset <- "train"

test$activity <- as.vector(read.table("Dataset/test/y_test.txt")[[1]])
test$subject <- as.vector(read.table("Dataset/test/subject_test.txt")[[1]])
test$dataset <- "test"
```
Merge the train and test data
```
merged <- rbind(train, test)
```
Change the activity name, which is represented by numbers of 1-6 in the original dataset to factors, with the factor names read from the "activity_labels.txt" file in the original dataset.
```
act_factor <- as.factor(merged$activity)
factor <- read.table("Dataset/activity_labels.txt")
levels(act_factor) <- factor[,2]
merged$activity <- act_factor
```
Then change the original column names to a more descriptive form, so that they can describe themselves. First load the column names into a variable
```
nm <- names(merged)
```
Every measurements start with t means measurements in the time space
```
nm <- gsub("^t","Time.Space.",nm)
```
Every measurements start with f means a Fourier transform of the time space measurements. And change the simple "f" into "Frequency Space"
```
nm <- gsub("^f","Frequency.Space.",nm)
```
The abbraviation "Acc" in the original dataset means the measurement of linear accelation and "Gyro" means the angular velocity and "Mag" for magnitude
```
nm <- gsub("Acc",".Linear.Acceleration.",nm)
nm <- gsub("Gyro",".Angular.Velocity.",nm)
nm <- gsub("Mag",".Magnitude.",nm)
```
Final clean the format of the names and assign back to the data frame
```
nm <- gsub("[.]{2,3}",".",nm)
nm <- gsub("[.]{1,}$","",nm)
nm <- gsub("([a-z])([A-Z])","\\1.\\2",nm)
names(merged) <- nm
```
Group the merged dataset by activity and subject and calculate the mean of all the measurements. The last column, which indicates whether the data is come from train of test of the dataset is excluded because it's not a measurement.
```
result <- merged [-69] %>% group_by(activity, subject) %>% summarise_all("mean")
```
Finally write the parsed tidy dataset to a txt file
```
write.table(result,"cleandata.txt",sep="\t",row.names=FALSE)
```

