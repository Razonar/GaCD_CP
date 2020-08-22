# Code Book

Alvaro Diaz Falconi, August 2020.

This file describes the variables, the data, and transformations that was performed to clean up the data.

## Main Variables

| Variable      | Description   |
| ------------- |---------------|
| names | has all column names from features.txt |
| x_test | has data from X_test.txt |
| x_train | has data from X_train.txt |
| activityDesc | has the description for the activity each volunteer had to do for the experiment |
| TiddySet | has the final tidy data | 

## Main Data

### x_train and x_test

Builded from the files X_train.txt and X_test.txt taking the information for activity and subject.

### TiddySet.txt

Contains the average for each variable considered.

## Main Transformations

### M1

Is x_train union x_test.

### M2

Used grep to select only the column containing the std or the mean of each variable.

### M3

Used aggregate to group by subject and activity.
