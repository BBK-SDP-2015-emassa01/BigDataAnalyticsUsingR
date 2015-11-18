install.packages("randomForest")
library(randomForest)
library(MASS)
set.seed(1)

#training on half the data set
train=sample(1:nrow(Boston),nrow(Boston)/2)

#last variable is y, all others are x, all predictors are used from the data set.
names(Boston)

# ~. predict this one, with (~) the rest (.)
# use all 13 variables in bagging to predict the tree.
# by default 500 trees, use can use the 'ntree' variable to change this.
bag.boston=randomForest(medv~., data=Boston,subset=train,mtry=13,importance=TRUE, ntree=1000)
             
bag.boston

#tells us how many parameters there are in this bagged model
summary(bag.boston)


#~~~~~~~~~~~~~~~~~~
#How well does this model perform on the dataset?
#predicted value
yhat.bag=predict(bag.boston,newdata=Boston[-train,])

#take rows not in train, and take column called medv. True value
boston.test=Boston[-train,"medv"]

#ideally these are perfectly correlated at 45 degrees.
plot(yhat.bag,boston.test)
#intercept=0, slope=1
abline(0,1)

#mean, squared error. error= predicted-actual, square and take mean.
mean((yhat.bag-boston.test)^2)

#what happens if we reduce the number of trees
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13, ntree=25)
yhat.bag=predict(bag.boston,newdata=Boston[-train,])
mean((yhat.bag-boston.test)^2)

# High MSE = bad.
#~~~~~~~~~~~~~~~~~~

# build a for loop to run lots of bagged models, from 1 to i

#TestMeanSumOfSquares=c(1:100);
#repeat 0 100 times.
TestMeanSumOfSquares = rep(0,100)

for (i in 1:1000){
  set.seed(1)
  bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13, ntree=i)
  yhat.bag=predict(bag.boston,newdata=Boston[-train,])
  TestMeanSumOfSquares[i] = mean((yhat.bag-boston.test)^2)
}

plot(TestMeanSumOfSquares, type="l")
#horizonal line, line type=2, so dashed, and colour is red
abline(h=TestMeanSumOfSquares[1], lty=2, col="red")

#~~~~~~~~~~~~~~~~~~

#example Car data set applying bagging using randomForest package
library(ISLR)
install.packages("randomForest")
library(randomForest)
library(MASS)
High=ifelse(Carseats$Sales<=8, "No", "Yes")
Carseats=data.frame(Carseats,High) #add one column to the carseats data set
set.seed(2)
train=sample(1:nrow(Carseats), 200)
Carseats.test=Carseats[-train,]
High.test=Carseats[-train,"High"]
# the '.-Sales' means everything minus sales.
bag.carseats=randomForest(High~.-Sales, Carseats,subset=train,mtry=10)

#this is our predicted y, yes/no
yhat.carseats=predict(bag.carseats,newdata=Carseats.test)

#build confusion matrix and look at error rates.
table(yhat.carseats, High.test)

fix(Carseats)

#~~~~~~~~~~~~~~~~~~
# try and plot bagging error rate using majority vote and also average probabilities
# using a loop but both lines on same graph.

#Black Line - bagging error rate using majority vote.
# calculate the black line:
yhat.ter.mv=rep(0,200) # a vector for Test Error Rate using majority vote (by default)
for(i in 1:200){
   bag.carseats=randomForest(High~.-Sales,Carseats,subset=train,mtry=10,ntree=i)
   yhat.carseats=predict(bag.carseats,newdata=Carseats.test)
   yhat.ter.mv[i]=(table(yhat.carseats,High.test)[1,2]+table(yhat.carseats,High.test)[2,1])/200}
  # or yhat.ter.mv[i] = mean(yhat.carseats!=High.test)


#plot the black line
plot(yhat.ter.mv,xlab="Number of Bootstrap Data Sets",ylab="Test Error Rate", type="l",ylim=c(0.10,0.35))
#plot the red dashed line
abline(h=yhat.ter.mv[1],lty=2,col="red")

# calculate the black line:
yhat.ter.mv=rep(0,200) # a vector for Test Error Rate using majority vote (by default)
for(i in 1:200){
   bag.carseats=randomForest(High~.-Sales,Carseats,subset=train,mtry=10,ntree=i)
   yhat.carseats=predict(bag.carseats,newdata=Carseats.test)
   yhat.ter.mv[i]=(table(yhat.carseats,High.test)[1,2]+table(yhat.carseats,High.test)[2,1])/200
  # or yhat.ter.mv[i] = mean(yhat.carseats!=High.test)
   }
#plot the black line
plot(yhat.ter.mv,xlab="Number of Bootstrap Data Sets",ylab="Test Error Rate", type="l",ylim=c(0.10,0.35))
#plot the red dashed line
abline(h=yhat.ter.mv[1],lty=2,col="red")


#~~~~~~~~~~~~~~~~~~
#larger the number is, the more important it is, if the factor is not there, then the MSE will be increased by X
importance(bag.boston)
varImpPlot(bag.boston) # find out how to plot in the “bar chart” style
