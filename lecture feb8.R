# Relational operatpors
# all return boolena 
3<4
3>5:7
3>=3
3<=4
3==4
3=4 throws an error
3!=4
# use to genrate breakpoints in code
# compare two atomic vectors and return one atomic vector and always strip out duplicate elements before the comparison

i<- c(1, 1:7)
print(i)
j <- 3:10
print(j)
union (i,j)
# unique - strips common elements 
intersect(i,j) # common elements
setdiff(i,j) #unique elements of i  not in j  - this is an asymetric function compare
setdiff(j,i)
# set operators that reurn a single boolena value
setequal(i,j) #comparison of the 2 vecotrs
setequal (i,i)
is.element(i,j) # compare elements in i to j
is.element(j,i)
i %in% j
#logical operators
z<- 10:20
z < 15
z <=20 & z>17  # AND operator
z <=20 | z>17  # OR operator

# now to lists dataframes and matrices
# more basic coding tools

library(ggplot2)

m<-matrix(data=1:12, nrow=4, byrow=TRUE)
m
dim(m)
dim(m) <- c(6,2)
m
dim(m) <- c(4,3)
m
ncol(m)
nrow(m)

# add names to rows and columns

rownames(m) <- c("a", "b", "c", "d")
m
colnames(m) <- LETTERS[1:ncol(m)]
m
# subsetting matrix values
print (m[2,3])
print (m["a", "C"])
print (m[2,]) # will print all elements in row 2
print (m[,2])
print (m[,])
print (m[c(1,4),c(1,3)])

rownames (m)<-paste("Species",LETTERS(1,nrow(m)), sep"")
dimnanes(m) <- list(paste("site", 1:nrow(m), sep=""), paste("Species", ncol(m):1, sep""))             

t(m)  # finction to transpose matrix

# add a rwo to m with rbind

m2 <- t(m)
m2
m2 <- rbind(m2, c(10,20,30,40))
rownames (m2)[4] <- "Species X"
m2
m2["Species X", c("Site3", "Site4")]
# can always convert this back to an atomic vector
myVec <- as.vector(m)
myVec
# Lists ar vectors but each element can hold thing of different sizes and different types

myList <- list(1:10,matrix(1:8,nrow=4,byrow=TRUE), letters[1:3],pi)
str(myList)               

# lists don't behave as you think they should
myList
myList[4]-3 #not what we want
myList[4] #not what we want
myList[[4]]
myList[[2]]
myList[[2]] [4,1]

# name items as we create the list
myList2 <- list(Tester=FALSE,littleM=matrix(1:9,nrow=3))
myList2
myList2$littleM[2,3] #get row 2 column 3 from matrix in list element
myList2[["Tester"]]
m[1]
m[4]
m[6]
