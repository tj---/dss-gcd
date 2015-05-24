Gathering and Cleaning Data - Course Project
============================================
* Project Details - [here](https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions)
* Prerequisite - `plyr` and `dplyr` packages must already be installed.
* Download the data for the project from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* Extract the data by unzipping the zip downloaded in the previous step.
* Set the working directory by running the following command in R console: `setwd('<dir_name>')`. For example, if the extracted data is present in this directory : `/Users/foo/cra/gcd/UCI_HAR_DataSet`, execute `setwd("/Users/foo/cra/gcd/UCI_HAR_DataSet")`
* Copy `run_analysis.R` to the working directory
* Source the `run_analysis.R` by running `source("run_analysis.R")`
* The desired output file _subject_activity_summary.txt_ will be generated in the working directory.

Description of files
====================
* run_analysis.R - R script that does all of the processing that results in the tidy dataset
* CodeBook - Describes the variables, structure of the data, datatype of the columns and the steps involved in generating the tidy dataset
* features_info.txt - Description of standard variables in the dataset (referred in the CodeBook).
