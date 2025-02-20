---
title: "README"
author: "Cameron Ferguson"
date: "February, 2015"
output: html_document
---

## Assignment Overview
This script was written to complete the course project for Getting and Cleaning Data,
a John Hopkins Sponsered Coursera Course.The instructions for this assignment where as follows:
 
1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement. 
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names. 
5)From the data set in step 4, creates a second, independent tidy data set with 
  the average of each variable for each activity and each subject.

In order for this script to work the User must have the following data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

These were originally obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

These data were collected from accelerometers from the Samsung Galaxy S smartphone. To find out more about the raw data, visit the above listed website or view the README that accomanies the raw data download. 

---

##Script Description:

Below is a step by step description of the script. First however a quick summary:

First the script checks for existance of the Raw data, and then prompts the user to name their final data file. The script then loads the relevant files and libraries, and binds related files together. Along the way the script constantly removes unneeded files/values/ and variables to limit memory use.Next it determines which measearments are needed, and creates a column list, which it uses to extract only the relevant measurements and their associated names. Next it cleans up measurement names, getting rid of R incompatible objects and extending any shortened words. Finally it adds all the data files together, all with descriptive names for both the Activities and the measurements.It take this chopped data and calculates the Mean of each measurement for every activity and subject:

ie For Walking, Subject 2, it calculates the mean of all 66 measurements that related to mean or Standard Deviation.

It writes the output of this to a .txt file called by default "clean_tidy" name that name.txt

### Script Flow
 This script does the following things:

1) Checks for existance of UCI HAR Dataset folder in the current WD. And prompts for final file name <br>
2) Loads required packages. See Code Book and Read Me for more info.<br>
3) Reads in all the data containing files from the Dataset. See Code book for info.<br>
4) Binds together the test and train data<br>
5) removes used files<br>
6) finds the features that contain mean() or std(), and makes a sorted list of the column numbers<br>
7) Uses that list to extract just those variables from the measurement data<br>
8) Makes a list of variable names by using the column numbers list again.<br>
9) Edits the names to be more readable, and remove R incompatible symbols<br>
9) Adds column names to the remaining four data/label files<br>
10) Binds the three data files together<br>
11) removes unnecessary files/values<br>
12) Merges the activity-labels file with the full-data file to give descriptive activity names<br>
13) Removes everything but the now Clean, Intermediate File.<br>
14) Converts Clean-Intermediate to a tbl_df file to enable DPLYR package functions<br>
15) removes old clean_intermediate DF<br>
16) Removes redundant Activity column using select(-Activity), which just contains numbers not names. <br>
17) groups CI-tbl-df by Activity-Name and Subject_ID<br>
18) Removes the ungrouped CI-tbl-df<br>
19) Runs the mean function on each variable for each activity and each subject<br>
20) Removes the grouped_data<br>
21) writes out the new Tidy data set with write.table(file= file_name, row.names=FALSE)<br>

---

### Notes
To view variable, data, and other information view the included Codebook

---

### License
This data was provided under license from 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Help was provided by David Hood on his Course Project FAQ thread linked to below
https://class.coursera.org/getdata-011/forum/thread?thread_id=69

Use of summarise_each was inspired by Felipe Balbi in the following thread
https://class.coursera.org/getdata-011/forum/thread?thread_id=180