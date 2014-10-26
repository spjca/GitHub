#Coursera Data Cleaning Project

#
#1
#

#load libraries
library(dplyr)

#
#2
#

#test data measurement labels
testDataLabels <- read.table("./test/y_test.txt", header = F)
#test data measurements
testData <- read.table("./test/X_test.txt", header = F)
#test data subject labels
testDataSubject <- read.table("./test/subject_test.txt", header = F)

#
#3
#

#training set data measurement labels
trainDataLabels <- read.table("./train/y_train.txt", header = F)
#training set data measurements
trainData <- read.table("./train/X_train.txt", header = F)
#training set data subject labels
trainDataSubject <- read.table("./train/subject_train.txt", header = F)

#
#4
#

#column names/measurments taken for each column
subjNames <- read.table("./features.txt")
subjNames <- subjNames$V2 #remove all but names vector

#
#organize data
#

#
#5
#

#add column names to train and test data
colnames(testData) <- subjNames
colnames(trainData) <- subjNames

#
#6
#

#add name 'activity' to each of the label data vectors
colnames(testDataLabels) <- "Activity"
colnames(trainDataLabels) <- "Activity"

#
#7
#

#rename activity values from numbers
testDataLabels[testDataLabels==1]="Walking"
testDataLabels[testDataLabels==2]="Walking Upstairs"
testDataLabels[testDataLabels==3]="Walking Downstairs"
testDataLabels[testDataLabels==4]="Sitting"
testDataLabels[testDataLabels==5]="Standing"
testDataLabels[testDataLabels==6]="Laying"

trainDataLabels[trainDataLabels==1]="Walking"
trainDataLabels[trainDataLabels==2]="Walking Upstairs"
trainDataLabels[trainDataLabels==3]="Walking Downstairs"
trainDataLabels[trainDataLabels==4]="Sitting"
trainDataLabels[trainDataLabels==5]="Standing"
trainDataLabels[trainDataLabels==6]="Laying"

#
#8
#

#add label column to data set data frame
testSet <- cbind(testDataLabels, testData)
trainSet <- cbind(trainDataLabels, trainData)

#
#9
#

#add name 'Subject' to each of the subject data vectors
colnames(testDataSubject) <- "Subject"
colnames(trainDataSubject) <- "Subject"

#
#10
#

#add subject column to data set data frame
testSet <- cbind(testDataSubject,testSet)
trainSet <- cbind(trainDataSubject,trainSet)

#
#11 - merge training and test data sets
#
mergedSet <- rbind(testSet,trainSet)


#
#12 - Extract mean and standard deviation measurements for all participants
#

slimSet <- mergedSet[,c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)]

#
#13 - clean column names for readability
#

names(slimSet)[3:42] <- sub("t","Time", names(slimSet)[3:42])         #change t to time in final set column names
names(slimSet)[43:68] <- sub("f","Frequency", names(slimSet)[43:68])  #change f to frequency in final set column names
names(slimSet) <- sub("Gyro", "Gyroscope", names(slimSet))            #change gyro to gyroscope in final set column names
names(slimSet) <- sub("Acc", "Acceleration", names(slimSet))          #change acc to acceleration in final set column names
names(slimSet) <- sub("Mag", "Magnitude", names(slimSet))             #change mag to magnitude in final set column names
names(slimSet) <- sub("std","StandardDeviation", names(slimSet))      #change std to standard deviation in final set column names
names(slimSet) <- sub("mean","Mean", names(slimSet))                  #ensure proper capitalization of mean in final set column names
names(slimSet) <- sub("X", "XAxis", names(slimSet))                   #change x to xaxis for readability in final set of column names
names(slimSet) <- sub("Y", "YAxis", names(slimSet))                   #change y to yaxis for readability in final set of column names
names(slimSet) <- sub("Z", "ZAxis", names(slimSet))                   #change z to zaxis for readability in final set of column names
names(slimSet) <- gsub("-","", names(slimSet))                        #remove all - from final set column names
names(slimSet) <- gsub("\\()","", names(slimSet))                     #remove all () from final set column names


#
#14 - create final tidy data set of averages of activities for each subject
#

finalSet <- slimSet %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))#, matches("Mean", "Standard"))

#
#15 - output tidySet.txt
#

write.table(finalSet, file = "tidySet.txt", row.name = FALSE)
