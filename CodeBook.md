
Introduction:
test and train data is combined using rbind() function.Both the files having same number of columns.
Mean and standard deviation is taken for new dataset generated above.
Now these columns extracted,correct names is given from feature.txt.
As activity data is addressed with values 1:6, we are taking activity names and IDs from activity_labels.txt and 
they are substituted in the dataset.
Vague column is corrected.
Output file "averages_data.txt" is generated at last,whoch contains all the average measures of each subject and activity type.


Variables:
xtrain, ytrain, x_test, y_test, subject_train and subject_test contains the data from the downloaded files.
New dataset is created after merging train and test data with variables->x_data, y_data and subject_data
Features contains the correct names for the x_data dataset, so applied to the column names stored in mean_and_std_features.
Same approach for activity names through the activities variable.
x_data, y_data and subject_data is merged to form new dataset "all_data"
At last ddply function from plyr package is used to generate the average measure in .txt file,name "averages_data.txt".

