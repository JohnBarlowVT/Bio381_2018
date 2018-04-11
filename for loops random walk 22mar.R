# Illustrate break function with a program for a random walk
##########################################################
# FUNCTION: RanWalk
#stochastic random walk
# input: 
# times = number of time steps
# nl + initial population size (=n[1])
# lambda = finite rate of increase
# noiseSD = st dev of a nomral distroibution with a mean of 0
#Ouput: vector n with population sizes > 0
#--------------------------------------------------------

library (ggplot2)
library (tcltk)

RanWalk <- function(times=100, 
                    n1=50, 
                    lambda=1.0, 
                    noiseSD=10) { 
  n <- rep(NA, times)
  n[1] <- n1
  noise <- rnorm(n=times, mean=0, sd=noiseSD)
  for (i in 1:(times-1)) {
    n[i+1] <- n[i]*lambda + noise[i]
    # alternative that is not a random walk, just white noise added to initial value n[i+1] <- n[1] + noise[i]
    if (n[i+1] <=0) {
      n[i+1] <- NA
      cat("Population extinction at time ", i, "\n")
      tkbell()
      break }
  }
  n<-n[complete.cases(n)]
  return(n)
}
z<- RanWalk()
qplot(x=seq_along(z), y=z, geom=c("line", "point"))
summary(z)
length(z)
z
