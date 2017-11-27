#load packages
library(dplyr)

#read feature file
features <- read.table("Dataset/features.txt")
#find column indices of means and stadard deviations
id <- grep("(mean[(][)])|(std[(][)])",features[,2])

#read data files
train <- read.table("Dataset/train/X_train.txt", col.names = features[,2],colClasses = "numeric")
test <- read.table("Dataset/test/X_test.txt", col.names = features[,2],colClasses = "numeric")
#only keep the cols we want
train <- train[,id]
test <- test[,id]
#append activity and subject id
train$activity <- as.vector(read.table("Dataset/train/y_train.txt")[[1]])
train$subject <- as.vector(read.table("Dataset/train/subject_train.txt")[[1]])
train$dataset <- "train"

test$activity <- as.vector(read.table("Dataset/test/y_test.txt")[[1]])
test$subject <- as.vector(read.table("Dataset/test/subject_test.txt")[[1]])
test$dataset <- "test"

#merge train and test data
merged <- rbind(train, test)

#substitute activity names
act_factor <- as.factor(merged$activity)
factor <- read.table("Dataset/activity_labels.txt")
levels(act_factor) <- factor[,2]
merged$activity <- act_factor

#make the variable names more readable
nm <- names(merged)
nm <- gsub("^t","Time.Space.",nm)
nm <- gsub("^f","Frequency.Space.",nm)
nm <- gsub("Acc",".Linear.Acceleration.",nm)
nm <- gsub("Gyro",".Angular.Velocity.",nm)
nm <- gsub("Mag",".Magnitude.",nm)
nm <- gsub("[.]{2,3}",".",nm)
nm <- gsub("[.]{1,}$","",nm)
nm <- gsub("([a-z])([A-Z])","\\1.\\2",nm)
names(merged) <- nm

#create a tidy table with mean of each observation
result <- merged [-69] %>% group_by(activity, subject) %>% summarise_all("mean")
#write table
write.table(result,"cleandata.txt",sep="\t",row.names=FALSE)
