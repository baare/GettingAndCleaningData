
## source(paste(getwd(), "run_analysis.R", sep = "/")) 


## read the files containing the general data
## the feature names
names <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset", "features.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)[,2]
## the activity labels
act_labels <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset", "activity_labels.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)
names(act_labels) <- c("actvity_id","activity") 


## read & clean training set data
x_train <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/train", "X_train.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)
y_train <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/train", "y_train.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)
subject_train <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/train", "subject_train.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)

## set the names of the columns
names(x_train) <- names
names(y_train)[1] <- 'actvity_id'
names(subject_train) <- c("subject")

## filter the columns we need ( mean and standard deviations ) 
x_train_s <- x_train[,grep("(mean\\(\\)|std\\(\\))", names(x_train))]

## combine all the data frames
f_train <- cbind(subject_train, cbind(y_train, x_train_s))
## merge the label names
l_train <- merge(act_labels, f_train)


## read & clean test set data
x_test <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/test", "X_test.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)
y_test <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/test", "y_test.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)
subject_test <- read.csv(paste(getwd(), "rawdata/UCI HAR Dataset/test", "subject_test.txt", sep = "/"), sep = "", strip.white = TRUE, header = FALSE)

## set the names of the columns
names(x_test) <- names
names(y_test)[1] <- 'actvity_id'
names(subject_test) <- c("subject")

## filter the columns we need ( mean and standard deviations ) 
x_test_s <- x_test[,grep("(mean\\(\\)|std\\(\\))", names(x_test))]

## combine all the data frames
f_test <- cbind(subject_test, cbind(y_test, x_test_s))
## merge the label names
l_test <- merge(act_labels, f_test)

## combine training and test data
full <- rbind(l_train, l_test)
## write the set to file
write.table(full, paste(getwd(), "cleandata", "full_set.txt", sep = "/"), row.name=FALSE)



## 5. aggregated the data by subject and activity
aggr <- suppressWarnings(aggregate(x = full, by = list(full$activity, full$subject), FUN = "mean")[,-c(4,5)])
## tidy the names
names(aggr)[1] <- "activity"
names(aggr)[2] <- "subject"
## write the result to file
write.table(aggr, paste(getwd(), "cleandata", "aggregated_set.txt", sep = "/"), row.name=FALSE)

