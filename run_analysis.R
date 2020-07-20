library(dplyr)

if (!dir.exists("data")) {
  dir.create("data")
} 
setwd("./data")
if (!file.exists("TidyDataExam.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "TidyDataExam.zip")
}

unzip("TidyDataExam.zip")

#Read the three files required:
#1. Features
features <- read.table(file = "./UCI HAR Dataset/features.txt", col.names = c("featNumber","feature"))
activities <- read.table(file = "./UCI HAR Dataset/activity_labels.txt",col.names = c("actNumber","activity"))
#2. Training data
xTrain <- read.table(file = "./UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
subjectTrain <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt",col.names = c("subject"))
activityTrain <- read.table(file = "./UCI HAR Dataset/train/y_train.txt",col.names = c("activity"))
#3. Test data
xTest <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
subjectTest <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
activityTest <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))

#Binding and merging the data
trainData <- cbind(xTrain, subject=subjectTrain, activity=activityTrain)
testData <- cbind(xTest, subject=subjectTest, activity=activityTest)
fullData <- rbind(trainData, testData)

trainData <- bind_cols(activityTrain, subjectTrain,  xTrain)
testData <- bind_cols(activityTest, subjectTest, xTest)
fullData <- rbind(trainData, testData)

#Structuring the tidy data frame
cleanData <-select(fullData, activity, subject, contains("mean") | contains("std"))


#Assigning the descriptive value to the activities
cleanData[cleanData$activity==1,1]=activities[1,2]
cleanData[cleanData$activity==2,1]=activities[2,2]
cleanData[cleanData$activity==3,1]=activities[3,2]
cleanData[cleanData$activity==4,1]=activities[4,2]
cleanData[cleanData$activity==5,1]=activities[5,2]
cleanData[cleanData$activity==6,1]=activities[6,2]

#Assigning descriptive names to the columns
names(cleanData)<-gsub("^t","Time",names(cleanData))
names(cleanData)<-gsub("^f","Frequency",names(cleanData))
names(cleanData)<-gsub("Acc","Acceleration",names(cleanData))
names(cleanData)<-gsub("mean","Mean",names(cleanData))
names(cleanData)<-gsub("MeanFreq","MeanFrequency",names(cleanData))
names(cleanData)<-gsub("std","StandardDeviation",names(cleanData))
names(cleanData)<-gsub("Mag","Magnitude",names(cleanData))

cleanData <- as_tibble(cleanData)

tidyDataSet <- cleanData %>%
  group_by(activity, subject) %>%
  summarise_all( mean)
