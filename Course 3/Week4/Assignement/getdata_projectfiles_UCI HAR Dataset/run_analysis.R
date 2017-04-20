#DataScience - Getting and Cleaning data (course #3)
#Getting and Cleaning Data Course Project 
# Jetzgetzlos, 02/04/2017

#This script does the following.
#- Merges the training and the test sets to create one data set.
#- Extracts only the measurements on the mean and standard deviation for 
#  each measurement.
#- Uses descriptive activity names to name the activities in the data set
#- Appropriately labels the data set with descriptive variable names.
#- From the data set in step 4, creates a second, independent tidy data set
#  with the average of each variable for each activity and each subject.

#RUN the script with the following commands
#>library(reshape2)
#>source("run_analysis.R")
#>runanalyse()

runanalyse <- function() {
    
    zipfilename <- "data.zip"
    dirname <- "UCI HAR Dataset"
    
    #Download and unzip the zip file that contains the datasets
    if (! file.exists(zipfilename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, "data.zip", method = "curl")
    }
    if (!file.exists(dirname)){
        unzip(zipfilename)
    }

    ###Step 0 : Load the list of all features
    features <- read.table(file = "UCI HAR Dataset/features.txt", 
                         colClasses = "character")
    #Cleaning features : erase the "()" and lower the names
    features[,2] <- tolower(features[,2]) 
    features[,2] <- gsub("\\(.*\\)","",features[,2])
    
    ###Step 1 : Merges the training and the test sets to create one data set.
    #Load Training files
    training <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
    #set names
    names(training) <- features[,2]
    
    training_labels <- read.table(file = "UCI HAR Dataset/train/y_train.txt",
                                colClasses = "character")
    names(training_labels) <- c("activity")
    
    training_subject <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
    names(training_subject) <- c("subjectid")
    
    #Merge the 3 dataset
    training <- cbind(training_subject,training_labels,training)
   
    
    #Load Test files
    test <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
    #set names
    names(test) <- features[,2]
    
    test_labels <- read.table(file = "UCI HAR Dataset/test/y_test.txt",
                                colClasses = "character")
    names(test_labels) <- c("activity")
    
    test_subject <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
    names(test_subject) <- c("subjectid")
    
    #Merge the 3 datasets () and add a column to mark the "test" datasets 
    test <- cbind(test_subject,test_labels,test)
   
    #Merge training and test data frames
    merged_df <- rbind(training, test)
    
    ### Step #2 : Extracts only the measurements on the mean and standard deviation for 
    #  each measurement.
    
    #Selection of mean or std columns
    featuresSelection <- grepl("mean|std|subjectid|activity",x=names(merged_df))
    merged_df <- merged_df[,featuresSelection]
    
    
    
    ### Step #3
    #Uses descriptive activity names to name the activities in the data set
    
    #LOAD the label file
    activity_df <- read.table(file = "UCI HAR Dataset/activity_labels.txt",
                                  colClasses = "character")
    names(activity_df) <- c("id", "activityname")
    #merged_df <- merge(x = merged_df, y = activity_df, 
    #                   by.x = "activity", by.y= "id", sort = FALSE)
    #### STEP#3 is not necessary (step#4 gives the labels idest the activity names)
    # Therefore STEP#3 merging under commentary flags    
    
    ### STEP #4 : Appropriately labels the data set with descriptive variable names.
    merged_df[,"activity"] <-factor(merged_df[,"activity"], 
                                      levels = activity_df[,"id"],
                                      labels = activity_df[,"activityname"])
    merged_df[,"subjectid"] <- as.factor(merged_df[,"subjectid"])
    
    
    ###STEP #5 From the data set in step 4, creates a second, independent tidy data set
    #  with the average of each variable for each activity and each subject.
    #User reshape2 lib
    tidyset <- melt(data = merged_df, id = c("subjectid", "activity"))
    tidyset <- dcast(data = tidyset, subjectid + activity ~ variable, mean)
    
    write.table(x = tidyset, file = "tidy.txt", row.names = FALSE, quote = FALSE)
    
}