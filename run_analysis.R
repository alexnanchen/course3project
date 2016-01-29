#################
# Course project
#
# Instructions:
# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#############
# Environment
#
library(dplyr)

#############
# Constants
#
#Directories
WORKDIR <- "/Users/alexnanchen/data-science"
DATADIR <- paste0(WORKDIR,"/ucihardataset")
TRAININGDIR <- paste0(DATADIR,"/train")
TESTINGDIR <- paste0(DATADIR,"/test")

#Files
ACTIVITYLABELS <- paste0(DATADIR,"/activity_labels.txt")
FEATURENAMES <- paste0(DATADIR,"/features.txt")
TRAININGLABELS <- paste0(TRAININGDIR,"/y_train.txt")
TRAININGID <- paste0(TRAININGDIR,"/subject_train.txt")
TRAININGDATA <- paste0(TRAININGDIR,"/X_train.txt")
TESTINGLABELS <- paste0(TESTINGDIR,"/y_test.txt")
TESTINGID <- paste0(TESTINGDIR,"/subject_test.txt")
TESTINGDATA <- paste0(TESTINGDIR,"/X_test.txt")

#############
# Main
#
#Store to restore at the end
initDir <- getwd()

#Were do we put files
setwd(WORKDIR)

#-----------------------------------
# Step 0: get the data
#-----------------------------------
if (!file.exists(DATADIR)) {
    if (!file.exists("dataset.zip")) {
        cat("Downloading data ...\n")
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="dataset.zip", method="curl")
    } 
    unzip("dataset.zip")
    file.rename("UCI HAR Dataset",DATADIR)
}

#Activity labels
if (!exists("dfActivityLabels")) 
    dfActivityLabels <- tbl_df(read.table(ACTIVITYLABELS, stringsAsFactors=F))

#Features
if (!exists("dfFeatureNames")) 
    dfFeatureNames <- tbl_df(read.table(FEATURENAMES, stringsAsFactors=F))

#Training
if (!exists("dfTrainLabels")) 
    dfTrainLabels <- tbl_df(read.table(TRAININGLABELS, stringsAsFactors=F))
if (!exists("dfTrainID"))
    dfTrainID <- tbl_df(read.table(TRAININGID, stringsAsFactors=F))
if (!exists("dfTrainFeatures"))
    dfTrainFeatures <- tbl_df(read.table(TRAININGDATA, stringsAsFactors=F))

#Testing
if (!exists("dfTestLabels")) 
    dfTestLabels <- tbl_df(read.table(TESTINGLABELS, stringsAsFactors=F))
if (!exists("dfTestID"))
    dfTestID <- tbl_df(read.table(TESTINGID, stringsAsFactors=F))
if (!exists("dfTestFeatures"))
    dfTestFeatures <- tbl_df(read.table(TESTINGDATA, stringsAsFactors=F))

#-----------------------------------
# Step 1: Merge
#-----------------------------------
#Add variables names
names(dfTrainFeatures) <- dfFeatureNames$V2
names(dfTestFeatures) <- dfFeatureNames$V2

#Combine
dfTrainCombined <- tbl_df(data.frame(userid=dfTrainID$V1,activity=dfTrainLabels$V1,set=rep(1,nrow(dfTrainFeatures))))
dfTrainCombined <- bind_cols(dfTrainCombined, dfTrainFeatures)
dfTestCombined <- tbl_df(data.frame(userid=dfTestID$V1,activity=dfTestLabels$V1,set=rep(2,nrow(dfTestFeatures))))
dfTestCombined <- bind_cols(dfTestCombined, dfTestFeatures)
dfCombined <- bind_rows(dfTrainCombined,dfTestCombined)

#-----------------------------------
# Step 2: Column selection
#-----------------------------------
#Select features
allIndices <- c(1:3, grep("mean[(]",names(dfCombined)), grep("std[(]",names(dfCombined)))
dfFinal <- dfCombined[,allIndices]

#-----------------------------------
# Step 3: Descriptive activity names
#-----------------------------------
dfActivityLabels <- mutate(dfActivityLabels,V2=tolower(V2))
dfActivityLabels <- mutate(dfActivityLabels,V2=sub("upstairs","up",V2))
dfActivityLabels <- mutate(dfActivityLabels,V2=sub("downstairs","down",V2))
dfFinal$activity <- dfActivityLabels$V2[dfFinal$activity]

#-----------------------------------
# Step 4: Variable names
#-----------------------------------
names(dfFinal) <- make.names(names(dfFinal))
names(dfFinal) <- gsub('[...]{3}','.',names(dfFinal))
names(dfFinal) <- gsub('[.]+$','',names(dfFinal))
names(dfFinal) <- gsub('^t','time',names(dfFinal))
names(dfFinal) <- gsub('^f','frequency',names(dfFinal))

#-----------------------------------
# Step 5: Summary
#-----------------------------------
dfSummarized <- group_by(dfFinal,userid,activity) %>% summarise_each(funs(mean))

cat("Writing tidy data\n")
write.table(dfSummarized,file="tidy_data.txt",row.names = FALSE,quote=FALSE, sep=",")

setwd(initDir)



