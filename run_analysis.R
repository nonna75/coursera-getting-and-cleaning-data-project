library(data.table)
#download file
url_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_file, "hmar.zip")

#extract zip file
zip.file.extract(file, zipname="hmar.zip")
unzip("hmar.zip")

#set work directory 
setwd("UCI HAR Dataset")

#read activity label
activity_label <- read.table("activity_labels.txt")
activity_label[,2] <- as.character(activity_label[,2])

#read features
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
featuresSelect <-  grep(".*mean.*|.*std.*", features[,2])
featuresNames <-  grep(".*mean.*|.*std.*", features[,2], value = TRUE)
featuresNames <- gsub("-mean", "Mean", featuresNames)
featuresNames <- gsub("-std", "Std", featuresNames)
featuresNames <- gsub("[-()]", "", featuresNames)

#read dataset train and keep only the cloums which refer to mean or standard deviation
train <- read.table("train/X_train.txt")[featuresSelect]
y_traing <- read.table("train/Y_train.txt")
subject_train <-read.table("train/subject_train.txt")
train <- cbind(subject_train,y_traing,train)


#read dataset test dataset and keep only the cloums which refer to mean or standard deviation
test <- read.table("test/X_test.txt")[featuresSelect]
y_test <- read.table("test/Y_test.txt")
subject_test <-read.table("test/subject_test.txt")
test <- cbind(subject_test,y_test,test)

#Merge traing and test set 
dataset <- rbind(train, test)
colnames(dataset) <- c("subject", "activity", featuresNames)

# turn activities & subjects into factors
dataset$activity <- factor(dataset$activity, levels = activity_label[,1], labels = activity_label[,2])
dataset$subject <- factor(dataset$subject)

# melted dataset & dcast to calc the average of each variable for each activity and each subject.
dataset.melted <- melt(dataset, id = c("subject", "activity"))
dataset.mean <- dcast(dataset.melted, subject + activity ~ variable, mean)

# create tidy data
write.table(dataset.mean, "tidy.txt", row.names = FALSE, quote = FALSE)