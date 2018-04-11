# using probablity distributions in R

library(ggplot2)
testData <- runif(1000)
qplot(x=testData)
library(MASS)

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

# Dsicrete distributions
# for a binomial distribution
# integer from 0 to a numbe rof trials
# parameters , size= unmber of trials, p=probability of success for each individual trial
# we will observe the distribution of the number of successes for the number of trials we do

x<-rbinom(n=1000,size=40,p=0.75)
iHisto(xData=x, fColor="yellow")

#Poisson
# constant rate proces with a low rate
z<-rpois(n=1000,lambda=1)
iHisto(z)
mean(z==0)

# for many data sets a Poisson does not capture the heterogeneity - negative binomial
# range 0 to infinity 
# distribution is the number of failures until we get to a certain amount of successes
# n= numbr of replicates
# size is number of trials
# prob = proability of success with 1 trial

z<- rnbinom(n=100, size=2, pr=0.5)
# size - index of overdispersion
#small size = high dispersion
z<- rnbinom(n=1000, mu=1.1, size=0.7)
iHisto(z)
mean(z==0)
# special case number of trials =1
z<- rnbinom(n=1000, size=1, pr=0.05)
iHisto(z)
mean(z==0)
z<- rnbinom(n=1000, size=1, pr=0.95)
iHisto(z)
mean(z==0)

# multiniomial distirbution
# "balls in urns"
z<- rmultinom(n=1, size=20, prob=c(0.2, 0.7, 0.1))
z
z<- rmultinom(n=5, size=20, prob=c(0.2, 0.7, 0.1))
z
z<- rmultinom(n=1000, size=20, prob=c(0.2, 0.7, 0.1))
rowSums(z)
rowMeans(z)
# creating multinomial using sample function
z<- sample(x=LETTERS[1:3], size=20, prob=c(0.2, 0.7, 0.1), replace=TRUE)
z
table(z)

# continuous distibutions
# uniform

z<- runif(n=1000, min=3, max=10.2)
Histo(z)

# this is the extreme null case - equal probable distribution - rare in biological data

# normal distribution

z<- rnorm( n=1000, mean=2.2, sd=6)
Histo(z)

# use of this to model is limikted as for many variables can not have values less than 0

# gamma distribution
# distribution of waiting times for a failure to occur
# failure
# shape ans scale parameters
# mean = shape x scale
# variance = shape x scale^2

z<- rgamma(n=1000, shape=1, scale=10)
Histo(z)
z<- rgamma(n=1000, shape=10, scale=10)
Histo(z)
z<- rgamma(n=1000, shape=0.1, scale=0.10)
Histo(z)

# beta disribution
# bounded between 0 and 1
# chnage boundary by adding or muliplplying final vecto
# conjugate prior for a binomial distribution - our previous expectations for the parameters

#binomial begins with with p and generate successes of failure from the smapling process
# p is estimates by taking the success / (success + fialure)
# works for large numbe rof smaples, wrong for small number of samples - problme at small sample size
# take into account sample size

#shape1 = number of successes +1 
#shape2 = number of failures +1 
# with no tosses our p is uniform from 0 to 1
z<- rbeta(n=1000, shape1=1, shape2=1)
Histo (z)
# do one toss and have a success
z<- rbeta(n=1000, shape1=2, shape2=1)
Histo (z)
z<- rbeta(n=1000, shape1=2, shape2=2)
Histo (z)
z<- rbeta(n=1000, shape1=11, shape2=11)
Histo (z)
z<- rbeta(n=1000, shape1=100, shape2=10)
Histo (z)
z<- rbeta(n=1000, shape1=0.1, shape2=10)
Histo (z)
z<- rbeta(n=1000, shape1=0.1, shape2=0.3)
Histo (z)

# confront these distibutions with actual data
# need to load MASS library

x <- rnorm(n=1000, mean = 92.5 , sd=2.5)
Histo(x)
zFit <- fitdistr(x, "normal")
str(zFit)
zFit$estimate

# now fit to gamma
zFit <- fitdistr(x, "gamma")

str(zFit)
zFit$estimate
zNew <- rgamma(n=1000, shape=1400, rate =15.2)
Histo (zNew)
summary(x)
z<- runif(n=1000, min=85, max=100)
Histo(z)
