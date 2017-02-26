# Codebook

## Raw data source

The raw data used to create this clean data script can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at their site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Cleaning the data

The result of this project is a single cleaned dataset containing all data from both the test and training sets.
The new dataset also contains fewer comlumns, as only mean and standard deviation values are retained.

Details about the remaining colums can be found in features_info.txt and features.txt

## Cleaning script

The cleaning process is described in README.md and additional comments have been added to the script file itself (run_analysis.R)

## Aggregated data

Finally an aggregated dataset was created containing the averaged data per subject, per activity. The description of the features can be found in aggregated_features.txt 
