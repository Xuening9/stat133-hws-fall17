#===========================================================
#title: clean data frame
#description: create a csv data file cleanscores.csv that will contain
#             the required variables to be used in the shiny app
#input(s): data file 'rawscores.csv'
#output(s): data frame of lean data
# Author: Xuening Hu
# Date: 11-26-2017
#===========================================================

# packages
library(readr)
library(dplyr)

#set working directery
setwd('/Users/Xuening/stat133/stat133-hws-fall17/hw04/code')
source('functions.R')

# with "base" read.csv()
dat_raw <- read.csv('../data/rawdata/rawscores.csv',
                    stringsAsFactors = FALSE)
# sink the structure
sink("../output/summary-rawscores.txt")
str(dat_raw)
for(i in 1:ncol(dat_raw)){
  print_stats(dat_raw[ ,i])
}
sink()

#replace Na values with zero
for(i in 1:ncol(dat_raw)){
  dat_raw[is.na(dat_raw[ ,i]),i] <- 0
}

#use rescale100() to rescale quizes

dat_raw$QZ1 <- rescale100(dat_raw$QZ1,0,12)
dat_raw$QZ2 <- rescale100(dat_raw$QZ2,0,18)
dat_raw$QZ3 <- rescale100(dat_raw$QZ3,0,20)
dat_raw$QZ4 <- rescale100(dat_raw$QZ4,0,20)

#add a variable Test1 by rescaling EX1,Test2 by rescaling EX2
Test1 <-  rescale100(dat_raw$EX1,0,80)
Test2 <-  rescale100(dat_raw$EX2,0,90)

#add a variable Homework,this variable should contain the overall
#homework score obtained by dropping the lowest HW, and then 
#averaging theremaining scores
Homework <- list(NA)
for(i in 1:334){
  Homework[i] <- score_homework(c(as.numeric(dat_raw[i,1:9])),drop = TRUE)
  Homework <- as.numeric(Homework)
}

#add a variable Quiz
Quiz <- list(NA)
for(i in 1:334){
  Quiz[i] <- score_quiz(c(as.numeric(dat_raw[i,11:14])),drop = TRUE)
  Quiz <- as.numeric(Quiz)
}
#add a variavle Lab
Lab <- score_lab(dat_raw$ATT)

#add a variable Overall
Overall <- ((0.1*Lab)+(0.3*Homework)+(0.15*Quiz)+
            (0.2*Test1)+(0.25*Test2))
Overall <- rescale100(Overall,0,100)

#add a variable Grade

Grade <- score_grade(Overall)


dat_raw2 <- mutate(dat_raw,Test1,Test2,Homework,Quiz,Lab,Overall,Grade)

#summary statistics for Lab, Homework, Quiz, Test1, Test2,and Overall
sink("../output/Lab-stats.txt")
print_stats(dat_raw2[ ,"Lab"])
sink()

sink("../output/Homework-stats.txt")
print_stats(dat_raw2[ ,"Homework"])
sink()

sink("../output/Quiz-stats.txt")
print_stats(dat_raw2[ ,"Quiz"])
sink()

sink("../output/Test1-stats.txt")
print_stats(dat_raw2[ ,"Test1"])
sink()

sink("../output/Test2-stats.txt")
print_stats(dat_raw2[ ,"Test2"])
sink()

sink("../output/Overall-stats.txt")
print_stats(dat_raw2[ ,"Overall"])
sink()

sink("../output/summary-cleanscores.txt")
str(dat_raw2)
sink()

write.csv(dat_raw2, file = '../data/cleandata/cleanscores.csv',row.names=FALSE)


