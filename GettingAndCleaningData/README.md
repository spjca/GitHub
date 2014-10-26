Coursera
Getting and Cleaning Data
Sean Jackson

Project Readme
**************

The script to obtain the tidy data set based on the Samsung phone data is self contained as long as the 
script is in the main working directory. Once sourced, the script will perform all of the necesary
transformations of the data and output a 'tidySet.txt' containing the final requested results.

How run_analysis works:

1) The script loads the dplyr library for later use. I am in the habit of loading libraries at the
begining of any script.

2) The script loads the test data set labels, measurement data, and subject data into testDataLabels,
testData, and testDataSubject respectively.

3) The script loads the training data set labels, measurement data, and subject data into trainDataLabels,
trainData, and trainDataSubject respectively.

4) The test measurment names are loaded into variable subjNames and cleaned so that only the names remain

5) testData and trainData are given the names from subjNames

6) The testDataLabels and trainDataLabels are both given the name 'Activity' for clarity in the coming
combined data matrix.

7) The data within the testDataLabels and trainDataLabels is converted to the activity types from the 
numeric placeholders.

8) testData and trainData are merged with testDataLabels and trainDataLabels respectively via cbind
into the new variables testSet and trainSet.

9) Column name "Subject" is added to both testDataSubject and trainDataSubject.

10) testDataSubject and trainDataSubject are merged into testSet and trainSet respectively via rbind.

11) testSet and trainSet are merged via rbind into new variable mergedSet.

12) Mean and standard deviation measurements are extracted from mergedSet into new variable slimSet.

13) Names of measurements are altered for easier readability.

14) Mean of activities for each participant are calculated into new variable finalSet using dplyr's
group_by and summarise_each functions.

15) write.table is called to output the final product: tidySet.txt