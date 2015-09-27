---
#Code Book for Tidy Data Set

The data set has been created transforming data measured for human activity recognition using smartphones.

The tidy data set consists of 180 observations and 81 variables. 
The first two variables are ID variables and the remaining are averages of the mean and standard deviations of the different measurement features. There are 79 variables calculating mean and standard deviations. 

The first ID variable, V1, is a factor for subjects/participants in the study. There are 30 participants.

The second ID variable, activity, is a factor for different types of activities:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The numbers signify the same in the activity variable.

The averages of each measurement variable have been obtained by grouping data by the two ID variables. That is, any given average, is the average value for one particular subject performing one particular activity.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The dataset merged the test and train datasets available originally. 
There were originally 561 measurement variables and 10299 observations in the main data set, X_train/X_test. 

The other two sets of data were ID variables: one for subjects in the study and other set for the six different types of activities for which data was obtained.

The test and train ID variables were combined together and then added to the measurement data set.

The measurement variables (features) were the statistical variables such as mean(), std(), kurtosis(),skweness() obtained from the different types of signals measured during the activities. For our purposes, we required only mean() and std(), therefore, only 79 out of 561 variables were extracted.

These were then grouped by subject and activity variables. 30 subjects*6 activities=180 observations.
