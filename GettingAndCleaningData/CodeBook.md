Coursera
Getting and Cleaning Data
Sean Jackson


Code Book
*********

Source Files:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


Variables:
- testDataLabels: Test dataset label variable.

- testData: Test data variable.

- testDataSubject: Test data subjects variable.

- trainingDataLabels: Training dataset label variable.

- trainingData: Training data variable.

- trainingDataSubject: Training data subjects variable.

- subjNames: List of all features variable.

- testSet: Combined test dataset including labels and subjects.

- trainSet: Combined training dataset including labels and subjects.

- mergedSet: Combined test and training dataset including all subjects and labels.

- slimSet: Fully labeled dataset of all mean and standard deviation measurements for all
subjects.

- finalSet: Fully labeled variable from which tidy data is extracted which includes only 
the means of the subject measurements.

