# Getting and cleaning data Code Book
## Data origin
The source dataset is "Human Activity Recognition Using Smartphones Data Set" can be found on the following place: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

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

2. activity: int
  - User activity number
  - The activity during which measurements where made
  - Possible values are:
    - 1: walking
    - 2: walking_upstairs
    - 3: waling_downstairs
    - 4: sitting
    - 5: standing
    - 6: laying

3. setid: int
  - The set id for the current observation
  - Two datasets are provided in order to compare results. One for development and tuning and one for testing.
  - Possible values are:
    - 1: development set
    - 2: test set

### Feature variables
#### Naming scheme
The feature variables are measurements the accelerometer and gyroscope contain in the smart phone.
The following naming scheme has been choosen:

```
domainFeature.statistic.dimension

i.e. timeBodyAcc.mean.X
     frequencyBodyGyro.mean.Z
```

#### Variables list

