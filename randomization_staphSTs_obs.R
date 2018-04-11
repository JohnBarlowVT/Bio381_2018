# Homework 11 - Function plotting and randomization tests
# April 4, 2018

# using staph aureus bulk tank data 
# regression of relationship between the number of isolates typed per farm and the observed number of strain types per farm

# preliminaries
library(ggplot2)
library(TeachingDemos)
char2seed("Cruel April")

#check working directory and set if necessary
getwd()
# setwd("C:/Users/jbarlow/Documents/Computational Biology/Bio381_2018")
#import data - source data is a csv file - need to confirm did Nick prefer text files?
SaSTs <- read.csv("sa_sts.csv",header = TRUE)
head(SaSTs)
# variables of interest are: 
#     x = isolates_typed  - column 12
#     y = STs_obs  - column 13
# check column location of variables of interest - but does R count the counter variable - think not- how to check - print data from a column
SaSTs[,12:13]
# to make the functions universal extract the data of interest form the imported file to a new data set with the 2 columns of interest and rename them "x"  and "y"

##########################################################
# FUNCTION: FunctionName
# Input: x
# Ouput: y
#--------------------------------------------------------

function <- function() { return("testing........ FunctionName")}