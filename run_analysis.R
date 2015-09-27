setwd("C:/Users/farah_2/Desktop/R work/GACData")
library(dplyr)



train1<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")
train2<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="", colClasses="numeric")
train3<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")

istrain1<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain2<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain3<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain4<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain5<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain6<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain7<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain8<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE, sep="", colClasses="numeric")
istrain9<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header=FALSE, sep="", colClasses="numeric")

test1<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")
test2<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
test3<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")

istest1<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE, sep="", colClasses="numeric")
istest2<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE, sep="", colClasses="numeric")
istest3<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE, sep="", colClasses="numeric")
istest4<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE, sep="", colClasses="numeric")
istest5<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE, sep="", colClasses="numeric")
istest6<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE, sep="", colClasses="numeric")
istest7<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE, sep="", colClasses="numeric")
istest8<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=FALSE, sep="", colClasses="numeric")
istest9<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE, sep="", colClasses="numeric")

labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.csv("./UCI HAR Dataset/features.txt",sep="",header=FALSE, na.strings=TRUE)
info<-read.table("./UCI HAR Dataset/features_info.txt", skip=12,nrow=16)

participants<-rbind(train1,test1)
data<-rbind(train2,test2)
test3$V1<-as.factor(test3$V1)
train3$V1<-as.factor(train3$V1)
activity<-rbind(train3,test3)
activity<-rename(activity, activity=V1)


f3<-features[grep("std",features$V2,ignore.case=TRUE,fixed=FALSE),]
f2<-features[grep("mean",features$V2,ignore.case=TRUE,fixed=FALSE),]
f<-rbind(f2,f3)
f<-arrange(f,V1)
f<-f[1:79,]

transpose<-t(data)

p<-c(1:561)
p<-as.data.frame(p)
n<-cbind(transpose,p)
f<-rename(f,p=V1)
t<-merge(n,f,by="p")
newdata<-as.data.frame(t(t))
colnames(newdata)<-f$V2
newdata<-newdata[2:10300,]


data1<-cbind(activity,newdata)
data2<-cbind(participants,data1)
data2$V1<-as.factor(data2$V1)
levels(data2$V1)
data3 <- data2[ , !duplicated(colnames(data2))]
final<-data3 %>% group_by(V1,activity) %>% summarise_each(c("mean"),c(3:79))
write.table(final,"./data.txt",row.name=FALSE)
