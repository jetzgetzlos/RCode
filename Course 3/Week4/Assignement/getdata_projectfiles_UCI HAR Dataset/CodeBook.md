###Code Book

This code book describes the data fields in the `tidy.txt` file (output of the `run_analysis.R` script)


### Identifier

* `subjectid` : id of the subject who performed the activity - Its range is from 1 to 30
* `activity` : type of activity performed during the measurements. The types of activity are : 

    * WALKING (value = 1) : 
    * WALKING_UPSTAIRS (value = 2)
    * WALKING_DOWNSTAIRS (value = 3)
    * SITTING (value = 4)
    * STANDING (value = 5)
    * LAYING (value = 6)

### DATA : Measurements
**average** of the following variables for each activity and each subject

Features are normalized and bounded within [-1,1]
    
    tbodyacc-mean-x
    tbodyacc-mean-y
    tbodyacc-mean-z
    tbodyacc-std-x
    tbodyacc-std-y
    tbodyacc-std-z
    tgravityacc-mean-x
    tgravityacc-mean-y
    tgravityacc-mean-z
    tgravityacc-std-x
    tgravityacc-std-y 
    tgravityacc-std-z 
    tbodyaccjerk-mean-x 
    tbodyaccjerk-mean-y 
    tbodyaccjerk-mean-z 
    tbodyaccjerk-std-x 
    tbodyaccjerk-std-y 
    tbodyaccjerk-std-z 
    tbodygyro-mean-x 
    tbodygyro-mean-y 
    tbodygyro-mean-z 
    tbodygyro-std-x 
    tbodygyro-std-y 
    tbodygyro-std-z 
    tbodygyrojerk-mean-x 
    tbodygyrojerk-mean-y 
    tbodygyrojerk-mean-z 
    tbodygyrojerk-std-x 
    tbodygyrojerk-std-y 
    tbodygyrojerk-std-z 
    tbodyaccmag-mean 
    tbodyaccmag-std 
    tgravityaccmag-mean 
    tgravityaccmag-std 
    tbodyaccjerkmag-mean 
    tbodyaccjerkmag-std 
    tbodygyromag-mean 
    tbodygyromag-std 
    tbodygyrojerkmag-mean 
    tbodygyrojerkmag-std 
    fbodyacc-mean-x 
    fbodyacc-mean-y 
    fbodyacc-mean-z 
    fbodyacc-std-x 
    fbodyacc-std-y 
    fbodyacc-std-z 
    fbodyacc-meanfreq-x 
    fbodyacc-meanfreq-y 
    fbodyacc-meanfreq-z 
    fbodyaccjerk-mean-x 
    fbodyaccjerk-mean-y 
    fbodyaccjerk-mean-z 
    fbodyaccjerk-std-x 
    fbodyaccjerk-std-y 
    fbodyaccjerk-std-z 
    fbodyaccjerk-meanfreq-x 
    fbodyaccjerk-meanfreq-y 
    fbodyaccjerk-meanfreq-z 
    fbodygyro-mean-x 
    fbodygyro-mean-y 
    fbodygyro-mean-z 
    fbodygyro-std-x 
    fbodygyro-std-y 
    fbodygyro-std-z 
    fbodygyro-meanfreq-x 
    fbodygyro-meanfreq-y 
    fbodygyro-meanfreq-z 
    fbodyaccmag-mean 
    fbodyaccmag-std 
    fbodyaccmag-meanfreq 
    fbodybodyaccjerkmag-mean 
    fbodybodyaccjerkmag-std 
    fbodybodyaccjerkmag-meanfreq 
    fbodybodygyromag-mean 
    fbodybodygyromag-std 
    fbodybodygyromag-meanfreq 
    fbodybodygyrojerkmag-mean 
    fbodybodygyrojerkmag-std 
    fbodybodygyrojerkmag-meanfreq  
    
### Experiment
_The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data._

_The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a B_


    
### DATA explaination

_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. _

_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). _

_Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). _
    
_These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions : _

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
    
The set of variables that were estimated from these signals are: 

    mean: Mean value
    std: Standard deviation
    
### MORE
For more information about this dataset contact: activityrecognition@smartlab.ws

###License:
Use of the original dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
