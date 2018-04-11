# All about functions
# 1 March 2018
# NJG

# in R evertthing is a function

sum(3,2) # "prefix" function
3+2 # also a function
'+'(3,2) # "infix" function

y<- 3
'<-'(yy,3)
print(yy)
print(read.table)
sum # type the name you get contents of the function
sum(3,2) # functioncall with inputs
sum()

# first function

####################################################

# FUNCTION: HardyWeinberg
# calculates Hardy Weinberg allel frequencies
# input: allele frequency p (0.1)
# output: p and frequencies of AA, AB, BB genotypes

HardyWeinberg <- function(p=runif(1)){
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits=3)
  return(vecOut)
}
########################################################

HardyWeinberg()
HardyWeinberg(p=0.5)

#compare - you can do this with p as a global variable
p<- 0.6
HardyWeinberg(p=p)

# add different return statements
####################################################

# FUNCTION: HardyWeinberg2
# calculates Hardy Weinberg allel frequencies
# input: allele frequency p (0.1)
# output: p and frequencies of AA, AB, BB genotypes

HardyWeinberg2 <- function(p=runif(1)){
  if(p>1.0 | p<0.0) {
    return("Function fails, p out of bounds")
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits=3)
  return(vecOut)
}
########################################################

HardyWeinberg2(p=p)
p<- 1.2
HardyWeinberg2(p=p)

# but what if you do this
temp<-HardyWeinberg2(1.1) #no fail warning, but look at temp value
temp

# alternative stop function
####################################################

# FUNCTION: HardyWeinberg2
# calculates Hardy Weinberg allel frequencies
# input: allele frequency p (0.1)
# output: p and frequencies of AA, AB, BB genotypes

HardyWeinberg3 <- function(p=runif(1)){
  if(p>1.0 | p<0.0) {
    stop("Function fails, p out of bounds")
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits=3)
  return(vecOut)
}
########################################################
temp<-HardyWeinberg3(1.2) #fail warning, but look at temp value - somthing not working - temp should be empty
temp


myFunc <-function(a=3,b=4){
  z<- a+b
  return(z)
}
myFunc()

#bad coding formal
myFuncBad <-function(a=3){
  z<- a+bbb
  return(z)
}
myFuncBad()
bbb<- 100 # mistake to assign bbb as global variable - assign function variables within function
myFuncBad() # will run

###################################################
# FUNCTION: fitlinear
# fits linear regression 
# input: numeric vectors of x and y
# output slope and p value

fitLinear <- function(x=runif(20), y=runif(20)){
  myMod <- lm(x,y) #fits model
  myOut <- c(slope=summary (myMod)$coefficients[2,1], 
             pVal=summary(myMod)$coefficients[3,4])
  plotVar <- qplot(x=x, y=y, geom=c("smooth", "point"))
  print (plotVar)
  return(myOut)
}
fitLinear()

# dealing with too many parameters by bundling them up

z<- c(runif(99),NA)
mean(z) # need to account for NA
mean (x=z, na.rm=TRUE)
mean (x=z, na.rm=TRUE, trim=0.05)
#bundle parameters in a list
l<- list(x=z, na.rm=TRUE, trim=0.05)
do.call(mean,l)
