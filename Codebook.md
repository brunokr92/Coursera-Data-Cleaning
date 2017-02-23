#Codebook on run_analysis.R

###The extracted data was written into the following datasets:

*X_test: Test data set with numerical values for each feature.
*Y_test: Test data set representing the activity being perfomred, numerically.
*subject_test: Test data set representing the subject performing each activity.
*X_train: Train data set with numerical values for each features.
*Y_train: Train data set representing the activity being perfomred, numerically.
*subject_train: Train data set representign the subject performing each activity.
*features: Name of each measurement variable, corresponding to colums on the X_test and X_train datasets. 
*activity_labels: Dataset describing each activity in character string corresponding to the Y_test and Y_train datasets.

###Variables were created to manipulate the data sets:

*variables: Vector with indeces of all features with "mean" or "std" within character string.
*variable_names: Vector with the features found by variables but in string form concatenated with "activity" label.
*X_merged: Merged X_test and X_train data sets.
*Y_merged: Merged Y_test and Y_train data sets with substitution from numerical to string values.
*subject_merged: Merged subject_test adn subject_train.
*XY_merged: Merged X_merged and Y_merged for total manipualted dataset.
*last: mean of each column on XY_merged data set but grouped by subject first and activity second.
