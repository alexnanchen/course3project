# Getting and cleaning data Code Book
## Data origin
The original dataset is called "Human Activity Recognition Using Smartphones Data Set" and can be found on the following location: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This code book is for a tidy version of this dataset.

## Data preparation
The following steps have been performed:

1. Merge of train and test data keeping the information about which set the data came from
2. Extraction of mean and std statistics from the set of features
3. Variables name normalization: 
  - Parentheses and hyphens have been replace by dots
  - Expansion of the first letter of the variables: t into time and f into frequency
4. Activity labels expansion: numbers have been translated into words for better readability
5. Grouping of measurements by activity and subject

The final dataset contains 69 variables and 10299 observations.

## Variables
### Meta variables
1. userid: int
  - User identifiant
  - An integer between 1 and 30

2. activity: char
  - User activity 
  - The activity during which measurements where made
  - Possible values are:
    - walking
    - walking_up
    - waling_down
    - sitting
    - standing
    - laying

3. set: int
  - The set id for the current observation
  - Two datasets are provided in order to compare results. One for development and tuning and one for testing.
  - Possible values are:
    - 1: development set
    - 2: test set

### Feature variables
#### Naming scheme
The feature variables are measurements the accelerometer and gyroscope contained in the smart phone.
The following naming scheme has been choosen:

```
domainFeature.statistic.dimension

i.e. timeBodyAcc.mean.X
     frequencyBodyGyro.mean.Z
```

#### Variables list
Each feature variable is of numeric type.

Here is a list of all feature variables:

- timeBodyAcc.mean.X
- timeBodyAcc.mean.Y
- timeBodyAcc.mean.Z
- timeGravityAcc.mean.X
- timeGravityAcc.mean.Y
- timeGravityAcc.mean.Z
- timeBodyAccJerk.mean.X
- timeBodyAccJerk.mean.Y
- timeBodyAccJerk.mean.Z
- timeBodyGyro.mean.X
- timeBodyGyro.mean.Y
- timeBodyGyro.mean.Z
- timeBodyGyroJerk.mean.X
- timeBodyGyroJerk.mean.Y
- timeBodyGyroJerk.mean.Z
- timeBodyAccMag.mean
- timeGravityAccMag.mean
- timeBodyAccJerkMag.mean
- timeBodyGyroMag.mean
- timeBodyGyroJerkMag.mean
- frequencyBodyAcc.mean.X
- frequencyBodyAcc.mean.Y
- frequencyBodyAcc.mean.Z
- frequencyBodyAccJerk.mean.X
- frequencyBodyAccJerk.mean.Y
- frequencyBodyAccJerk.mean.Z
- frequencyBodyGyro.mean.X
- frequencyBodyGyro.mean.Y
- frequencyBodyGyro.mean.Z
- frequencyBodyAccMag.mean
- frequencyBodyBodyAccJerkMag.mean
- frequencyBodyBodyGyroMag.mean
- frequencyBodyBodyGyroJerkMag.mean
- timeBodyAcc.std.X
- timeBodyAcc.std.Y
- timeBodyAcc.std.Z
- timeGravityAcc.std.X
- timeGravityAcc.std.Y
- timeGravityAcc.std.Z
- timeBodyAccJerk.std.X
- timeBodyAccJerk.std.Y
- timeBodyAccJerk.std.Z
- timeBodyGyro.std.X
- timeBodyGyro.std.Y
- timeBodyGyro.std.Z
- timeBodyGyroJerk.std.X
- timeBodyGyroJerk.std.Y
- timeBodyGyroJerk.std.Z
- timeBodyAccMag.std
- timeGravityAccMag.std
- timeBodyAccJerkMag.std
- timeBodyGyroMag.std
- timeBodyGyroJerkMag.std
- frequencyBodyAcc.std.X
- frequencyBodyAcc.std.Y
- frequencyBodyAcc.std.Z
- frequencyBodyAccJerk.std.X
- frequencyBodyAccJerk.std.Y
- frequencyBodyAccJerk.std.Z
- frequencyBodyGyro.std.X
- frequencyBodyGyro.std.Y
- frequencyBodyGyro.std.Z
- frequencyBodyAccMag.std
- frequencyBodyBodyAccJerkMag.std
- frequencyBodyBodyGyroMag.std
- frequencyBodyBodyGyroJerkMag.std
