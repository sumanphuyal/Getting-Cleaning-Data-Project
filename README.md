# Getting-Cleaning-Data-Project

Course project of Getting and Cleaning Data (https://class.coursera.org/getdata-012) , Session 012, March 2015

## Project Description ( as mentioned in course project page ) 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files in this Repository
    1. CodeBook.md: Codebook that describes the variables, the data and the transformation process.
    2. LICENSE:- License terms for code.
    3. README.MD:- The file that describes about project. 
    4. run_analysis.R: R script to clean data as described in above project requirements. 

## File/Folder structure expected
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
  
## Steps to run run_analysis.R script:
    1. Download zipped data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  and unzip into a folder.
    2. After unzipping you should see folder named "getdata_projectfiles_UCI HAR Dataset".
    3. Save run_analysis.R script inside the same folder i.e "getdata_projectfiles_UCI HAR Dataset" folder. 
    4. Run the run_analysis.R script, it should write a test file named "tidyData_final_20150322.txt" in the same location i.e inside ""getdata_projectfiles_UCI HAR Dataset" folder.
    
    
    

