# Getting and Cleaning Data Course Project.

The purpose of this proyect is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Dataset

The dataset used is from the Smartlab - Non Linear Complex Systems Laboratory by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto: Human Activity Recognition Using Smartphones Dataset.

They with a group of 30 volunteers within an age bracket of 19-48 years old. Each person perform six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone Samsung Galaxy S II on the waist. Using its embedded accelerometer and gyroscope, the group captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## Procedure

I write an R-scipt file, run_analysis.R, that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The R-script contains all code to build my solution to the problem given. Can be called with the following instruction: 

```R
    source('./run_analysis.R')
```
## Results

The script download the data file, uncompress it, changes the directory to the *UCI HAR Dataset* extracted from the download and executes all functions there and writes the data into the fil **TiddySet.txt**.

Finally, more descriptions are avaible in th file **CodeBook.md**.

