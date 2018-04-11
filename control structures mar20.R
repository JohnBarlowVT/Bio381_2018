# Illustrate control structures for programing  flow
# 20march 2018

# basic if statements

z<- signif(runif(1), digits=2)
print (z)
z>0.5

if (z<0.5) cat(z, "z is a lower than average number","\n")

if (z>0.8) cat(z, "z is a bigger than average number","\n") else
  if (z<0.2) cat(z, "z is a smaller than average number","\n") else
  {cat(z, "is a number of typical size","\n")
    cat("z^2 =", z^2,"\n")}
## consider putting block statements into functions before using with an if structure 
# "condition" in if statement returns only a single true of false value - for example if statements only evlauate the first element in a vector - don't want to pass a vector to an if statement

#function to operate on a vector

#insect clutch size poison with lamba =10.2, parasitism probability = 0.35 with 0 eggs  laid

library (ggplot2)
tester<- runif(1000) #random uniform
eggs <- ifelse(tester >0.35, rpois(n=1000, lambda=10.2),0)
hist(eggs)

#use to create vector of states for plotting

pVals <-runif(1000)
z<- ifelse(pVals<=0.025, "lowerTails", "nonSig")
z[pVals>=0.975] <-"upperTail"
head (z)
table(z)

#alternative method
z1<- rep("nonSig", length(pVals))
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
table (z1)

## working with for loops

myDat <- signif(runif(10), digits=2)

# for (i in 1:length(myDat)) ### not great form

for (i in seq_along(myDat)) {
  cat("loop number =", i, "vector element =" , myDat[i],"\n")
}
print(i) 
# so be careful as i is defined and will hang on to the final value

#use a constant to define the lenght of a loop 

zz<-5
myDat <- signif(runif(zz), digits=2)
for (i in seq_len(zz)){
  cat("loop number =", i, "vector element =" , myDat[i],"\n")
}

zz<-50
zz2<- 4:6
myDat <- signif(runif(zz), digits=2)
for (i in seq_len(zz2)){
  cat("loop number =", i, "vector element =" , myDat[i],"\n")
}
### compare
zz<-50
zz2<- 4:6
myDat <- signif(runif(zz), digits=2)
for (i in zz2){
  cat("loop number =", i, "vector element =" , myDat[i],"\n")
}

# things to not do in a for loop
# don't do anything in the loop unless you have to

myDat <- vector(mode="numeric", length=10)

for (i in seq_along(myDat)) {
  myDat[i] <- signif(runif(1), digits=2)
  # don't do this in a loop - this will run but interively running random number in loop will bog down
    cat("loop number =", i, "vector element =" , myDat[i],"\n")
}

myDat <- runif(1)
for (i in 2:10) {
  temp <- signif(runif(1), digits=2)
  myDat <- c(myDat, temp)
    cat("loop number =", i, "vector element =" , myDat[i],"\n")
}
# do not do above; 
#do not write a loop if you can vectorize

myDat <- 1:10
for (i in seq_along(myDat)) {
  myDat[i] <- myDta[i] + myDat[i]^2
  cat("loop number =", i, "vector element =" , myDat[i],"\n")
}
#nothjing wrong with this code
# but this is much easier
z<- 1:10
z<- z + z^2

z<- c(10,2,4)
for (i in seq_along(z)) {
  cat("i=",i, "z[i]=", z[i], "\n")
}

# counter variable retains its final value - at this point i =3
i

# use next to skip elements in a loop
# operate only on odd numbered elements
z<- 1:20
for (i in seq_along(z)) {
  if (i %% 2==0) next
    print(i)
}
# alterntive - remove if statement
zsub<- z[z%% 2!=0]
for (i in seq_along(zsub)) {
  cat("i=",i, "zsub[i]=", zsub[i], "\n")
}

# ouput data
z<- 1:20
# zstore <- vector (mode="numeric", length= length(z))
zstore <- rep(NA, length(z))
for (i in seq_along(z)) {
  if (i %% 2==0) next
  print(i)
  zstore[i] <- i
}
zstore <- zstore[complete.cases(zstore)]
zstore
