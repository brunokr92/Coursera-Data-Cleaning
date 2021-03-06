#Get data sets and read them
activity_labels <- as.character(read.table("activity_labels.txt"))
features <- read.table("features.txt")
setwd("test")
X_test <- read.table("X_test.txt")
Y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
setwd("..")
setwd("train")
X_train <- read.table("X_train.txt")
Y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")



#Get Mean and Standard Deviation Index
variables<- c(grep("mean\\(\\)",features[,2]), grep("std\\(\\)",features[,2]))



#Get activity labels and variable names
variable_names <- c(as.character(features[variables,2]), "activity")



#Merge Test and Train data sets and mutate activity labels
X_merged <- rbind(X_test,X_train) %>% select(variables)
Y_merged <- rbind(Y_test,Y_train) 
Y_merged <- Y_merged %>% mutate(activity = ifelse(Y_merged$V1 == 1,"WALKING", ifelse(Y_merged$V1 == 2,"WALKING_UPSTAIRS" , ifelse(Y_merged$V1 == 3,"WALKING_DOWNSTAIRS" , ifelse(Y_merged$V1 == 4,"SITTING",ifelse(Y_merged$V1 == 5,"STANDING","LAYING"))))))
subject_merged <- rbind(subject_test,subject_train) 



#Merge for complete data set with variable names
XY_merged <- cbind(X_merged,Y_merged$activity)
names(XY_merged) = variable_names



#Final data set from grouped mean (Activity, Subject)
XY_SUB_merged <- cbind(XY_merged,subject_merged)
names(XY_SUB_merged)[68] <- "Subject"
last <- XY_SUB_merged %>% group_by(Subject,activity) %>% summarize_each(funs(mean))

#Write the final data set into a table in text form
setwd("..")
write.table(last,"last_table.txt")