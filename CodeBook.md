Tidyng Human Activity Recognition Using Smartphones Data Set

Author: Carlos Torres

Objectvive:
This project consist of the cleaning and tidying the data from Human Activity 
Recognition Using Smartphones Data Set machine learning experiment as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.

Data:
This machine learning experiment was built from the recordings of 30 subjects 
performing activities of daily living (ADL) while carrying a waist-mounted 
smartphone with embedded inertial sensors.The ADL included the following types 
of activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING 
and LAYING. The oabservations where divided into train(70%) and test(30%)

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The full description of the original data is available in the link below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original date is available in the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The specific files used to develop the current project are tthe following:
./UCI HAR Dataset/features.txt.............Names of each of the 561 measured variables
./UCI HAR Dataset/activity_labels.txt......Names of the types of activity
./UCI HAR Dataset/train/X_train.txt........7352 records, each one with 561 variables measured
./UCI HAR Dataset/train/subject_train.txt..7352 records, each line indicates the activity of the X_train record
./UCI HAR Dataset/train/y_train.txt........7352 records, each line indicates the subject of the X_train record
./UCI HAR Dataset/test/X_test.txt..........2947 records, each one with 561 variables measured
./UCI HAR Dataset/test/subject_test.txt....2947 records, each line indicates the activity of the X_test record
./UCI HAR Dataset/test/y_test.txt..........2947 records, each line indicates the subject of the X_test record

Data Transformation
1. In order to accomplish the objectives listed above, the following transformations 
on the data were performed:
2. For each one of train and test data, a data set was created by joining the activity 
(labeled as "activity"), subject  (labeled as "subject") and variables data sets 
(using the feature variable names as labels).
3. The records from both train and test datasets where joined in the same dataset.
4. Using the name of the labels (features) the data set was subsetted by extracting 
the activity, subject, and mean ("mean") and standard deviation ("std") columns 
(88 columns in total)
5. In order to obtain descriptive variable names the following transformatios were made to the column name:
   Column that began with "t": "t" was replaced with "Time"
   Column that began with "f": "f" was replaced with "Frequency"
   "Acc" was replaced with "Acceleration"
   "mean" was replaced with "Mean"
   "MeanFreq" was replaced with "MeanFrequency"
   "std" was replaced with "StandardDeviation"
   "Mag" was replaced with "Magnitude"
   The tidy data is stored in the cleanData data frame
6. A summary table was created what contains the average value for each variable
per each activity - subject combination.
