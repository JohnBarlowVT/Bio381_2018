# Randomization test for regression data


# preliminaries
library(ggplot2)
library(TeachingDemos)
char2seed("Cruel April")

##########################################################
# FUNCTION: readData
# read in or generate data frame
# Input: file name (or nothing if data created in demo)
# Ouput: 3-column data frame of observed data (ID, x, y)
#--------------------------------------------------------

readData <- function(z=NULL) { 
  if(is.null(z)) {
    xVar <- 1:20
    yVar <- xVar + 10*rnorm(20) # create a random data set with correlation betweeen x and y
    dF <- data.frame (ID=seq_along(xVar), xVar, yVar)
  }
    return(dF)
  }
  
readData()


##########################################################
# FUNCTION: getMetric
# calculate metric for randomization test
# Input: 3-column data frame for regression
# Ouput: regression slope
#--------------------------------------------------------

getMetric <- function(z=NULL) { 
  if(is.null(z)) {
    xVar <- 1:20
    yVar <- xVar + 10*rnorm(20) # create a random data set with correlation betweeen x and y
    z <- data.frame (ID=seq_along(xVar), xVar, yVar)
  }
  . <- lm(z[,3]~z[,2])
  . <- summary(.)
  . <- .$coefficients[2,1] # this is where the slope of the regressionline is located
  slope <- .
  return (slope)
}
getMetric()
  
##########################################################
# FUNCTION: shuffleData
# randomize data for regression analysis
# Input: 3-column data frame for regression (ID, xVar, yVar)
# Ouput: 3-column data frame for regression (ID, xVar, yVar)
#--------------------------------------------------------
shuffleData <- function(z=NULL) { 
  if(is.null(z)) {
    xVar <- 1:20
    yVar <- xVar + 10*rnorm(20) # create a random data set with correlation betweeen x and y
    z <- data.frame (ID=seq_along(xVar), xVar, yVar)
  }
  z[,3] <- sample(z[,3])
  return (z)
}
shuffleData()

##########################################################
# FUNCTION: getPVal
# calcualte p value for observed, simulated data
# Input: list of observed metric and vector of simulated metric
# Ouput: lower and upper tails of distibution above and below observed, lower upper tail probability vector
#--------------------------------------------------------

getPVal <- function (z=NULL) {
  if(is.null(z)) {
    z <- list (xObs=runif(1), xSim = runif(1000)) }
  
  pLower <- mean(z[[2]]<= z[[1]])
  pUpper <- mean(z[[2]]>= z[[1]])
  
  return(c(pL=pLower, pU= pUpper))
}
getPVal()
##########################################################
# FUNCTION: plotRanTest
# ggplot graph
# Input: list of observed metric and vector of simulated metric
# Ouput: ggplot graph
#--------------------------------------------------------

plotRanTest <- function (z=NULL) {
  if(is.null(z)) {
    z <- list (xObs=runif(1), xSim = runif(1000)) }
  dF <- data.frame (ID=seq_along(z[[2]]), simX=(z[[2]]))
  p1 <- ggplot(data=dF, mapping = aes(x=simX))
  p1+ geom_histogram(mapping=aes(fill=I("goldenrod"), color=I("black"))) + geom_vline(aes(xintercept=z[[1]],col="blue"))
}

plotRanTest()
#----------------------------------------
# Main body of code

nSim <-1000 #number of simulations
xSim <- rep(NA, nSim) # will hold simulated slopes

dF <- readData()
dF
Xobs <- getMetric(dF)
Xobs
 for (i in seq_len(nSim)) {
   xSim[i] <- getMetric(shuffleData(dF)) }

slopes <- list(Xobs,xSim)
getPVal(slopes)

##########################################################
# FUNCTION: plotRanTest
# ggplot graph
# Input: list of observed metric and vector of simulated metric
# Ouput: ggplot graph
#--------------------------------------------------------

#plotRanTest <- function (z=NULL) {
 # if(is.null(z)) {
  #z <- list (xObs=runif(1), xSim = runif(1000)) }
  #dF <- data.frame (ID=seq_along(z[[2]]), simX=(z[[2]]))
   #                 p1 <- ggplot(data=dF, mapping = aes(x=simX))
   #                 p1+ geom_histogram(mapping=aes(fill=I("goldenrod"), color=I("black"))) + geom_vline(aes(xintercept=z[[1]],col="blue"))
#}
plotRanTest()
