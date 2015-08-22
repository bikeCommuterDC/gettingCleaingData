library(dplyr)

setwd("C:/Users/rbechtel/Dropbox/Coursera/3_Getting_Cleaning_Data/UCI HAR Dataset")

##IMPORT AND PREARE DATA FOR BOTH TEST AND TRAIN

#import activity number and name crosswalk, label the columns "Activity" and "Activity.Name"
activity_labels <- read.table("activity_labels.txt", col.names = c("Activity", "Activity.Name"))

#read in the 2nd column of features.txt which has the actual feature names
features <- read.table("features.txt")
features <- features[,2]

#the following function inmports and cleans data for either "test" or "train"
proccessData <- function(set){
        
        #read in subject data, name column "Subject"
        subject <- read.table(paste("./",set,"/subject_",set,".txt", sep = ""), col.names = "Subject")
        
        #read measurement data and use features as the column names
        X <- read.table(paste("./", set,"/X_",set,".txt", sep = ""), col.names = features)
        
        #select the fields from training data that are mean and std dev values
        mean.std <- X %>%
                select(matches("mean|std"))
        
        #read activity data
        Y <- read.table(paste("./", set, "/Y_",set,".txt", sep = ""), col.names = "Activity")
        
        #add the activity name to the activity data
        activity.data <- left_join(Y, activity_labels, by = "Activity")
        
        #combine subject, activity and measurement data
        measure.data <- cbind(subject, activity.data, mean.std)
        
        measure.data <- measure.data %>%
                #mutate(category = set) %>%
                select(-Activity)
        
        measure.data
        
}

#process training data
train.data <- proccessData(set = "Train")

#proccess test data
test.data <- proccessData(set = "Test")

#merge training and test sets to create one dataset
combined <- rbind(train.data, test.data)

#create tidy dataset with means for each subject-activity
        #combination for all measures
mean.tidy<- combined %>%
                group_by(Subject, Activity.Name) %>%
                summarise_each(funs(mean))

#move up one folder in directory
setwd("..")

#write tidy data to text file
write.table(mean.tidy, file = "tidy.data.txt", sep = "\t", row.name = FALSE)
                
                


