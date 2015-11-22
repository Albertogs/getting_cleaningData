## Getting and Cleaning  Data Course Project CodeBook
=====================================================
In this file it is described the variables, the data used, and the transformations in order to clean up the data.
*Project whose data were used:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
*Where the data was downloaded:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*The script called run_analysis.R carries out the following tasks to clean the data:
1. Reading the feature and activity files.
2. Reading the train data.
3. Reading the test data.
4. Merging the train and the test data.
5. Extracting the mean and std features.
6. Writing the clean data in merged_data.txt.
7. Performing the average of the clean data for each subject and activity.
8. Writing the results in data_means.txt.
 Alberto Gallardo 2015 All Rights reserved. 
