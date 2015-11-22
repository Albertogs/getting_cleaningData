##------------------------------------------------------------
## Reading activity and features files
##------------------------------------------------------------
v_labels <- read.table("./Dataset/features.txt")
activity <- read.table("./Dataset/activity_labels.txt")
##------------------------------------------------------------
## Reading train files
##------------------------------------------------------------
x_train  <- read.table("./Dataset/train/X_train.txt") ## 7352 561
y_train  <- read.table("./Dataset/train/y_train.txt")
s_train  <- read.table("./Dataset/train/subject_train.txt")
##------------------------------------------------------------
## Loading test files
##------------------------------------------------------------
x_test  <- read.table("./Dataset/test/X_test.txt") ##2947 561
y_test  <- read.table("./Dataset/test/y_test.txt")
s_test  <- read.table("./Dataset/test/subject_test.txt")
##------------------------------------------------------------
## Merging train and test files
##------------------------------------------------------------
x_total <- rbind(x_train, x_test) ##10299 561
y_total <- rbind(y_train, y_test) ##10299 1
s_total <- rbind(s_train, s_test)

v2_total <- cbind(s_total,y_total) ## 10299 2
table_total <- cbind(v2_total, x_total) ## 10299 563
##------------------------------------------------------------
##Extract the mean and std features.
## Some changes in the names of the features to make them more attactive
##------------------------------------------------------------
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", v_labels[,2]) ## 66
table1 <- table_total[, mean_std_indices] ## 10299 66

labels <- v_labels[mean_std_indices, 2]
vnames <- gsub("\\(\\)","", labels)
vnames <- gsub("mean","Mean", vnames)
vnames <- gsub("std","Std", vnames)
vnames <- gsub("-","", vnames)
##-------------------------------------------------------------
## Merge the subject+activity  and table with the rest of features
## Writing the data
##-------------------------------------------------------------
names(table1) <- vnames
 
m <- matrix(0, ncol=1, nrow=dim(y_total)[1])
v_activity <- data.frame(m)
j<- 1
for(i in y_total){
v_activity[j] <- activity[i,2]
j <- j+1
}
names(v_activity) <- "Activity"
names(s_total)    <- "Subject"
cleandata <- cbind(s_total,v_activity,table1) ## 10299 68
write.table(cleandata,"merged_data.txt")
##--------------------------------------------------------------------
## From cleandata is is computed the average of each variable for each activity and subject
## writing the results in data_means.txt
##--------------------------------------------------------------------
n <- 1:dim(cleandata)[1]
actv <- activity[,1]
suje <- 1:length(unique(cleandata$Subject))
m2 <- matrix(0, ncol=dim(cleandata)[2], nrow=length(suje)*length(actv))
cleandata2 <- data.frame(m2)
colnames(cleandata2) <- colnames(cleandata)

k <- 1
for(i in suje){
  for(j in actv){
      
      cleandata2[k, 1] <- i
      cleandata2[k, 2] <- activity[j, 2]
      bool1 <- cleandata$Subject  == i
      bool2 <- cleandata$Activity == activity[j, 2]
      
      cleandata2[k, 3:dim(cleandata)[2]] <- colMeans(cleandata[bool1&bool2, 3:dim(cleandata)[2]])
      k <- k+1
  }
}
write.table(cleandata2,"data_means.txt", row.names = FALSE)



