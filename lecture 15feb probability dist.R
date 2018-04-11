# using probablity distributions in R

library(ggplot2)
testData <- runif(1000)
qplot(x=testData)

# problme with this the extrmes are smaller tahn would be expected

# create a function in R
#----------------------------------------
# Function Histo
# input xData = numeric vector
#input fColor = fill color
# output = corrected ggplot histogram
# output = summary stats
# output = 95% interval

Histo<- function(xData=runif(1000), fColor="tan") { z<- qplot(x=xData, color=I("black"), fill=I(fColor), alab="X", boundary=0)

print(z)
print(summary(xData))
print(quantile(xData,probs=c(0.025,0.975)))
}
# test function now
Histo()

#create a new variable
temp<-rnorm(1000)
Histo(xData = temp, fColor="goldenrod")

# function iHisto
# work better for integer values
# input xData (ok to recycle label - stays in thie function)
# input xData is a vector of integers
# fcolor = named color (see color chart, hex number, number code name (not a character string, or charcater string name, or RBG code)
# output = corrected ggplot histogram
# output = summary stats
# output = 95% interval

iHisto<- function(xData=runif(1000), fColor="tan") { z<- qplot(x=factor(xData), color=I("black"), fill=I(fColor))

print(z)
print(summary(xData))
print(quantile(xData,probs=c(0.025,0.975)))
}
# test function now
iHisto()

#create a new variable

temp2<-rpois(n=1000,lambda=0.5)
iHisto(xData=temp2, fColor="orchid")
mean(temp2==0)

# for a binomial distribution
# integer from 0 to a numbe rof trials
# parameters , size= unmber of trials, p=probability of success for each individual trial
# we will observe the distribution of the number of successes for the number of trials we do

x<-rbinom(n=1000,size=40,p=0.75)
iHisto(xData=x, fColor="yellow")
