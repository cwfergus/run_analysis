#run_analysis.R
#1
if (file.exists("UCI HAR Dataset") != TRUE){
        stop("UCI HAR Dataset folder is not in working directory")
}

file_name <- readline("Enter your desired final data file name. Filename = ")
#2
library(data.table)
library(dplyr)
#3
feature_measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
feature_measurements_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
feature_list <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
#4
feature_measurement_data <- rbind(feature_measurements_test, feature_measurements_train)
activity_data <- rbind(activity_test, activity_train)
subject_data <- rbind(subject_test, subject_train)
#5
rm(subject_test, feature_measurements_test, activity_test, subject_train, feature_measurements_train, activity_train)
#6
mean_col_numbers <- grep("mean()", feature_list[,2], fixed=TRUE)
std_col_numbers <- grep("std()", feature_list[,2], fixed=TRUE)
column_numbers <- sort(c(mean_col_numbers, std_col_numbers))
#7
selc_measurement_data <- feature_measurement_data[,column_numbers]
#8
column_names <- as.character(feature_list[column_numbers, 2])
#9
gsub("mean()", "mean", column_names, fixed = TRUE) -> column_names
gsub("Acc", "Accelerometer", column_names, fixed = T) -> column_names
gsub("BodyBody", "Body", column_names, fixed=T) -> column_names
gsub("Mag", "Magnitude", column_names, fixed=T) -> column_names
gsub("Gyro", "Gyroscope", column_names, fixed=T) -> column_names
gsub("std()", "Standard_Deviation", column_names, fixed=T) -> column_names
#10
colnames(selc_measurement_data) <- column_names
colnames(activity_data) <- "Activity"
colnames(subject_data) <- "Subject_ID"
colnames(activity_labels) <- c("Activity", "Activity_Name")
#11
full_data <- cbind(subject_data, activity_data, selc_measurement_data)
#12
rm(feature_measurement_data)
rm(subject_data, activity_data, selc_measurement_data, feature_list)
rm(column_numbers, mean_col_numbers, std_col_numbers, column_names)
#13
Clean_Intermediate <- merge(activity_labels, full_data, by="Activity")
#14
rm(full_data, activity_labels)
#15
CI_tbl_df <- tbl_df(Clean_Intermediate)
#16
rm(Clean_Intermediate)
#17
CI_tbl_df <- select(CI_tbl_df, -Activity)
#18
grouped_data <- group_by(CI_tbl_df, Activity_Name, Subject_ID)
#19
rm(CI_tbl_df)
#20
clean_tidy <- summarise_each(grouped_data, funs(mean))
#21
rm(grouped_data)
#22
write.table(clean_tidy, file_name, row.names=FALSE)




