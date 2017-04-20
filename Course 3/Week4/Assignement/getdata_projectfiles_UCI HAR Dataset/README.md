###Gettting and Cleaning Data

###Week4, course project - Assignment

### Summary
This R script `run_analysis.R` is a _getting and clean_ script. 

### Details
the script does the following :

1. Download the datasets from [http://archive.ics.uci.edu](                 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) if they don't already exist
2. Load and clean the feature info
3. Load the training datasets
4. Load the test datasets
5. Merge the 2 datasets
6. Keep only the columns which name contains "mean" or "std" to extract only the measurements on the mean and standard deviation for each measurement. 
7. Load the label file
8. Converts `subjectid` and `activity` columns into factors
9. Create a tidy dataset with the average of each variable for each activity and each subject. (using the reshape2 library)
10. Export the tidy datset into a file named `tidy.txt` 

RUN the script with the following commands

    `>#In R Console
    >library(reshape2)
    >source("run_analysis.R")
    >runanalyse()
    >` 
    