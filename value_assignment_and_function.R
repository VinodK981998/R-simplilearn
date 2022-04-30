#reading the file with factors
#operations performed - plyr package, rename, deleting cols, comparing two cols
# 3 methods of column creation transform(ifelse), lapply&function , mutate
# way frequency table

bank_customers <- read.csv2("dataset/demo_2.csv",header=TRUE, sep = ',', stringsAsFactors = TRUE)
test1<-bank_customers

library(dplyr)
library(plyr)

#renaming columns
#bank_customers <- rename(bank_customers,c('i.age'='age'))

#method 1 - vectorised ifelse 
#creating catergories age<22 -> Z
#                     22<age<41 -> Y
#                     41<age<53 -> x else baby boomers

categories <- transform(bank_customers,Generation = ifelse(age<22,'z', ifelse(age<41, 'y', ifelse(age<53, 'x', 'baby boomers' ))))

#method 2 - lapply and function
gen <- function(age){
  if(age<22) {return('z')}
  else if (age<41) {return('y')}
  else if (age<53) {return('x')} 
  else {return('baby boomers')}
  
}

#as.character makes this col character and not list(default)
bank_customers$generation<- as.character(lapply(bank_customers$age, gen))


#deleting columns
#test1 <- subset(test1,select=c(1:15))

#method 3 - using mutate
test1 <- test1 %>%
  mutate(generation = case_when(
    age<22 ~ 'z',
    age<41 ~ 'y',
    age<53 ~ 'x',
    age>=53 ~ 'baby boomers'
  ))

#confirming if both methods givve smae output
st=as.factor(ifelse(categories$Generation==test1$Status,'yes','no'))
view(st)


#way frequency table
table(test1$generation,test1$poutcome)
#summarise(group_by(test1,generation,poutcome),distinct(generation),count(test1$poutcome))
#table(bank_customers$generation,bank_customers$poutcome)

