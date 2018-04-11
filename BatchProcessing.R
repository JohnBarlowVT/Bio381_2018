##########################################################
# FUNCTION: Basic code for batch processing
#File Builder
#create a set of random files for regression
# input: fileN = number of files to create
# : fileFolder = name of folder for random files
# : fileSize = c(min.max) numer of rows in file
# : fileNA = number of NA values on average per column
#Ouput: y
#--------------------------------------------------------
setwd("C:/Users/jbarlow/Documents/Computational Biology/Bio381_2018")

getwd()


FileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles/",
                        fileSize=c(15,100),
                        fileNA=3){ 
   for (i in seq_len(fileN)) {
     fileLength <- sample(fileSize[1]: fileSize[2], size=1)
     varX <- runif(fileLength) #randon x values
     varY <- runif(fileLength) #random y values
     dF <- data.frame(varX, varY) #bind to data fram
     badVals <- rpois(n=1, lambd=fileNA) #number of NA
     dF[sample(nrow(dF), size=badVals),] <- NA
     
#create a consecutive file name for this data frame
     fileLabel <- paste(fileFolder,
                        "ranFile",
                        formatC(i,
                                width=3,
                                format="d",
                                flag="0"),
                        ".csv", sep="")
     # set up dta file and incorportae time stamp and minimal metadata
     write.table(cat("# Simulated random data file",
                     "for batch processing", "\n",
                     "# Time Stamp: ",as.character(Sys.time()), "\n",
                     "# JWB","\n",
                     "# -------------------------------------","\n",
                     "\n",
                     file=fileLabel,
                     row.names="",
                     col.names="",
                     sep=""))
     #add the data frame now
     write.table(x=dF,
                 file=fileLabel,
                 sep=",",
                 row.names = FALSE,
                 append=TRUE)
   } #close the for loop
} # close the function

##########################################################
# FUNCTION: regStats
#fit linear model, get regression stats

# input: 2 column data frame

#Ouput: slope, p vlaue, and r^2
#--------------------------------------------------------
regStats<-function(d=NULL) {
   if(is.null(d)){
     xVar <- runif(10)
     yVar <- runif(10)
     d <- data.frame(xVar, yVar)
   }
   . <- lm(data=d, d[,2]~d[,1])
   . <- summary(.)
   statsList <- list(Slope=.$coefficients[2,1],
                     pVal=.$coefficients[2,4],
                     r2=.$r.squared)
   return(statsList)
 }
regStats()       

library(TeachingDemos)
char2seed("Freezing March")

#--------------------------------------------
# Global variables
fileFolder <- "RandomFiles/"
nFiles <- 100
fileOut <- "StatsSummary.csv"
#--------------------------------------------

# Create 100 random data sets
FileBuilder(fileN=nFiles)

# get summary stats from the N files of random data sets

fileNames <- list.files(path=fileFolder)

# Create data frame to hold file summary statistics
ID <- seq_along(fileNames)
fileName <- fileNames
slope <- rep(NA,nFiles)
pVal <- rep(NA,nFiles)
r2 <- rep(NA,nFiles)
nRows <- rep(NA,nFiles)
nCleanRows <-rep(NA,nFiles)

statsOut <- data.frame(ID,fileName,slope,pVal,r2,nRows,nCleanRows)

#statsOut #just to see the file structure
# batch process by looping through individual files
for (i in seq_along(fileNames)) {
  data <- read.table(file=paste(fileFolder,fileNames[i],sep=""),
                     sep=",",
                     header=TRUE) # read in next data file
  nRows <- dim(data)[1]
  dClean <- data[complete.cases(data),] # get clean cases
  nCleanRows <- dim(dClean)[1]
  . <- regStats(dClean) # pull regression stats from clean file
  statsOut[i,3:7] <- c(unlist(.), nRows, nCleanRows) # unlist, copy into last 3 columns
  
  # I did the following lines first, and this works in the loop, but Lauren showed me that you can just bind the 2 new variables as written above
  #nRows <- dim(data)[1]
  #statsOut[i,6] <- unlist(nRows)
  #nCleanRows <- dim(dClean)[1]
  #statsOut[i,7] <- unlist(nCleanRows)
  
}

# data #just to see the file structure
#dClean #just to see the file structure

# set up output file and incorporate time stamp and minimal metadata
write.table(cat("# Summary stats for ",
                "batch processing of regression models","\n",
                "# timestamp: ",as.character(Sys.time()),"\n",
                "# NJG","\n",
                "# ------------------------", "\n",
                "\n",
                file=fileOut,
                row.names="",
                col.names="",
                sep=""))
# fileOut

# now add the data frame
write.table(x=statsOut,
            file=fileOut,
            row.names=FALSE,
            col.names=TRUE,
            sep=",",
            append=TRUE)
# fileOut
# found a package that has a countLine function, but the limitation is the output umber of lines includes the lines for the metadata and header row 
#install.packages("R.utils")

library(R.utils)
n<-countLines("sa_sts.csv")
n<- dim(data)[1]
n

