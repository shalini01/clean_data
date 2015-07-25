library(plyr)

xtrain <- read.table("C:/Users/Shalini/Desktop/merge/xtrain.txt")
ytrain <- read.table("C:/Users/Shalini/Desktop/merge/ytrain.txt")
subject_train <- read.table("C:/Users/Shalini/Desktop/merge/subject_train.txt")

x_test <- read.table("C:/Users/Shalini/Desktop/merge/X_test.txt")
y_test <- read.table("C:/Users/Shalini/Desktop/merge/y_test.txt")
subject_test <- read.table("C:/Users/Shalini/Desktop/merge/subject_test.txt")

# create 'x' data set
x_data <- rbind(xtrain, x_test)

# create 'y' data set
y_data <- rbind(ytrain, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

features <- read.table("features.txt")

mean&std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean&std_features]

# correct the column names
names(x_data) <- features[mean&std_features, 2]

activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


names(subject_data) <- "subject"

# bind all the data in a single data set
all_data_combine <- cbind(x_data, y_data, subject_data)

avg <- ddply(all_data_combine, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg, "averages_data.txt", row.name=FALSE)
