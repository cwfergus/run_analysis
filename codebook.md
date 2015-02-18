---
title: "CodeBook"
author: "Cameron Ferguson"
date: "Tuesday, February 17, 2015"
output: html_document
---

#run_analysis Codebook

This is the codebook for the run_analysis script. The following document will describe the raw data, all the elements that the script uses, as well as the final data.

View the ReadMe for information on the flow and logic of the script, as well as specific liscense. 

---

###Raw Data

The Raw data is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For this script to work, the data must be unzipped in the current working directory.

An experiment was run with 30 different subjects, doing 6 different activites. The subject ID's and the Activites names are kept in seperate files. 

The data is collected using two devices within a Samsung smartphone, an Accelerometer and a Gyroscope. Data is taken as time domain series, and for the Accelerometer is split between Body and Gravity accerleration. Jerk values are also determined, as well as the Magnitude for each measurement type. Finally each measurement is put through a Fast Forium Transform, outputting a frequency value. 

This results in data with 561 variables, over 10299 observations.

The data used in this script is not technically RAW, as we are using values after certain mathematical operations are taken. We just focus on Mean and Standard Deviation data.

---

###Tidy Data
In order to make the data tidy, I combined the Test and the Train data sets, which were randomly choosen by the data producers anyway. Then I extracted out just variables with mean() or std() in order to get just the variables that relate to mean or standard deviation. Next I adjusted the names to make more sense, and to correct some errors from their naming. Here is how variable names work.

unitLocation(type?)Device(type?)-Math-Direction

<b>unit</b>: this can be either t, for time, or f, for frequency
<b>Location</b>: this can be either Body or Gravity
<b>type</b>: This is an optional variable, specifying either a Jerk measurement or a Magnitude measurement.
<b>Device</b>: This is either Accelerometer or Gyroscope, indicating the measuring device
<b>Math</b>: is either mean or standard_deviation, meaning that its either a measurement of the mean or the standard_deviation.
<b>Direction</b>: Is either x, y, or z, indication the movement direction

The following are column names ("/" mean one of each is present):

tBodyAccelerometer-Mean/Standard_Deviation-X/Y/Z
tGravityAccelerometer-Mean/Standard_deviation-X/Y/Z
tBodyJerkAccelerometer-Mean/Standard_Deviation-X/Y/Z
tBodyGyroscope-Mean/Standard_deviation-X/Y/Z
tBodyGyroscopeJerk-Mean/Standard_Deviation-X/Y/Z
tBodyAccelerometerMagnitude-Mean/Standard_Deviation
tGravityAccelerometerMagnitude-Mean/Standard_Deviation
tBodyAccelerometerJerkMagnitude-Mean/Standard_Deviation
tBodyGyroscopeMagnitude-Mean/Standard_Deviation
tBodyGyroscopeJerkMagnitude-Mean/Standard_Deviation

fBodyAccelerometer-Mean/Standard_Deviation-X/Y/Z
fBodyAccelerometerJerk-Mean/Standard_Deviation-X/Y/Z
fBodyGyroscope-Mean/Standard_Deviation-X/Y/Z
fBodyAccelerometerMagnitude-Mean/Standard_Deviation
fBodyAccelerometerJerkMagnitude-Mean/Standard_Deviation
fBodyGyroscopeMagnitude-Mean/Standard_Deviation
fBodyGyroscopeJerkMagnitude-Mean/Standard_Deviation

Additional columns, ie the first two, refer to:
The Subject_ID which is which of 30 people where performing the activity
Activity_Name which is what activity people where doing (out of 6 possible choices)

Next we determine the mean of each measurement for each subject and activity. IE we have a set of means for the measurements for subject 2 Walking, or subject 28 Sitting. This results in 180 observations, one for each subject doing each activity (30 subjects x 6 activites). Then we have the mean value for the 66 values we previous selected. 
