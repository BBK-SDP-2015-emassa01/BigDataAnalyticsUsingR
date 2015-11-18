#Build a regression tree

library(ISLR)
install.packages("tree")
library(tree)

#name of player, hits, runs, years, no years played, league, division
Hitters

fix(Hitters)
?Hitters
nrow(Hitters)

# some salaries are unknown, we do not have them. Rows with unknown salary are useless. 
# We must delete those rows (can impute missing data, but this is simpler and makes data set smaller)
Hitters$Salary

#delete na data
Hitters = na.omit(Hitters)
?na.omit

#MAKE THE TREE
#y = log salary
#x = years+hits you can add more
tree.hitters=tree(log(Salary)~Years+Hits, Hitters)

#draws tree, leaf nodes represent average. you can use median, but it doesn't spit out a different value.
tree.hitters

#summary
summary(tree.hitters)

#plot
plot(tree.hitters) #no text! add text
text(tree.hitters, pretty=0)
text(tree.hitters)
?text.tree

# MAKE PREDICTIONS using years =5 and hits = 100
#yhat is a vector, estimated value of salary when using the tree model
yhat=predict(tree.hitters, newdata=list("Years"=5, "Hits"=100))
yhat

#another way of visualising the decision tree.

#EXAMPLE
set.seed(2)
train=sample(1:nrow(Hitters), 132) #132 number of observations to split the data into train/test
tree.hitters.train=tree(log(Salary)~Hits+Runs+RBI+Walks+Years+PutOuts+AtBat+Assists+Errors, data=Hitters, subset=train )

plot(tree.hitters.train)
text(tree.hitters.train)
summary(tree.hitters.train)
#if you view the train, you take 132 observations in the training set
tree.hitters.train

#How many nodes should you keep in the tree?
cv.hitters=cv.tree(tree.hitters.train)
plot(cv.hitters$size,cv.hitters$dev, type='b')
?cv.tree #cross validation tree, choosing a tree complexity.
#you look at which number of nodes gives you the least deviance/error.

#prune the tree to the lowest deviance.
prune.hitters=prune.tree(tree.hitters.train, best=3)
plot(prune.hitters)
text(prune.hitters)

#another way to visualise (good for one or two predictors)
plot(Hitters$Years, Hitters$Hits, col="orange", pch=16,xlab="Years", ylab="Hits")
partition.tree(prune.hitters,odvars=c("Years", "Hits"), add=TRUE)


#USE PRUNED TREE TO MAKE PREDICTIONS ABOUT THE TEST DATA SET
# yhat will have a value, wherever the Hitters set -train values are.
#Hitters test will have the data from only the "Salary" column, and compare this to the 
#predicted data we just got. We only take the true values from Salary in the TEST dataset.
yhat=predict(prune.hitters, newdata=Hitters[-train,])
hitters.test=log(Hitters[-train, "Salary"]) #we want to predict the salary.
#we want to compare these two above. So the above just extracts the data we want to compare.
plot(yhat, hitters.test)
abline(0,1)
mean((yhat-hitters.test)^2)
sqrt(mean((yhat-hitters.test)^2))


#######################################
#CLASSIFICATION TREE
High=ifelse(Carseats$Sales<=8, "No", "Yes")
Carseats=data.frame(Carseats,High)
tree.carseats=tree(High~.-Sales,Carseats)
summary(tree.carseats)

#test error rate estimation
set.seed(2)
train=sample(1:nrow(Carseats), nrow(Carseats)/2)
Carseats.test=Carseats[-train,]
High.test=High[-train]
tree.carseats.train=tree(High~.-Sales, Carseats, subset=train)
tree.pred.test=predict(tree.carseats.train, Carseats.test,type="class")
table(tree.pred.test, High.test)

#calculate train error rate
High.train=High[train]
tree.pred.train=predict(tree.carseats.train, Carseats[train,], type="class")
table(tree.pred.train, High.test)
