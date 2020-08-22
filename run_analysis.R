# Analysys for cleaning the data.
# Alvaro Diaz Falconi, August 2020.

# Starts

library(plyr)

# Download the data.
if (!dir.exists('UCI HAR Dataset')) {
  url_dataset = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  filename <- 'UCI HAR Dataset.zip'
  download.file(url_dataset, filename)
  unzip(filename)
}

setwd("UCI HAR Dataset") # Working dir

AS <- c(562, 563)        # To keep activitys and subjects

# Labels the data with descriptive variable names
names   <- read.table("features.txt")
x_test  <- read.table("test/X_test.txt",   col.names=names$V2, na.strings="NA")
x_train <- read.table("train/X_train.txt", col.names=names$V2, na.strings="NA")

# bind columns activity & subject
x_test  <- cbind(x_test,  read.table("test/y_test.txt",         col.names="Activity"))
x_test  <- cbind(x_test,  read.table("test/subject_test.txt",   col.names="Subject"))
x_train <- cbind(x_train, read.table("train/y_train.txt",       col.names="Activity"))
x_train <- cbind(x_train, read.table("train/subject_train.txt", col.names="Subject"))

# Merge training and the test
M1 <- rbind(x_test, x_train)

# Gets measurements on the mean and sd
measurements <- c(grep("-mean\\(\\)|-std\\(\\)", names$V2), AS)
M2 <- M1[,measurements]

# Use descriptive activity names
activityDesc <- read.table("activity_labels.txt")
for (i in 1:6) {
    M2$Activity <- replace(M2$Activity,
                           M2$Activity == i,
                           as.character(activityDesc[activityDesc$V1 == i,2]))
}

# Creates an independent data with the average of each var for activitys and subjects
M3 <- aggregate(. ~ Subject+Activity, M2, ave)

TiddySet <- data.frame()
for(roww in 1:nrow(M3)) {
    for(coll in 1:ncol(M3)) {
        TiddySet[roww,coll] <- M3[roww,][coll][1,][[1]][[1]]
    }
}

MN <- colnames(M3)
MN <- gsub(".mean...X", "X-Mean average", MN)
MN <- gsub(".mean...Y", "Y-Mean average", MN)
MN <- gsub(".mean...Z", "Z-Mean average", MN)
MN <- gsub(".std...X",  "X-Std average",  MN)
MN <- gsub(".std...Y",  "Y-Std average",  MN)
MN <- gsub(".std...Z",  "Z-Std average",  MN)
MN <- gsub(".std..",    " Std average",   MN)
MN <- gsub(".mean..",   " Mean average",  MN)
colnames(TiddySet) <- MN

write.table(TiddySet, "TiddySet.txt")           # The final output.
file.copy("TiddySet.txt","../TiddySet.txt")
