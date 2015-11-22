Getting and Cleaning Data Course
================================


If you want to run the script file run_analysis.R you must follow
these instructions.

* Unzip the data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and rename the folder with "Dataset".

* Make sure the folder "Dataset" and the run_analysis.R script are both in the current working directory.

* Use source("run_analysis.R") command in RStudio.
 
* Then, you will find two output files are generated in the current working directory:

  - merged_data.txt: it contains a data frame called cleanedData with 10299*68 dimension.

  - data_means.txt: it contains a data frame called result with 180*68 dimension.

* You can use data <- read.table("data_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
