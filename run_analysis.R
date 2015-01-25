run = function() {
  
  print("Reading the test and train datafile")
  # Read the observations from the X values of test and train data
  testdata = read.table("test/X_test.txt")
  traindata = read.table("train/X_train.txt")
  
  # Read the y value of test and train data. This represents the type of activity
  testdataY = read.table("test/y_test.txt")
  traindataY = read.table("train/y_train.txt")

  # Read the subject values of test and train data
  testsubject = read.table("test/subject_test.txt")
  trainsubject = read.table("train/subject_train.txt")
  
  #combine (row bind) test and train data and store it in testtraindata
  testtraindata = rbind(testdata, traindata)
  
  #combine (row bind) test 'Y' and train 'Y' data store it in testtraindataY
  testtraindataY = rbind(testdataY, traindataY)
  
  #combine the subject data for test and train data set
  testtrainsubject = rbind(testsubject, trainsubject)
  
  # Read the features file
  features = read.table("features.txt")
  dftemp = data.frame(features[,2])
  featuresrow = t(dftemp)

  # Read the activities name. This has the description for each of the value in the testtraindataY
  activitiesname = read.table("activity_labels.txt")
  
  # Create a new activities dataframe by using the combining 'Y' values of test and train data and
  # the activities name
  yrow = nrow(testtraindataY)
  activitydf = data.frame()
  for (i in 1:yrow) {
    value = testtraindataY[i,1]
    activalue = activitiesname[value,2]
    activitydf[i,1] = activalue
  }
  
 # Column-bind the subject to the test train data
 testtrainsubject = cbind(testtraindata, testtrainsubject)
 
 # Column-bind the activitydf (with activity name) to the testtrainsubject data
 testtrainsubjectactivity = cbind(testtrainsubject, activitydf)
 
 featuresrow[562]= "Subject"
 featuresrow[563]= "Activity"

 print("Assigning the column names...")
 colnames(testtrainsubjectactivity) <- featuresrow
 
 count = 0
 names = names(testtrainsubjectactivity)
 meanstdcolumnnames = c()
 for (i in names) {
  # if (length(grep("mean()","tBodyAcc-mean()-X"))>0) {
   if ((length(grep("mean()",i))>0)
       | (length(grep("std()",i))>0)
       | (length(grep("Subject",i))>0)
       | (length(grep("Activity",i))>0))  {
     
     count = count + 1
     meanstdcolumnnames[count] = i
   }
 } 
 
 print("Selecting the Standard Dev and Mean columns...") 
 
 testtrainsubjectactivity_mean_std = testtrainsubjectactivity[, meanstdcolumnnames]
 
 print("Creating a file...")

 #Create tidy data by calculating the mean for each of the column grouped by Activity and Subject
 tidydata = testtrainsubjectactivity_mean_std %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
 write.table(tidydata, "tidydata.txt", sep="\t", row.names = F)
 print("Completed!")
  
}