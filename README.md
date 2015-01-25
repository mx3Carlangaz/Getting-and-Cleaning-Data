# Getting-and-Cleaning-Data
## Course Project

### SCRIPT DESCRIPTION:

#### Data Source link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Data Source Description: 
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

### Calculation

Result.1: Each row represents an unique case, aggregating data by measurement mean and standar deviation:

ACTIVITY: action description 
SUBJECT: volunteer id
BODY_ACC_X_MEAN: The body acceleration mean signal obtained by subtracting the gravity from the total acceleration. Applies for "BODY_ACC_Y_MEAN" and "BODY_ACC_Z_MEAN" for Y and Z axis.
BODY_ACC_X_STD: The body acceleration standar deviation signal obtained by subtracting the gravity from the total acceleration. Applies for "BODY_ACC_Y_STD" and "BODY_ACC_Z_STD" for Y and Z axis.
BODY_ACC_Y_MEAN
BODY_ACC_Y_STD
BODY_ACC_Z_MEAN
BODY_ACC_Z_STD
BODY_GYRO_X_MEAN: The angular velocity mean measured by the gyroscope for each window sample. The units are radians/second. Applies for "BODY_GYRO_Y_MEAN" and "BODY_GYRO_Z_MEAN" for Y and Z axis.
BODY_GYRO_X_STD: The angular velocity standar deviation measured by the gyroscope for each window sample. The units are radians/second. Applies for "BODY_GYRO_Y_STD" and "BODY_GYRO_Z_STD" for Y and Z axis.
BODY_GYRO_Y_MEAN
BODY_GYRO_Y_STD
BODY_GYRO_Z_MEAN
BODY_GYRO_Z_STD
TOTAL_ACC_X_MEAN: The acceleration signal mean from the smartphone accelerometer X axis in standard gravity units 'g'. The same description applies for the "TOTAL_ACC_Y_MEAN" and "TOTAL_ACC_Z_MEAN"  for the Y and Z axis. 
TOTAL_ACC_X_STD: The acceleration signal standar deviate from the smartphone accelerometer X axis in standard gravity units 'g'. The same description applies for the "TOTAL_ACC_Y_STD" and "TOTAL_ACC_Z_STD"  for the Y and Z axis.
TOTAL_ACC_Y_MEAN
TOTAL_ACC_Y_STD
TOTAL_ACC_Z_MEAN
TOTAL_ACC_Z_STD


Result.2: Each row represents an aggregation of mean and standar deviation of measurementes by activity and subject.
