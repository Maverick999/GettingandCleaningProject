##Code Book for Getting and Cleaning Project

## Background and Variable Descriptions
From the documentation contained in the original dataset (see Readme file for more information about the dataset), 
the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

For the tidy dataset contained in the repository, the only included variables are the mean and standard deviation of the variables listed above. Additionally, each variable in the tidy dataset is an average of each variable for each activity and each subject. The variable names adhere to the following conventions: 
- mean (Mean): variable_mean_axis (e.g., tBodyAcc_mean_X)
- std (Standard Deviation): variable_std_axis (e.g., tBodyAcc_std_X) 

Additionally, Subject_ID is a factor variable (taking on values from 1 to 30) that identifies the subject being measured. Activity is a factor variable that specifies the activity being performed by the subject (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, or Laying). 

##  Transformations performed to clean up the data
- Extracted Mean and Standard Deviation Variables for Train and Test datasets by searching for "mean" or "std" and subsetting the original table accordingly
- Merged test data set with train data set by binding rows together
- Created an independent tidy data set with the average of each variable for each activity and each subject by grouping data by subject and activity


