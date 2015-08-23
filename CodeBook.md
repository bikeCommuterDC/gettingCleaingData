#Project Description

The run_analyis.R file imports raw data from Samsung Galaxy S Acceleratometer that tracks movements of subjects. This data is then cleaned and transformed to create a tidy dataset.

#Study Design and Data Processing

## Collection of raw data

Data is downloaded from Coursera "Getting and Cleaing Data" course project page. 

## Notes on raw data (originally contained in downloaded files)

###For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The dataset includes the following files:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

####Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

#Creating the tidy datatset

Below are high level steps to create the tidy dataset using run_analysis.R For more complete information on run_analysis.R see the README.md file. 

* Import both the raw data and data labels for test and train data. 
* Combine the test and train data
* Create a tidy dataset which contains the mean of all columns grouped by subject and activity.
* Write the tidy dataset to .txt file

#Variables

* Subject: numeric (grouping variable)
* Activity.Name: character (grouping variable)
* tBodyAcc.mean...X: numeric
* tBodyAcc.mean...Y: numeric
* tBodyAcc.mean...Z: numeric
* tBodyAcc.std...X: numeric
* tBodyAcc.std...Y: numeric
* tBodyAcc.std...Z: numeric
* tGravityAcc.mean...X: numeric
* tGravityAcc.mean...Y: numeric
* tGravityAcc.mean...Z: numeric
* tGravityAcc.std...X: numeric
* tGravityAcc.std...Y: numeric
* tGravityAcc.std...Z: numeric
* tBodyAccJerk.mean...X: numeric
* tBodyAccJerk.mean...Y: numeric
* tBodyAccJerk.mean...Z: numeric
* tBodyAccJerk.std...X: numeric
* tBodyAccJerk.std...Y: numeric
* tBodyAccJerk.std...Z: numeric
* tBodyGyro.mean...X: numeric
* tBodyGyro.mean...Y: numeric
* tBodyGyro.mean...Z: numeric
* tBodyGyro.std...X: numeric
* tBodyGyro.std...Y: numeric
* tBodyGyro.std...Z: numeric
* tBodyGyroJerk.mean...X: numeric
* tBodyGyroJerk.mean...Y: numeric
* tBodyGyroJerk.mean...Z: numeric
* tBodyGyroJerk.std...X: numeric
* tBodyGyroJerk.std...Y: numeric
* tBodyGyroJerk.std...Z: numeric
* tBodyAccMag.mean..: numeric
* tBodyAccMag.std..: numeric
* tGravityAccMag.mean..: numeric
* tGravityAccMag.std..: numeric
* tBodyAccJerkMag.mean..: numeric
* tBodyAccJerkMag.std..: numeric
* tBodyGyroMag.mean..: numeric
* tBodyGyroMag.std..: numeric
* tBodyGyroJerkMag.mean..: numeric
* tBodyGyroJerkMag.std..: numeric
* fBodyAcc.mean...X: numeric
* fBodyAcc.mean...Y: numeric
* fBodyAcc.mean...Z: numeric
* fBodyAcc.std...X: numeric
* fBodyAcc.std...Y: numeric
* fBodyAcc.std...Z: numeric
* fBodyAcc.meanFreq...X: numeric
* fBodyAcc.meanFreq...Y: numeric
* fBodyAcc.meanFreq...Z: numeric
* fBodyAccJerk.mean...X: numeric
* fBodyAccJerk.mean...Y: numeric
* fBodyAccJerk.mean...Z: numeric
* fBodyAccJerk.std...X: numeric
* fBodyAccJerk.std...Y: numeric
* fBodyAccJerk.std...Z: numeric
* fBodyAccJerk.meanFreq...X: numeric
* fBodyAccJerk.meanFreq...Y: numeric
* fBodyAccJerk.meanFreq...Z: numeric
* fBodyGyro.mean...X: numeric
* fBodyGyro.mean...Y: numeric
* fBodyGyro.mean...Z: numeric
* fBodyGyro.std...X: numeric
* fBodyGyro.std...Y: numeric
* fBodyGyro.std...Z: numeric
* fBodyGyro.meanFreq...X: numeric
* fBodyGyro.meanFreq...Y: numeric
* fBodyGyro.meanFreq...Z: numeric
* fBodyAccMag.mean..: numeric
* fBodyAccMag.std..: numeric
* fBodyAccMag.meanFreq..: numeric
* fBodyBodyAccJerkMag.mean..: numeric
* fBodyBodyAccJerkMag.std..: numeric
* fBodyBodyAccJerkMag.meanFreq..: numeric
* fBodyBodyGyroMag.mean..: numeric
* fBodyBodyGyroMag.std..: numeric
* fBodyBodyGyroMag.meanFreq..: numeric
* fBodyBodyGyroJerkMag.mean..: numeric
* fBodyBodyGyroJerkMag.std..: numeric
* fBodyBodyGyroJerkMag.meanFreq..: numeric
* angle.tBodyAccMean.gravity.: numeric
* angle.tBodyAccJerkMean..gravityMean.: numeric
* angle.tBodyGyroMean.gravityMean.: numeric
* angle.tBodyGyroJerkMean.gravityMean.: numeric
* angle.X.gravityMean.: numeric
* angle.Y.gravityMean.: numeric
* angle.Z.gravityMean.: numeric
