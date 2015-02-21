Peer Review Course Assignments

Descriptions of the data and the variables. 

Data Source: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Originally from  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

    
The run_analysis.R script performs data cleaning.

Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in traindata, trainlabel and trainsubj variables respectively. Likewise for the test data.

Join testdata to traindata to generate a single data frame, joindata; likewise for joinlabel; and joinsubj.

Read the features.txt file from the "/Data" folder and store in a variable called features. Extract the measurements on the mean and standard deviation. Obtain a subset of 66 indices list.

Read the activity_labels.txt file from the "./Data"" folder and store in a variable called activity.

Clean the activity names. Make all names to lower cases. Remove the underscore and capitalize the letter after it.

Transform the values of joinlabel according to the activity data frame.

Combine the joinsubj, joinlabel and joindata by column. Obtain a new cleaned data frame, cleaneddata. 

Write the cleaneddata out to "data1.txt".

Generate a second independent tidy data set with the average of each measurement for each activity and each subject. 

Write the result out to "data2.txt".
