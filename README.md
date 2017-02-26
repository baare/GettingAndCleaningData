# Getting And Cleaning Data

## Raw data

The script assumes the raw data is downloaded and unzipped in <wd>/rawdata. Such that for example
'X_test.txt' is located at <wd>/rawdata/UCI HAR Dataset/test/X_test.txt.
When the script is loaded using source(paste(getwd(), "run_analysis.R", sep = "/")) it will automatically load and process the raw data.
The raw data files will not be changed in any way, so the script can be ran multiple times.

## Clean Data

The script will first load the general data with the feature and label names. 
These names will then be applied to the x, y and subject data of the training set in order to create a clean dataset.
After that the mean and std column are filtered out.

The same process is repeated for the test set data.

The two cleaned set are then combined to yield the final cleaned set. This set is then saved to file in folder <wd>/cleandata.

## aggregate data

The script uses the aggregate function to create the means of the dataset grouped by activity and subject.
This set is also saved to disk in folder <wd>/cleandata 



