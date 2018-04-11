#Archetype experimental designs, data entry. analysis, and graphing in R

# data <- read.table (file-"filename.csv", row.names = 1, header=TRUE, sep=",",stringsAsFactors = FALSE)

# Omit NA values - imagine original dataset is contaminated with NA values

# dataClean <- data[complete.cases(data),]

# dataClean <- data[complete.cases(data[,5:6]),),] #all rows with no NAs in columns 5 and 6

install.packages("TeachingDemos")

library(TeachingDemos)
library(ggplot2)
char2seed('espresso', set=FALSE)
runif(1)

#ceate a data frame for the regression data

n<- 50 # number of observations in data set
varA <- runif(n)
varB <- 5.5 + 10*varA + 10*runif(n)
ID <- seq_len(n)
regData <- data.frame(ID, varA, varB)
str(regData)
head(regData)

#basic regression analysis in R

regModel <- lm(varB~varA, data=regData) # better to pull data from a data frame not the raw vectors 
print(regModel)
str(regModel)
head (regModel$residuals)

# good stuff contained in summary

summary(regModel)

# now keep this data stream going (this is a headache) - move the data out of the summary digitally
summary(regModel)$coefficients
# or can do
z<- summary (regModel)
z$coefficients
mySlope<- z$coefficients[2,1]
mySlope
zUnlisted <- unlist(z)
zUnlisted
# generates the elements individually; an unlisted structure where you find the pieces you want
zUnlisted$r.squared
# so create our own output structure; a list with the stuff you want
regSum<-list(intercept=zUnlisted$coefficients1, 
             slope=zUnlisted$coefficients2, 
             interceptP=zUnlisted$coefficients7,
             slopeP=zUnlisted$coefficients8,
             r2=zUnlisted$r.squared)
str(regSum)
regSum
regSum$slope

# ggplot of regression model

regPlot <-ggplot(data=regData, aes(x=varA, y=varB)) + geom_point() + stat_smooth(method=lm, se=0.99)
print(regPlot)

# data set up for ANOVA

nGroup <- 3 # number of treatment groups
nName <- c("Control", "Treat1", "Treat2")
nSize <- c(12,17,9)
nMean <- c(40,41,60) #mean response in each group
nSD <- c(5,5,5) #standard deviation within group
ID <- 1:(sum(nSize)) #unique ID each row is observation

resVar <- c(rnorm(n=nSize[1], mean= nMean[1], sd= nSD[1]), 
            rnorm(n=nSize[2], mean= nMean[2], sd= nSD[2]),
            rnorm(n=nSize[3], mean= nMean[3], sd= nSD[3]))
length(resVar)
sum(nSize)
TGroup <- rep(nName, nSize)
table(TGroup)

ANOdata<- data.frame(ID, TGroup, resVar)
str(ANOdata)
head(ANOdata)
ANOmodel<- aov(resVar~TGroup, data=ANOdata)
print(ANOmodel)
summary (ANOmodel)
# now can unlist and pull out the covariates 

ANOplot <- ggplot(data=ANOdata, aes(x=TGroup, y=resVar, fill=TGroup)) + geom_boxplot()

print (ANOplot)

# introducing an important command to save your graphic wor

ggsave(filename="myBoxPlot.pdf", plot=ANOplot, device="pdf")

# data frame construction  for logistic regression

xVar <- sort(rgamma(n=200, shape=5, scale=5))
#forcing cluster of outcomes on x
yVar <- sample(rep(c(1,0), each=100), prob=seq_len(200))
lRegData <- data.frame(ID=1:200,xVar,yVar)
str(lRegData)

lRegModel <-glm(yVar~xVar, data=lRegData, family=binomial(link=logit))
summary(lRegModel)
summary(lRegModel)$coefficients

lRegPlot<- ggplot(data=lRegData, aes(x=xVar, y=yVar)) + geom_point() + stat_smooth(method=glm, method.args=list(family=binomial))
print(lRegPlot)

#basic contingency table analysis in R

vec1 <- c(50,66,22)
vec2 <- c(120,22,30)
dataMatrix <- rbind(vec1, vec2)
rownames(dataMatrix) <-c("Cold", "Warm")
colnames(dataMatrix) <-c("Aphaengaster", "Camponotus", "Creamatogaster" )
dataMatrix

#contingency table analysis
print(chisq.test(dataMatrix))
mosaicplot(x=dataMatrix, col=c("goldenrod","grey", "black"), shade=FALSE)
# look into ggmosaic plot
