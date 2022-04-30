#reading data
#operations performed - select(), muatate(), summarise(), arrange(), filter()
#naming cols and rows


bank_customers <- read.csv2("dataset/demo_1.csv",header = TRUE,
                            sep=",")

#checking structure of bank_customers
str(bank_customers)

#rereading data to create factors(create levels and make data analysis easier)
bank_customers <- read.csv2("dataset/demo_1.csv",header = TRUE,
                            sep=",", stringsAsFactors = TRUE)

#rechecking structure of bank_customers
str(bank_customers)

#trying apply functions
#creating function
avg <- function (x) {sum(unlist(x))/length(x)} 
avg(bank_customers$age)


#apply 1 for row 2 for column
print(apply(bank_customers,2,sum)) # shows error 
lapply(bank_customers$age, avg)


#getting familir with dplyr
install.packages("dplyr")
library(dplyr)

#select 
colnames(select(bank_customers,starts_with('a')))
colnames(select(bank_customers,matches('.a.')))
colnames(select(bank_customers,contains('a')))

#filter
nrow(filter(bank_customers,age>20&age<25)) #nrow = number of rows/ customers

#arrange
arrange(bank_customers,desc(age),month)

#mutate
mutate(bank_customers,new_variable=8)

#summarise
summarise(group_by(bank_customers,age),m=mean(pdays),sd=sd(pdays))

vec<-c(1,'d')
