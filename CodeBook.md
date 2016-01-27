# Getting and cleaning data Code Book
## Data
The source dataset is "Human Activity Recognition Using Smartphones Data Set" can be found on the following place: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This code book is for a tidy version of this dataset.
## Format
The information provided for each variable is under the following format:

Variable short name: variable size
- Variable name
- Description
- Unit
- Possible values

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
1. dimension: char of size 1
  - The dimension for which the observation applies
  - Three dimension are possible, X,Y and Z
  - Possible values are:
    - x
    - y
    - z

2. fBodyAcc
3. fBodyAccJerk
4. fBodyAccMag
5. fBodyBodyAccJerkMag
6. fBodyBodyGyroJerkMag
7. fBodyBodyGyroMag
8. fBodyGyro
9. tBodyAcc
10. tBodyAccJerk
11. tBodyAccJerkMag
12. tBodyAccMag
13. tBodyGyro
14. tBodyGyroJerk
15. tBodyGyroJerkMag
16. tBodyGyroMag
17. tGravityAcc
18. tGravityAccMag


