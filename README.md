## Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Requirement:
  1- Merges the training and the test sets to create one data set.
  
  2- Extracts only the measurements on the mean and standard deviation for each measurement.
  3- Uses descriptive activity names to name the activities in the data set
  4- Appropriately labels the data set with descriptive variable names.
  5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
  each activity and each subject.
  
## The R script, run_analysis.R, does the following:
  1.Download the zip file from URL
  2.Extract zip file
  3.Set work directory 
  4.Read the activity and feature info
  5.Read both the training and test datasets, keeping only those columns which refer to mean or standard deviation
  6.Merges the two datasets
  7.Converts the activity and subject columns into factors
  8.Melted dataset & dcast to calc the average of each variable for each activity and each subject.
  9.Creates independent tidy data set with the average of each variable for each activity and each subject.
  10.The end result is shown in the file tidy.txt.


