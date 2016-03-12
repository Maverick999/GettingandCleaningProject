# GettingandCleaningProject
## Introduction

The tidy dataset in the repository was generated from the "Human Activity Recognition Using Smartphones Dataset," Version 1.0, which was created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto (see License below).

##Goals
The purpose for creating the tidy dataset was to achieve the following goals:
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names.
- From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.

##Description
According the readme document contained in the raw dataset, 30 volunteers between the ages of 19 and 48 performed six activities,  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

In the original dataset, each record included the following:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The tidy dataset included in this repository extracted only the mean and standard deviation for each variable (where available), which was then averaged for each activity and each subject.

An R script containing the process of achieving the stated goals stated above along with a codebook that summarizes the data transformation process as well as describes the variables are also included in this repository. 

##About the R Script
- Extracts Mean and Standard Deviation Variables for Train and Test datasets by searching for "mean" or "std" and subsetting the original table accordingly
- Merges test data set with train data set by binding rows together
- Activities were changed from numeric values to characters to provide a more meaningful description
- Created an independent tidy data set with the average of each variable for each activity and each subject by grouping data by subject and activity

License:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
