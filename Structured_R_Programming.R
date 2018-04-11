# Example of strcutured programming
# March 8, 2018
# NJG

# All functions must be declared first before they are used

#############################################################

# Set up

library(ggplot2)


#############################################################

# FUNCTION: GetData
# input: x
#Ouput: y
#--------------------------------------------------------

GetData <- function(fileName=NULL) { 
  if(is.null(fileName))
  {
    dataFrame <- data.frame(ID=101:110,
                            varA=runif(10),
                            varB=runif(10))
  } else {
      dataFrame <- read.table (file=fileName,
                               header=TRUE,
                               sep=",",
                               stringsAsFactors=FALSE)
  } 
  return(dataFrame)}
GetData()

#############################################################

# FUNCTION:  CalculateStuff
# fits an OLS 
# input: x
#Ouput: y
#--------------------------------------------------------

CalculateStuff <- function(xVar=runif(10),yVar=runif(10)){ 
  dataFrame <- data.frame (xVar, yVar) 
  regModel <- lm (yVar~xVar, data=dataFrame)
  return(summary(regModel))}
CalculateStuff()

#############################################################

# FUNCTION: SummarizeOutput
# input: x
#Ouput: y
#--------------------------------------------------------

SummarizeOutput <- function(z=NULL) { 
  if(is.null(z)) {
    z<- summary (lm(runif(10)~runif(10)))
  }
  return(z$resisduals)
  }
SummarizeOutput()
############################################################

# FUNCTION: GraphResults
# input: x
#Ouput: y
#--------------------------------------------------------

GraphResults <- function(xVar=runif(10),yVar=runif(10)){ 
  dataFrame <- data.frame (xVar, yVar)
  p1<- qplot(data=data.frame, x=Xvar, y=yVar, geom=c("smooth", "point"))
  print(p1)
  message ("message: regression graph created")
}
GraphResults()

#########################################################

# Programming code

GetData()
CalculateStuff()
GraphResults()
SummarizeOutput()
