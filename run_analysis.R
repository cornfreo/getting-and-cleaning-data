## Function run_analysis for processing the UCI dataset
##    Installation: save and source this function in the working directory
##    Input data: (1) download the dataset zip file to the working directory from:
##                  "https://d396qusza40orc.cloudfront.net/getdata
##                  %2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
##                (2) Unzip the dataset zip file in the working directory allowing
##                    unzip to build sub-directories as required.
##    Processing: (1) The function builds a raw data set from the input data set. Inertial
##                files are ignored. Only the means and standard deviations of 
##                variables are retained in the raw data set. The raw data set is stored
##                in a file: "GACD_Project_Raw_Data.csv" in the working directory.
##                (2) The function builds a tidy data set where the mean values of all
##                raw data set variables grouped by Experimental Subject and Activity
##                are calculated and the output saved in a file: "GACD_Project_Tidy_Data.csv"
##                in the working directory.

run_analysis <- function(){
  
  ## install/library the necessary packages
  library(stringr)
  library(dplyr)
  library(plyr)
  
  ## read the files into data tables, ignore the inertial values
  features_text <- read.table("./UCI HAR Dataset/features.txt")
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  
  ## scrub unneccessary characters from the feature variable names for readability
  ## NOTE: there is an opportunity for simplification here with gsub
  
  feature_text <- features_text$V2 ## drop the feature numbers
  feature_text <- gsub("\\(", "", feature_text) ## scrub ( from variable names
  feature_text <- gsub("\\)", "", feature_text) ## scrub ) from variable names
  feature_text <- gsub("\\,", "", feature_text) ## scrub , from variable names
  feature_text <- gsub("\\-", "", feature_text) ## scrub - from variable names
  
  ## start merging the data tables into the main initial raw data table
  
  keeps <- str_detect(feature_text, ignore.case("mean")) | 
    str_detect(feature_text, ignore.case("std")) ## keep only mean and sd variables
  X <- subset(rbind(X_test, X_train), select = keeps) ## subset means and std's
  names(X) <- subset(feature_text, keeps) ## keep these names
  activity_index <- rbind(y_test, y_train) ## bind the activity index to raw data
  names(activity_index) <- "activity_index" ## name the activity index
  subject <- rbind(subject_test, subject_train) ## bind the training set rows in
  names(subject) <- "subject" ## name the subject index variable
  X <- cbind(X, activity_index) ## assemble the activity index onto the data set
  X <- cbind(X, subject) ## assemble the subject index onto the data set
  
  ## tidy up the dataset
  
  X <- na.omit(X) ## remove all rows with NA values
  X <- tbl_df(X) ## cast X as a table data frame to enable use of dplyr functions
  ## make the activities more readable
  X <- mutate(X, activity = activity_labels$V2[activity_index])
  ## re-arrange the data and remove the activity index variable
  X <- select(arrange(X, subject, activity), -activity_index)
  write.table(X, file = "GACD_Project_Raw_Data.csv", sep = ", ", 
              row.names = FALSE) 
  
  ## calculate the means of all variables in the tidy data set
  means <<- ddply(X, .(subject, activity), colwise(mean))
  ## write the tidy data set to a file in the working directory
  write.table(means, file = "GACD_Project_Tidy_Data.csv", sep = ", ", 
              row.names = FALSE)
}

