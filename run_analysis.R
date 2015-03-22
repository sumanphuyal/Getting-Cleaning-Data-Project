# Course: Getting and Cleaning Data (getdata-012) -- Coursera
# Date: 2015/03/22
# Course Project

######################################################################
# Read all raw data that are required to complete the project.
# Please note that I have used relative path to read files located inside different folders.
# To run the program dowonload data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and 
# unzip it to "getdata_projectfiles_UCI HAR Dataset" folder. After that save this run_analysis.r program
# to the same location as "getdata_projectfiles_UCI HAR Dataset" folder.
######################################################################

#Read activity level from y-test.txt file and y-train.txt file.
DF_activityIDYTest  <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt',header = FALSE)
DF_activityIDYTrain  <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt',header = FALSE)

#Read subject data from subject_test.txt and subject_train.txt file.
DF_subjectTest  <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt',header = FALSE)
DF_subjectTrain  <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt',header = FALSE)

#Read features from x_test.txt and x_train.txt file. 
DF_featuresTest <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt',header = FALSE)
DF_featuresTrain <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt',header = FALSE)

#Read feature level from feature.txt file.
DF_featureLevel <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt',header = FALSE)

#Read activity code description from activity_level.txt file.
DF_activityCodeDescription <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt',header = FALSE)

######################################################################
# 1. Merges the training and the test sets to create one data set.
######################################################################

#Merge activity id for training and test data
DF_activityID = rbind(DF_activityIDYTest, DF_activityIDYTrain)

#Merge subject information for training and test data
DF_subject = rbind(DF_subjectTest, DF_subjectTrain)

#Merge features information for training and test data
DF_features = rbind(DF_featuresTest, DF_featuresTrain)

######################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
######################################################################

meanSD_LogicalVector = grep("mean\\(\\)|std\\(\\)",DF_featureLevel$V2, ignore.case = FALSE)
meanSD_featureNames = DF_featureLevel$V2[meanSD_LogicalVector]

# get selected columns from merged data frame
selectedColumns = c(as.character(meanSD_featureNames))

#set column name for features. 
# Since features are provided in features.txt, I have already read this file in DF_featureLevel DF above.
# DF_featureLevel consist of two columns, first column is number 1, 2, 3 ... and second column is 
# name of features so use this second column as column neader for DF_features data frame. 
names(DF_features) = DF_featureLevel[,2]

# get subset from merged data fram that contains selected columns. 
DF_selected = DF_features[,selectedColumns]

######################################################################
# 3. Uses descriptive activity names to name the activities in the data set
######################################################################

#set column name for activity level as activityLevel
names(DF_activityID) <- c('activityLevel')

#set column name for subject as subject
names(DF_subject) = c('subject')

# merge subject and activity with feature data to prepare a full, meaningful data 
# that contains all subject, activity and features information. 
DF_allMerged = cbind(DF_selected, DF_activityID, DF_subject)

#replace activity code with activity code description.
DF_allMerged$activityLevel <- factor(DF_allMerged$activityLevel,
                                    levels = DF_activityCodeDescription$V1,
                                    labels = DF_activityCodeDescription$V2) 

######################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
######################################################################

#make column name more descriptive
names(DF_allMerged)<-gsub("^t", "time", names(DF_allMerged))
names(DF_allMerged)<-gsub("^f", "frequency", names(DF_allMerged))
names(DF_allMerged)<-gsub('\\.mean',".Mean", names(DF_allMerged))
names(DF_allMerged)<-gsub('\\.std',".StandardDeviation", names(DF_allMerged))
names(DF_allMerged)<-gsub("Acc", "Accelerometer", names(DF_allMerged))
names(DF_allMerged)<-gsub("Gyro", "Gyroscope", names(DF_allMerged))
names(DF_allMerged)<-gsub("Mag", "Magnitude", names(DF_allMerged))
names(DF_allMerged)<-gsub("angle", "Angle", names(DF_allMerged))
names(DF_allMerged)<-gsub("gravity", "Gravity", names(DF_allMerged))

######################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################

#calculate mean by subject and activity level
DF_tidyData<-aggregate(. ~subject + activityLevel, DF_allMerged, mean)
#save data frame in text file
write.table(DF_tidyData, file = "tidyData_final_20150322.txt",row.name=FALSE)
