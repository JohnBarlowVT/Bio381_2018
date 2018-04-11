# using rep to repeat elements and create vectors
rep(0.5,6)
rep("string", 3)
rep(x=0.5,times=6)
myVec <- c(1,2,3)
rep(myVec, times=2)
rep(x=myVec,each=2)
rep(x=myVec,times=myVec)
rep(x=1:3, times=3:1)

#seq for creating sequences (non-repeating)
seq(from=2,to=4)
seq(from=2, to=4, by=0.5)
seq(from=2, to=4, length=7)
x<-seq(from=2, to=4, length=7)
1:length(x)
seq_along(x) # faster, better
seq_len(10)
x<- vector(mode="numeric", length=0)
str(x)
1:length(x) # creates weird loop
seq_along(x) #correct

# using random numbers
runif(1)
# starting with same set of random numbers
set.seed (100)
runif(1)
runif(n=5,min=100, max=200) #default = number between 0 and 1, these are not going to be integer values
#probing the data
library(ggplot2)
#make a large set of numbers
z<-runif(1000) #z is a lot of numbers
qplot(x=z)
z<-runif(n=1000, min=3, max=300)
qplot(x=z)
z<-rnorm(1000) #default is mean 0 std dve=1
qplot(x=z)
z<-rnorm(n=1000, mean=30, sd=20) #default is mean 0 std dve=1
qplot(x=z)

#longVec
longVec<-seq_len(10)
longVec
sample(x=longVec)
sample(x=longVec, size=3) #sample a smaller number of elements, defauls is without replacement
sample(x=longVec, size=3, replace=TRUE)
#sample with weights
myWeights <-c(rep(20,5),rep(100,5))# must have the same number of elements and must be positive elements
myWeights              
sample(x=longVec, replace=TRUE, prob=myWeights)
sample(x=longVec, replace=FALSE, prob=myWeights)

#subsetting of atomic vectors
z<- c(3.1,9.2,1.3,0.4,7.5)
#subset this vector
#based on positive index values
z[2]
z[c(2,3)]
#based on negative index values to remove elements
z[-c(2,3)]
#based on a boolean vector to selct elements that meet a condition
z<3
z[z<3]
which(z<3) #which is a function
myCriteria <- z<3
z[myCriteria]
z[which(z<3)]
zx <- c(NA,z) #missning values dropped
zx[zx<3]
zx[which(zx<30)]
#this previous is about screenign out values like NAs
z[] #gives entire vector
z[-(length(z):(length(z)-2))] #give what is left after removinf elements 5,4, and 3

#subset on names of vector elements

#asign names to z elements
z
names(z) <- letters[seq_along(z)]
z
z[c("b","d","e")]
# quick tour of operators
10+3
10-3
10*3
10/3
10^3
log(10) # this is base e
log10(10)
# modulus operator (remainder)
10%%3
10%/%3
# generate a set of all numbers from 1 to 100 that are divisible by 9

q <- seq_len(100)
q[q%%9==0]
runif(n=13,min=1, max=100)
rn<-sample(1:100, 16)
rn
install.packages("devtools")
library(devtools)
install_github("thomasp85/patchwork")
install.packages("withr")
install.packages("R6")
# Suppose x = 1.1, a = 2.2, and b = 3.3. Assign each expression to the value of the variable zand print the value stored in z. 

x=1.1
x
a=2.2
a
b=3.3
b
za=x^a^b
za
zb=(x^a)^b
zb
zc=(3*x^3)+(2*x^2)+1
zc
ceiling(zc)
floor(zc)
trunc(zc, digits=2)

round(zc, digits = 0)
signif(zc, digits = 2)
zd=trunc((zc-floor(zc))*10)
zd

#create these (1,2,3,4,5,6,7,8,7,6,5,4,3,2,1)
#(1,2,2,3,3,3,4,4,4,4,5,5,5,5,5)
#(5,4,4,3,3,3,2,2,2,2,1,1,1,1,1)

vecA<- c(1:8)
vecA
vecB<-seq(from=7, to=1)
vecB
vecC<-c(vecA,vecB)
vecC
install.packages("digest")
vecD<-c(1:5)
vecD
rep(x=vecD, times=vecD)
vecE<-seq(from=5, to=1)
vecE
rep(x=vecE, times=vecD)
rep(x=vecE, times=vecE)

vecF=runif(2, min=0, max=100)
vecF
x= vecF[1]
x
y=vecF[2]
r=sqrt((x^2)+(y^2))
r
t=atan2(y,x)
t
cor_x=r*cos(t)
cor_y=r*sin(t)

# 4. Suppose that queue <- c("sheep", "fox", "owl", "ant") and that queue represents the animals that are lined up to enter Noah’s Ark, with the sheep at the front of the line. Using R expressions, update the queue successively as

queue <- c("sheep", "fox", "owl", "ant")

# a. the serpent arrives;
queue <- c(queue, "serpent")
queue
# b. the sheep enters the ark;
queue <- queue [2:5]
queue
# c. the donkey arrives and talks his way to the front of the line;
queue <- c("donkey", queue)
queue
#d. the serpent gets impatient and leaves;
queue <- queue [2:5]

#e. the owl gets bored and leaves;
remove<- c("owl")
queue %in% remove
queue [! queue %in% remove]

#f. the aphid arrives and the ant invites him to cut in line.

# g. Finally, determine the position of the aphid in the line.

rn<-sample(1:10, 10)
rn

library (patchwork)
library (ggplot2)
library (devtools)
### line break most recent try
install_github("thomasp85/patchwork")
