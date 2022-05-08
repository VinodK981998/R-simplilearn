#Filtering data, editing data.frame, 
#recasting - melt and cast library(reshape2)
#creating new columns based on already existing columns - mutate library(dplyr)
#joining data btw two or more dataframes - 
#creating and loading functions, MIMO functions

library(dplyr)
bank_df<-as.data.frame(read.csv2("dataset/demo_1.csv",header = TRUE,
                                                   sep=","))

#filtering using subset
bank_df2 <-subset(bank_df$age==30 & job=='unemployed' )
#filtering data frame properties
bank_df3<- bank_df[bank_df$age==30 ,]# bank_df$job=='unemployed',:]
#filter() dplyr
bank_df3<- filter(bank_df,age==30 & job=='unemployed')

#editing data frames
bank_df2$job[bank_df2$job=='unemployed'] <- 'NO JOB'           # single column
bank_df2[bank_df2=='unemployed'] <- 'NO JOB'                   # whole table
#edit()
bank_df2<-edit(bank_df2) #Editing of data frames and matrixes is not supported in RStudio.

#rbind and cbind
bank_df2<-bank_df3[1:4] #data filtering for easier changes
bank_df2<-rbind(bank_df2,c(as.integer(23),'no','m','s')) #by list data updated in order
#if above statment show error make data frame StringasFactors=False
bank_df2$age<-as.integer(bank_df2$age) #age converted back to int
bank_df2<-rbind(bank_df2,data.frame(age=23,job='no',marital='m',education='s')) # data frame needs column names

bank_df2<-cbind(bank_df2,new=NA) #by list data updated in order data empty '' for no chr

#deleting rows and columns '-' sign for deletion
bank_df2<-bank_df3[-(4:9) ]
print(bank_df2[,!colnames(bank_df2) %in% c('age')]) #excluding column age, # names/colnames for colnames
# names(bank_df2)
# colnames(bank_df2)
print(bank_df2[bank_df2$day > 12,]) #excluding rows with days <=12


#recasting
pd<-data.frame('Name'=c('sam','sam','senthil','senthil'),'Month'=c('jan','feb','jan','feb'),
               'BP'=c(90,100,76,86),'BS'=c(140.2,132.4,144,143.2))
install.packages("reshape2")
library(reshape2)
df<-melt(pd,id.vars = c('Name','Month'),measure.vars = c('BP','BS'))
df2<-dcast(df,variable+Month~Name,value.var = "value")

#creating new column based on available columns
library(dplyr)
pd2<-mutate(pd,log_bp=log(BP),sum_B.SP=BP+BS)

remove(pd2)
#joining dataframes
#2nd data frame 
pd2<-data.frame("Names"=c('sam','Senthil','ramesh'),'Department'=c('PSE','Finance','IT'))

#left_join select data from left(df1) and joins with right(df2)
print(left_join(pd,pd2,by=c('Name'='Names'))) #,keep=TRUE if matching row from both tables needed
#right_join select data from right(df2) and joins with left(df1)
print(right_join(pd,pd2,by=c('Name'='Names')))
#inner_join select common data from left(df1) and right(df2)
print(inner_join(pd,pd2,by=c('Name'='Names')))
#full_join return data from both
print(full_join(pd,pd2,by=c('Name'='Names')))
#semi_join  return data from df1 which is common in df1 and df2
print(semi_join(pd,pd2,by=c('Name'='Names')))
#anti_join  return data from df1 which is not in df2
print(anti_join(pd,pd2,by=c('Name'='Names')))

colnames(pd)<-c('NAMES','MONTH','BPBP','BBSBS')

#calling the functions
source("/cloud/project/volcylinder.R")
vol<-volcylinder(5,10)
area<-areacylinder(5,10)
#mimo
result<-cylinder_mimo(5,10)
result['vol']



