## DPLYR PACKAGE REQUIERED. INSTALL AND LOAD IF NOT AVAILABLE.
install.packages("dplyr")
library("dplyr")


### DATA LOAD

##ACTIVITY
activity.label <- setNames(read.csv("activity_labels.txt", sep="", header=FALSE),c("ID","ACTIVITY"))
activity <- setNames(rbind(read.csv("train/y_train.txt", sep="", header=FALSE),read.csv("test/y_test.txt", sep="", header=FALSE)), c("ID"))
activity <- merge(activity, activity.label, by="ID")[,2]

##SUBJECT
subject <- setNames(rbind(read.csv("train/subject_train.txt", sep="", header=FALSE),read.csv("test/subject_test.txt", sep="", header=FALSE)),c("SUBJECT"))

##MEASURES
body_acc_x <- rbind(read.csv("train/Inertial Signals/body_acc_x_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_acc_x_test.txt", sep="", header=FALSE))
body_acc_y <- rbind(read.csv("train/Inertial Signals/body_acc_y_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_acc_y_test.txt", sep="", header=FALSE))
body_acc_z <- rbind(read.csv("train/Inertial Signals/body_acc_z_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_acc_z_test.txt", sep="", header=FALSE))
body_gyro_x <- rbind(read.csv("train/Inertial Signals/body_gyro_x_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_gyro_x_test.txt", sep="", header=FALSE))
body_gyro_y <- rbind(read.csv("train/Inertial Signals/body_gyro_y_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_gyro_y_test.txt", sep="", header=FALSE))
body_gyro_z <- rbind(read.csv("train/Inertial Signals/body_gyro_z_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/body_gyro_z_test.txt", sep="", header=FALSE))
total_acc_x <- rbind(read.csv("train/Inertial Signals/total_acc_x_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/total_acc_x_test.txt", sep="", header=FALSE))
total_acc_y <- rbind(read.csv("train/Inertial Signals/total_acc_y_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/total_acc_y_test.txt", sep="", header=FALSE))
total_acc_z <- rbind(read.csv("train/Inertial Signals/total_acc_z_train.txt", sep="", header=FALSE),read.csv("test/Inertial Signals/total_acc_z_test.txt", sep="", header=FALSE))

### CALCULATIONS
## BODY ACC
body_acc_x_mn = apply(body_acc_x,1,mean)
body_acc_x_sd = apply(body_acc_x,1,sd)
body_acc_y_mn = apply(body_acc_y,1,mean)
body_acc_y_sd = apply(body_acc_y,1,sd)
body_acc_z_mn = apply(body_acc_z,1,mean)
body_acc_z_sd = apply(body_acc_z,1,sd)
##GYRO
body_gyro_x_mn = apply(body_gyro_x,1,mean)
body_gyro_x_sd = apply(body_gyro_x,1,sd)
body_gyro_y_mn = apply(body_gyro_y,1,mean)
body_gyro_y_sd = apply(body_gyro_y,1,sd)
body_gyro_z_mn = apply(body_gyro_z,1,mean)
body_gyro_z_sd = apply(body_gyro_z,1,sd)
##TOTAL ACC
total_acc_x_mn = apply(total_acc_x,1,mean)
total_acc_x_sd = apply(total_acc_x,1,sd)
total_acc_y_mn = apply(total_acc_y,1,mean)
total_acc_y_sd = apply(total_acc_y,1,sd)
total_acc_z_mn = apply(total_acc_z,1,mean)
total_acc_z_sd = apply(total_acc_z,1,sd)

###RESULT STEP 4
result.1 <- setNames(cbind(activity, subject
                         , body_acc_x_mn, body_acc_x_sd, body_acc_y_mn, body_acc_y_sd, body_acc_z_mn, body_acc_z_sd
                         , body_gyro_x_mn, body_gyro_x_sd, body_gyro_y_mn, body_gyro_y_sd, body_gyro_z_mn, body_gyro_z_sd
                         , total_acc_x_mn, total_acc_x_sd, total_acc_y_mn, total_acc_y_sd, total_acc_z_mn, total_acc_z_sd
                         ),
                   c("ACTIVITY","SUBJECT"
                     ,"BODY_ACC_X_MEAN","BODY_ACC_X_STD","BODY_ACC_Y_MEAN","BODY_ACC_Y_STD","BODY_ACC_Z_MEAN","BODY_ACC_Z_STD"
                     ,"BODY_GYRO_X_MEAN","BODY_GYRO_X_STD","BODY_GYRO_Y_MEAN","BODY_GYRO_Y_STD","BODY_GYRO_Z_MEAN","BODY_GYRO_Z_STD"
                     ,"TOTAL_ACC_X_MEAN","TOTAL_ACC_X_STD","TOTAL_ACC_Y_MEAN","TOTAL_ACC_Y_STD","TOTAL_ACC_Z_MEAN","TOTAL_ACC_Z_STD"
                     )
                   )

##RESULT STEP 5
group <- group_by(result.1, ACTIVITY, SUBJECT)
result.2 <- summarize(group
                    ,BODY_ACC_X_MEAN = mean(BODY_ACC_X_MEAN)
                    ,BODY_ACC_Y_MEAN = mean(BODY_ACC_Y_MEAN)
                    ,BODY_ACC_Z_MEAN = mean(BODY_ACC_Z_MEAN)
                    ,BODY_GYRO_X_MEAN = mean(BODY_GYRO_X_MEAN)
                    ,BODY_GYRO_Y_MEAN = mean(BODY_GYRO_Y_MEAN)
                    ,BODY_GYRO_Z_MEAN = mean(BODY_GYRO_Z_MEAN)
                    ,TOTAL_ACC_X_MEAN = mean(TOTAL_ACC_X_MEAN)
                    ,TOTAL_ACC_Y_MEAN = mean(TOTAL_ACC_Y_MEAN)
                    ,TOTAL_ACC_Z_MEAN = mean(TOTAL_ACC_Z_MEAN)
          )
result.2 <- arrange(result.2, ACTIVITY, SUBJECT)
