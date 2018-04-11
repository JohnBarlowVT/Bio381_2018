getwd()
setwd("C:/Users/jbarlow/Documents/Computational Biology/Bio381_2018")

library(ggplot2)
library(ggthemes)
library(MASS)

z <- read.table("sa_sts.txt",header = TRUE, stringsAsFactors=FALSE)

class(z$BTM_SCC)
class(z$myVar)

z$myVar <- as.numeric(z$BTM_SCC)
z$logmyVar <- log10(z$BTM_SCC)


head(z)

summary(z$myVar)
summary(z$logmyVar)

p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) 
print(p1)

# on log transformed data
p2 <- ggplot(data=z, aes(x=logmyVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) 
print(p2)

p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)

normPars <- fitdistr(z$myVar,"normal")
print(normPars)

str(normPars)
normPars$estimate["mean"] # note structure of getting a named attribute

#overlay normal
meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]

xval <- seq(min(z$myVar),max(z$myVar),len=length(z$myVar))
print(xval)

stat <- stat_function(aes(x = xval, y = ..y..), fun = dnorm, colour="red", n = length(z$myVar), args = list(mean = meanML, sd = sdML))
p1 + stat

# overlay exponential
expoPars <- fitdistr(z$myVar,"exponential")
rateML <- expoPars$estimate["rate"]

stat2 <- stat_function(aes(x = xval, y = ..y..), fun = dexp, colour="blue", n = length(z$myVar), args = list(rate=rateML))
p1 + stat + stat2

# overlay uniform
stat3 <- stat_function(aes(x = xval, y = ..y..), fun = dunif, colour="darkgreen", n = length(z$myVar), args = list(min=min(z$myVar), max=max(z$myVar)))
p1 + stat + stat2 + stat3

# overlay gamma

z2 <- z[z$myVar>0,]
gammaPars <- fitdistr(z$myVar/10, "gamma", start=list(shape = 1, rate = 0.1), lower = 0.01)
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$myVar), args = list(shape=shapeML, rate=rateML))
p1 + stat + stat2 + stat3 + stat4

#overlay genometric - does not work well

geoPars <- fitdistr(z$myVar,"geometric")
geoprob<-geoPars$estimate["prob"]
print(geoPars)
print(geoprob)

stat5 <- stat_function(aes(x = xval, y = ..y..), fun = dgeom, colour="brown", n = length(z$myVar), args = list(prob=geoprob))
p1 + stat + stat5

# repeat on log transformed data
p2 <- ggplot(data=z, aes(x=logmyVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) 
print(p2)


simName <- as.data.frame(rgamma(n= 44, shape= 4.2, rate= 0.11))
names(simName)<- "myVar"
p2 <- ggplot2(data=simName, aes(x=myVar, y=..density..)) + geom_histogram(color="grey60", fill="cornsilk", size=0.2)
p2 +stat4
