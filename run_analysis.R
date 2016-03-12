## Downloading and unzipping data files
if (!file.exists("./project")){dir.create("./project")}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./project/temp.zip")
unzip("./project/temp.zip", exdir="./project/data")

##Reading Activity labels and features into R
activity_labels  <- read.table("./project/data/UCI HAR Dataset/activity_labels.txt")
features  <- read.table("./project/data/UCI HAR Dataset/features.txt")

##Reading training data into R
subject_train  <- read.table("./project/data/UCI HAR Dataset/train/subject_train.txt")
X_train  <- read.table("./project/data/UCI HAR Dataset/train/X_train.txt")
y_train  <- read.table("./project/data/UCI HAR Dataset/train/y_train.txt")

#Extracting Mean and Standard Deviation Variables
features[,2] <- as.character(features[,2])
desired_features_logical  <- grepl("(.*)std(.*)",features[,2]) | grepl("(.*)mean(.*)",features[,2])
desired_features  <- features[,2][desired_features_logical]
desired_features <- gsub("[()]", "", desired_features)
desired_features <- gsub("-", "_", desired_features)
X_train_Desired  <- X_train[,desired_features_logical]


##Adding Names to Training Set Variables and Merging Train Dataset 
names(X_train_Desired) <- desired_features
names(subject_train)  <- "Subject_ID"
names(y_train) <- "Activity"
y_train[,1] <- as.factor(y_train[,1])
levels(y_train[,1]) <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
train_set  <- cbind(subject_train, y_train, X_train_Desired)

##Reading test data into R
subject_test  <- read.table("./project/data/UCI HAR Dataset/test/subject_test.txt")
X_test  <- read.table("./project/data/UCI HAR Dataset/test/X_test.txt")
y_test  <- read.table("./project/data/UCI HAR Dataset/test/y_test.txt")

##Extracting Mean and Standard Deviation variables
X_test_Desired  <- X_test[,desired_features_logical]


##Adding Names to test data Set Variables and Merging Test Data set 
names(X_test_Desired) <- desired_features
names(subject_test)  <- "Subject_ID"
names(y_test) <- "Activity"
y_test[,1] <- as.factor(y_test[,1])
levels(y_test[,1]) <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
test_set  <- cbind(subject_test, y_test, X_test_Desired)

##Merging test data set with train data set
merged_datasets  <- rbind(test_set, train_set)
ordered_merged_datasets  <- merged_datasets[order(merged_datasets$Subject_ID),]

##Creating an independent tidy data set with the average of each variable for each activity and each subject
tidy_data1 <- aggregate(ordered_merged_datasets[-c(1,2)], by=list(Subject_ID=ordered_merged_datasets$Subject_ID, Activity=ordered_merged_datasets$Activity), mean)
tidy_data <- tidy_data1[order(tidy_data1$Subject_ID),]

##Writing tidy_data dataframe to txt file
write.table(tidy_data, "./project/tidydata.txt", row.name=FALSE)

