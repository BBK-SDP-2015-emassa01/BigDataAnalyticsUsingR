#Q1
#a
brotherSisters = c(2,3,0,5,2,1,1,0,3,3)
#i
broSisMean = mean(brotherSisters)
#ii
broSisMedian = median(brotherSisters)
#iii
broSisMode = as.numeric(names(sort(-table(brotherSisters)))[1])
#iv
broSisVariance = var(brotherSisters)
#v
broSisStd = sd(brotherSisters)

#b
ages = c(23,25,18,45,30,21,22,19,29,35)
#i
agesBroSisCOV = cov(brotherSisters, ages)
agesBroSisCOR = cor(brotherSisters, ages)
#ii
#There is a strong positive correlation between ages, and number of brothers and sisters, r = 0.912.
#iii
#Although correlation does not imply causation, we can see that as a child is older, the number of 
# brothers and sisters they have is likely to increase. We cannot imply a causation but there is a strong
# theoretical and practical grounds to suggest that age predicts number of brothers and sisters an individual has.

#2
library(MASS)
Boston
?Boston
# a
numberCols = NCOL(Boston)
numberRows = NROW(Boston)

# b scatterplots
attach(Boston)
ageRm = plot(age,rm) #nothing significant
abline(ageRm)
plot(tax,crim) #weird trend
plot(age,rm)#weird trend
plot(crim,indus) #weird trend
plot(crim,nox)

#plot all variables:
plot(Boston, pch='.')

# c created a model *****************************
lm.fit = lm(age~rm)
summary(lm.fit)
plot(age~rm)
plot(lm.fit)

# d crime rate and suburbs
plot(crim,tax) #seem like crim is really low unless tax bracket is 660!
plot(crim,ptratio) # v high crime rate for ptratio 21.

crim_cor <- function(predictor) {
    return(cor(predictor, Boston$crim))
}

#spply makes a vector of Boston, and apply a function to each element of vector
print(sort(sapply(Boston, crim_cor)))

sapply(Boston)

# e count of people on river
hist(chas)$counts

# f What is the median pupil‐teacher ratio among the towns in this data set?
newptratio <- as.vector(ptratio) 
median(newptratio)

# g Which suburb of Boston has lowest median value of owner occupied homes? Assuming row number = suburb number
newmedv<-as.vector(medv)
min(newmedv)
which( medv == min(medv) ) #gives multiple occurences
which(Boston == (min(newmedv)), arr.ind=TRUE) #gives coordinates for only 1st occurence
which(Boston[,14] == min(newmedv)) # gives row numbers, first occurence

#g ii
df = data.frame(Boston) #gives the rest of the columns for the dataset where min medv value
df[which(medv == min(newmedv)),] #both have 20.2 as ptratio, age = 100, indus - 18.1, zn 0, not on river, 1.4 distance, tax 666

#h
which( rm > 7 ) 
df[which(rm >  7 ), ] #gives rest of data
length(which(rm > 7)) #number of people with 7 or more rooms per dwelling.
which( rm > 8 ) 
length(which(rm > 8)) 
df[which(rm >  8 ), ] 


#Q3 Linear Regression
#a
x = rnorm(100, mean = 0, sd = 1)

#b
eps = rnorm(100, mean = 0, sd = 0.25)

#c 
y1 = -1 +(0.5*x) #100 observations
y = -1 + (0.5*x) + eps #with error, assuming eps is error

#length = 100
# B0 = -1
# B1 = 0.05

length(y)

#d Strong positive correlation
plot(x,y, col="red")
lines(lowess(x,y), col="blue")

#e
myData = data.frame(first = x, second = eps)
lm.fit = lm(y~x)
abline(lm.fit, col="red")
summary(lm.fit)

#B0 is close to -1 = -1.03368, and x is close to 0.5, = 0.54802 but the numbers are not exact
#maybe because of the error?

#?legend()


