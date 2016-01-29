# README
This is the README for the course project Getting and Cleaning data.

In the git you will find two files. The first one is an R script that you can run to download and tidy the original data and the second one is the code book for the tidy data.

Here are the instructions to execute the run_analysis.R script:

1. Install the dplyr package if not already installed
2. Set the WORKDIR variable at the top of the script file. This is going to be the location where the data is downloaded
3. Source the file from RStudio or R
4. The output is a CSV file named tidy_data.csv that contains the tidy data

The run_analysis.R script performed the following steps:

1. Merge of train and test data keeping the information about which set the data came from
2. Extraction of mean and std statistics from the set of features
3. Variables name normalization: 
  - Parentheses and hyphens have been replace by dots
  - Expansion of the first letter of the variables: t into time and f into frequency
4. Activity labels expansion: numbers have been translated into words for better readability
5. Grouping of measurements by activity and subject
