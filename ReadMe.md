==========================================
Getting and Cleaning Data - Course Project
==========================================

For this project, the data files are extracted to the working directory. The data are stored in test and train folders. 

-----------
Expectation 
-----------
The data for x values for test and training sets are expected to be under the corresponding folders of 'test' and 'train'.

Example: Let's say the working directory is set to c:\sample. In this case, there will be 2 folder for 'test' and 'train' in this 'Sample' directory. And the data files for 'x' values are stored in their corresponding directory.

------------------------------------
Steps performed in cleaning the data
------------------------------------

1. Read the observations from the X values of test and train data.
2. Read the y value of test and train data. This represents the type of activity.
3. Read the subject values of test and train data.
4. Combine (row bind) test and train data and store it in testtraindata.
5. Combine (row bind) test 'Y' and train 'Y' data store it in testtraindataY.
6. Combine the subject data for test and train data set.
7. Read the features file to get the list of column names.
8. Read the activities name. This has the description for each of the value in the testtraindataY.
9. Create a new activities dataframe by using the combining 'Y' values of test and train data and activities' name.
10. Column-bind the subject to the test train data.
11. Column-bind the activitydf (with activity name) to the testtrainsubject data.
12. Create a new dataframe with only those columns that has the mean or standard deviation in the column name.
13. Calculate the average of each of the column values and group them by Subject and Activity and store it in a new data frame - tidydata
14. Write the tidydata to the external file names tidydata.txt
15. This file is located in the current working directory.