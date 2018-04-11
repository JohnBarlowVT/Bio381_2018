##########################################################
# FUNCTION: Plotting functions, sweeping parameters, Mathematical functions # 29 March 2018
#NJG
# input: x
#Ouput: y
#--------------------------------------------------------

# use differing numbers of rows and columns allows you to keep row and columns straight

z<- matrix(ruinif(9), nrow=3)
z[3,3]
z<- matrix(ruinif(20), nrow=5)
z[5,4]
z[4,5] # throws an error - out of bounds - 

# using double for l;oops

m<- matrix(round(runif(20), digits=2), nrow=5)
print (m)

# loop over rows

for (i in 1:nrow(m)) {
  m[i, ] <- m[i,] + i # this is a vector operation applied to each column within row - adds the row element to each value in the row
}
print (m)

for (j in 1:ncol(m)) {
  m[,j] <- m[,j]+j
}
print (m)

# loop over orws and columns

# refresh matrix

m<- matrix(round(runif(20), digits=2), nrow=5)

for (i in 1:nrow(m)) {
  for(j in 1:ncol(m)) {
    m[i,j] <- m[i,j] + i + j
  } # end of column loop
} # end of row loop

print (m)

# sweeping over parameters in an equation
# ecological 
# S = cA^z
##########################################################
# FUNCTION: Species area curve
#creates power function for the relationship of S and A
# input: A = vector of island areas
#...............c = intercept constant
#............... z = slope constant
#Ouput: S = vector of species richness values
#--------------------------------------------------------

SpeciesAreaCurve <- function(A=1:5000,
                             c=0.5,
                             z=0.26) { 
  S <-c*(A^z)
  return (S)
}
# head(SpeciesAreaCurve())

##########################################################
# FUNCTION: SpeciesAreaPlot
# plot curve in base graphics
# input: A = vector of areas
#........ c = intercept parameter
#........ z = slope
# Ouput: base graph with parameter values
#--------------------------------------------------------

SpeciesAreaPlot <- function(A=1:5000,
                            c=0.5,
                            z=0.26) { 
  plot(x=A, y=SpeciesAreaCurve(A,c,z),
       type="l",
       xlab="Island Area",
       ylab="S",
       ylim=c(0,2500))
  mtext(paste("c = ", c, "z = ", z), cex=0.7)
  return()
}
SpeciesAreaPlot()
# get a NULL return on this iindicates function did its thing

#now build a grid of plots with different parameter values
# start with a small set of golobal variables
cPars <- c(100,150,175)
zPars <- c(0.10, 0.16, 0.26, 0.30)
par(mfrow=c(3,4)) #refers to graphic parameters in base R - when used needs to be reset
# enter into a double loop for plotting
for(i in 1:length(cPars)) {
  for (j in 1:length(zPars)){
    SpeciesAreaPlot(c=cPars[i], z=zPars[j])
  }
}
par(mfrow=c(1,1))
# plotting redux with ggplot

library (ggplot2)
cPars <- c(100,150,175)
zPars <- c(0.10, 0.16, 0.26, 0.30)
Area <- 1:5
# set up model frame
modelFrame <- expand.grid(c=cPars,
                          z=zPars,
                          A=Area)
# in console run str(modelFrame)
head(modelFrame)
modelFrame 
modelFrame$S <- NA
modelFrame 
# tricky double for loop for filling new data frame
for (i in 1:length(cPars)) {
  for(j in 1:length(zPars)) {
    modelFrame[modelFrame$c==cPars[i] & modelFrame$z==zPars[j], "S"] <- SpeciesAreaCurve(A=Area, c=cPars[i], z=zPars[j])
  }
}
modelFrame

dev.off()
p1 <- ggplot(data=modelFrame)
p1 + geom_line(mapping=aes(x=A, y=S)) + facet_grid(c~z)
p2 <- p1
p2 + geom_line(mapping=aes(x=A, y=S, group=z)) + facet_grid(.~c)
