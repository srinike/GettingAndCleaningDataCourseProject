==========================================
Getting and Cleaning Data - Course Project
==========================================

For this project, the data files are extracted to the working directory. The data are stored in test and train folders. 

-----------
Expectation 
-----------
The data for x values for test and trainig sets are expected to be under the correcsponding folders of 'test' and 'train'.

Example: Lets say the working directory is set to c:\sample. In this case, there will be 2 folder for 'test' and 'train' in this directory. And the data files for 'x' values are stored in their corresponding directory.

------------------------------------
Steps performed in cleaning the data
------------------------------------

*Read the observations from the X values of test and train data.
*Read the y value of test and train data. This represents the type of activity.
*Read the subject values of test and train data.
*Combine (row bind) test and train data and store it in testtraindata.
*Combine (row bind) test 'Y' and train 'Y' data store it in testtraindataY.
*Combine the subject data for test and train data set.
*Read the features file to get the list of column names.
*Read the activities name. This has the description for each of the value in the testtraindataY.
*Create a new activities dataframe by using the combining 'Y' values of test and train data and activities' name.
*Column-bind the subject to the test train data.
*Column-bind the activitydf (with activity name) to the testtrainsubject data.
*Create a new dataframe with only those columns that has the mean or standard deviation in the column name.