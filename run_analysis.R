## Function run_analysis for processing the UCI dataset

run_analysis <- function(){
  ## read the files into data tables, ignore the inertial values
  features_text <<- read.table("./UCI HAR Dataset/features.txt")
  activity_labels <<- read.table("./UCI HAR Dataset/activity_labels.txt")
  subject_test <<- read.table("./UCI HAR Dataset/test/subject_test.txt")
  X_test <<- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <<- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_train <<- read.table("./UCI HAR Dataset/train/subject_train.txt")
  X_train <<- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <<- read.table("./UCI HAR Dataset/train/y_train.txt")
  ## start merging the data tables into the main initial data table

}


assemble_raw_data <- function(){
  
  feature_text <<- features_text$V2
  feature_text <<- gsub("\\(", "", feature_text)
  feature_text <<- gsub("\\)", "", feature_text)
  feature_text <<- gsub("\\,", "", feature_text)
  feature_text <<- gsub("\\-", "", feature_text)
  keeps <<- str_detect(feature_text, ignore.case("mean")) | 
    str_detect(feature_text, ignore.case("std"))
  X <<- subset(rbind(X_test, X_train), select = keeps)
  names(X) <<- subset(feature_text, keeps)
  activity_index <<- rbind(y_test, y_train)
  names(activity_index) <- "activity"
  subject <<- rbind(subject_test, subject_train)
  names(subject) <- "subject"
  X <<- cbind(X, activity_index)
  X <<- cbind(X, subject)
  X <<- na.omit(X)
  X <<- tbl_df(X)
  by_subject <<- group_by(X, subject, activity)
  by_subject <<- arrange(by_subject, subject, activity)
}

mns <- function(){
  nms <<- names(by_subject)
  means <<- tbl_df(summarize(by_subject, mean(tBodyAccmeanX), 
                             mean(tBodyAccmeanY), 
                             mean(tBodyAccmeanZ)))
  
  ## means <<- tbl_df(summarize(by_subject, sapply(X, mean)))
  ##means <<- lapply(as.list(by_subject),Summarize)
}





swd <- function(){
  setwd("C:/Users/Cornelius/datasciencecoursera/GACD_Project")
  
}



dmmy <- function(){
  
  ## create the root folder for the data download if it does not exist, download
  ## the data and unzip it
  if (!file.exists("input_data")){
    dir.create("./input_data")
    ## change working directory to the new directory
    setwd("./input_data")
    ## download the data set zip file to the project directory
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
    download.file(fileURL, destfile = "UCI HAR Dataset.zip")
  }
  ## ## unzip the file to a new folder structure added to the current working directory
  unzip("UCI HAR Dataset.zip")
}