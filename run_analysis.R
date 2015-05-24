library(plyr)
library(dplyr)

# Read the test and training data in respective data frames
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
x_train <- read.table("train/X_train.txt")

y_test <- read.table("test/Y_test.txt")
y_train <- read.table("train/Y_train.txt")

# Merge the training and test dataframes
x_all <- rbind(x_test, x_train)
y_all <- rbind(y_test, y_train)
subject_all <- rbind(subject_test, subject_train)

# Read the vairable names that will be used for x_all data frame
features <- read.table("features.txt", stringsAsFactors = FALSE)

# Make more meaningful variable names by removing '(', ')' & '-' and using '.' instead
x_col_names <- gsub("\\(\\)", "", features$V2)
x_col_names <- gsub("-", ".", x_col_names)

# Set the column names for x_all data frame
names(x_all) <- x_col_names

# Only the columns that correspond to mean and standard deviation are to be used, hence select those
selected_cols <- c(grep('(mean|std)',names(x_all), value = TRUE))
# Filter the x_all dataframe to use desired columns only
x_selected <- x_all[selected_cols]

# Map the subjects to the data frame as a new column 'user'
x_selected$user <- subject_all$V1
# Map the activityId to the data frame as a new column 'activityId'
x_selected$activityId <- y_all$V1

# Read the activity labels data
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
names(activity_labels) <- c("activityId", "activityName")

# Join the activity labels to the data frame for means and remove the activityId column alltogether
x_final <- join(x_selected, activity_labels, by = "activityId", type="inner", match = "all")
x_final$activityId <- NULL

# For each group identified by (subject, activityName) calculate the means of each vairable
x_final <- x_final %>% group_by(user, activityName) %>% summarise_each(funs(mean))

# Write the resulting dataframe to a file with no row names. Column Names would still be present.
write.table(x_final, "subject_activity_summary.txt", row.name = FALSE)
