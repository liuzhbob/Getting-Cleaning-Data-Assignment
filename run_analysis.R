#1.Merge datasets
getwd()
setwd("E:/1_Desktop/3 Skills Enhancement/5 Professional Development/5 Data Science/3_Getting&Clean Data/Homework/Assignment")
traindata<-read.table("./Data/train/X_train.txt")
dim(traindata)
trainlable<-read.table("./Data/train/y_train.txt")
table(trainlable)
trainsubj<-read.table("./Data/train/subject_train.txt")
testdata<-read.table("./Data/test/X_test.txt")
dim(testdata)
testlabel<-read.table("./Data/test/y_test.txt")
table(testlabel)
testsubj<-read.table("./Data/test/subject_test.txt")
joindata<-rbind(traindata,testdata)
dim(joindata)
joinlabel<-rbind(trainlable,testlabel)
joinsubj<-rbind(trainsubj,testsubj)
dim(joinsubj)

#2.Extract
features<-read.table("./Data/features.txt")
dim(features)
head(features)
meanstd<-grep("mean\\(\\)|std\\(\\)",features[,2])
length(meanstd)
joindata<-joindata[,meanstd]
dim(joindata)


#3.Name activities
activity <- read.table("./Data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinlabel[, 1], 2]
joinlabel[, 1] <- activityLabel
names(joinlabel) <- "activity"

#4.label the data set, write the 1st dataset
names(joinsubj) <- "subject"
cleaneddata <- cbind(joinsubj, joinlabel, joindata)
dim(cleaneddata)
write.table(cleaneddata, "data1.txt")

#5. 2nd dataset - average of each variable for each activity and subject
subjectLeng <- length(table(joinsubj))
activityLeng <- dim(activity)[1]
columnLeng <- dim(cleaneddata)[2]
result <- matrix(NA, nrow = subjectLeng * activityLeng, ncol=columnLeng)
result <- as.data.frame(result)
colnames(result) <- colnames(cleaneddata)
row <- 1
for(i in 1:subjectLeng) {
  for(j in 1:activityLeng) {
    result[row, 1] <- sort(unique(joinsubj)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleaneddata$subject
    bool2 <- activity[j, 2] == cleaneddata$activity
    result[row, 3:columnLeng] <- colMeans(cleaneddata[bool1&bool2, 3:columnLeng])
    row <- row + 1
  }
}
write.table(result, "data2.txt")