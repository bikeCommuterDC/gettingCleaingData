# Read Me for run_analysis.R

## Setup

* Loads the libarary dplyr 
* Sets the working directory, the working directory assumes the train and test data are still stored in separate folders within the working directory
* Imports the activity_labels.txt file that will be used for both train and test data
* Imports features.txt and only keeps the 2nd column which contains the actual feature names

## Import and process both train and test data

run_analysis.R contains a function called processData() that takes in either "test" or "train" as a parameter and then imports and processess the respective data. Below are the steps included in proccessData().

* Subject data is imported
* Measurement data is imported and the names from features.txt are used as th column headers
* Data is filtered to only include columns with headers that contain the strings "mean" or "std". This ensures that only measurements are are recording the average and standard deviation are included. 
* Activity data is imported and the activity names is joined to the activity data
* Activity data and measurement data are combined so we know what activity each measurement was recorded for. 


## Combine train and test data

After running processData() for both "test" and "train" data. We are ready to combine and create a tidy data set using the following steps. 

* Train and Test data are rbinded to create a single "combined" dataset
* A tidy dataset is created by taking the mean of each column and grouping by subject and activity

## Output

* The tidy data is written to .txt file called tidy.data.txt. Row names are excluded. 

