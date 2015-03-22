# Introduction
This  code book describes the variables, the data, and the steps performed in cleaning and transforming data. 

# Data Source
Data used in this project is available under https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Full description of data is available under http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Assumptions
It is assumed that the data and R script is downloaded as explained in README.md file. The file/folder structure should look
like this for script to run properly. 

    ---
     |--- run_analysis.R
     |--- getdata_projectfiles_UCI HAR Dataset/
          |--- UCI HAR Dataset
               |--- features.txt
               |--- activity_labels.txt
               |--- test
                    |--- subject_test.txt
                    |--- X_test.txt
                    |--- y_test.txt
               |--- train
                    |--- subject_train.txt
                    |--- X_train.txt
                    |--- y_train.txt

# Transformation Steps
    1. For both test and train data set read all x, y and subject data.
    2. Merge x of test and train data by rows.
    3. Merge y of test and train data by rows.
    4. Merge subject of test and train data by rows.
    5. Merge x, y , z by columns. 
    5. Extract columns names that measeure mean and standare deviation.
    6. Rename column names to make it more readable. run_analysis.R use following code to rename columns.
    
          names(DF_allMerged)<-gsub("^t", "time", names(DF_allMerged))
          names(DF_allMerged)<-gsub("^f", "frequency", names(DF_allMerged))
          names(DF_allMerged)<-gsub('\\.mean',".Mean", names(DF_allMerged))
          names(DF_allMerged)<-gsub('\\.std',".StandardDeviation", names(DF_allMerged))
          names(DF_allMerged)<-gsub("Acc", "Accelerometer", names(DF_allMerged))
          names(DF_allMerged)<-gsub("Gyro", "Gyroscope", names(DF_allMerged))
          names(DF_allMerged)<-gsub("Mag", "Magnitude", names(DF_allMerged))
          names(DF_allMerged)<-gsub("angle", "Angle", names(DF_allMerged))
          names(DF_allMerged)<-gsub("gravity", "Gravity", names(DF_allMerged))
   
      Here DF_allMerged is a data frame created by merging x, y and subject data. 
    7. Create new tidy data set with the average of each variable for each activity and each subject.
    8. Save tidy data set in test file. 

# Variable Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

      mean(): Mean value
      std(): Standard deviation
      mad(): Median absolute deviation 
      max(): Largest value in array
      min(): Smallest value in array
      sma(): Signal magnitude area
      energy(): Energy measure. Sum of the squares divided by the number of values. 
      iqr(): Interquartile range 
      entropy(): Signal entropy
      arCoeff(): Autorregresion coefficients with Burg order equal to 4
      correlation(): correlation coefficient between two signals
      maxInds(): index of the frequency component with largest magnitude
      meanFreq(): Weighted average of the frequency components to obtain a mean frequency
      skewness(): skewness of the frequency domain signal 
      kurtosis(): kurtosis of the frequency domain signal 
      bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
      angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

      gravityMean
      tBodyAccMean
      tBodyAccJerkMean
      tBodyGyroMean
      tBodyGyroJerkMean

The complete list of variables of each feature vector is available in Column Names section below. 

# Column Names
Followind are the column names of final tidy data set. All the column names are self descriptory. For more details on column name refer to data sourse.

      subject
      activityLevel
      timeBodyAccelerometer-mean()-X
      timeBodyAccelerometer-mean()-Y
      timeBodyAccelerometer-mean()-Z
      timeBodyAccelerometer-std()-X
      timeBodyAccelerometer-std()-Y
      timeBodyAccelerometer-std()-Z
      timeGravityAccelerometer-mean()-X
      timeGravityAccelerometer-mean()-Y
      timeGravityAccelerometer-mean()-Z
      timeGravityAccelerometer-std()-X
      timeGravityAccelerometer-std()-Y
      timeGravityAccelerometer-std()-Z
      timeBodyAccelerometerJerk-mean()-X
      timeBodyAccelerometerJerk-mean()-Y
      timeBodyAccelerometerJerk-mean()-Z
      timeBodyAccelerometerJerk-std()-X
      timeBodyAccelerometerJerk-std()-Y
      timeBodyAccelerometerJerk-std()-Z
      timeBodyGyroscope-mean()-X
      timeBodyGyroscope-mean()-Y
      timeBodyGyroscope-mean()-Z
      timeBodyGyroscope-std()-X
      timeBodyGyroscope-std()-Y
      timeBodyGyroscope-std()-Z
      timeBodyGyroscopeJerk-mean()-X
      timeBodyGyroscopeJerk-mean()-Y
      timeBodyGyroscopeJerk-mean()-Z
      timeBodyGyroscopeJerk-std()-X
      timeBodyGyroscopeJerk-std()-Y
      timeBodyGyroscopeJerk-std()-Z
      timeBodyAccelerometerMagnitude-mean()
      timeBodyAccelerometerMagnitude-std()
      timeGravityAccelerometerMagnitude-mean()
      timeGravityAccelerometerMagnitude-std()
      timeBodyAccelerometerJerkMagnitude-mean()
      timeBodyAccelerometerJerkMagnitude-std()
      timeBodyGyroscopeMagnitude-mean()
      timeBodyGyroscopeMagnitude-std()
      timeBodyGyroscopeJerkMagnitude-mean()
      timeBodyGyroscopeJerkMagnitude-std()
      frequencyBodyAccelerometer-mean()-X
      frequencyBodyAccelerometer-mean()-Y
      frequencyBodyAccelerometer-mean()-Z
      frequencyBodyAccelerometer-std()-X
      frequencyBodyAccelerometer-std()-Y
      frequencyBodyAccelerometer-std()-Z
      frequencyBodyAccelerometerJerk-mean()-X
      frequencyBodyAccelerometerJerk-mean()-Y
      frequencyBodyAccelerometerJerk-mean()-Z
      frequencyBodyAccelerometerJerk-std()-X
      frequencyBodyAccelerometerJerk-std()-Y
      frequencyBodyAccelerometerJerk-std()-Z
      frequencyBodyGyroscope-mean()-X
      frequencyBodyGyroscope-mean()-Y
      frequencyBodyGyroscope-mean()-Z
      frequencyBodyGyroscope-std()-X
      frequencyBodyGyroscope-std()-Y
      frequencyBodyGyroscope-std()-Z
      frequencyBodyAccelerometerMagnitude-mean()
      frequencyBodyAccelerometerMagnitude-std()
      frequencyBodyBodyAccelerometerJerkMagnitude-mean()
      frequencyBodyBodyAccelerometerJerkMagnitude-std()
      frequencyBodyBodyGyroscopeMagnitude-mean()
      frequencyBodyBodyGyroscopeMagnitude-std()
      frequencyBodyBodyGyroscopeJerkMagnitude-mean()
      frequencyBodyBodyGyroscopeJerkMagnitude-std()

