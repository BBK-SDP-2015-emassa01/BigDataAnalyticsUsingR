install.packages("e1071")
install.packages("LiblineaR")

library(e1071)
library(LiblineaR)

set.seed(1)
x=matrix(rnorm(20*2),ncol=2)
x

y=c(rep(-1,10),rep(1,10))
y

# just want to add 1 to some values of x (wherever y==1)
x[y==1,]=x[y==1,]+1

plot(x,col=(3-y)) #way to get the colour to show up in red and blue (have a column that is either -1 or 2.)

#plot(x,col=4)
#plot(x,col=2)

#encode response as a factr by creating a data frame
dat=data.frame(x=x,y=as.factor(y))
#y
#z=as.factor(y)
#z

library(e1701)
svmfit=svm(y~.,data=dat,kernal="linear", cost=10,scale=FALSE)
plot(svmfit,dat)

svmfit$index

summary(svmfit)

#smaller cost
svmfit=svm(y~.,data=dat,kernal="linear", cost=0.10,scale=FALSE)
plot(svmfit,dat)
svmfit$index
summary(svmfit)#small cost = larger number of support vectors wider margins

#Try another function tune()
#perform 10 fold cross validation, compare svms with linear kernal, using a range of valuesof the cost parameter
set.seed(1)
tune.out=tune(svm,y~.,data=dat,kernal="linear", ranges=list(cost=c(0.001,0.01,0.1,1,5,10,100)))
summary(tune.out)

bestmod=tune.out$best.model
summary(bestmod) #tells you what the best model and cost were

#PREDICT class labels
#generate some test data

xtest=matrix(rnorm(20*2),ncol=2)
ytest=sample(c(-1,1),20,rep=TRUE)
ytest
xtest

xtest[ytest==1,]=xtest[ytest==1,]+1
testdat=data.frame(x=xtest,y=as.factor(ytest))
testdat

#predict class laels of these observations
ypred=predict(bestmod,testdat)#bestmod was generated before with cost 1 i think
table(predict=ypred, truth=testdat$y)
testdat$y

#what if cost was 0.1?
svmfit=svm(y~.,data=dat, kernal="linear", cost=0.1, scale=FALSE)
ypred=predict(svmfit,testdat)
table(predict=ypred,truth=testdat$y)

#a LINEARLY seperable training set
x[y==1,]=x[y==1,]+0.5
plot(x,col=(y+5)/2,pch=19)
#fit witha  very large cost so none are misclassified
dat=data.frame(x=x, y=as.factor(y))
svmfit=svm(y~.,data=dat,kernal="linear", cost=1e5)
summary(svmfit)
plot(svmfit,dat)

#smaller cost value
svmfit=svm(y~.,data=dat,kernal="linear", cost=1)
summary(svmfit)
plot(svmfit,dat)
#may fit new data better than the high cost one.

#SUPPORT VECTOR MACHINES USING OTHER KERNALS
#e.g., radial
set.seed(1)
x=matrix(rnorm(200*2),ncol=2)
x
x[1:100,]=x[1:100,]+2
x[101:150,]=x[101:150,]-2
y=c(rep(1,150),rep(2,50))
dat=data.frame(x=x,y=as.factor(y))
dat

train=sample(200,100) #split randomly into train and test. gamma specifies radial basis
svmfit=svm(y~.,data=dat[train,],kernal="radial",gamma=1,cost=1)
plot(svmfit,dat[train,])
summary(svmfit)

#increase cost
svmfit=svm(y~.,data=dat[train,],kernal="radial",gamma=1,cost=1e5)
plot(svmfit,dat[train,])
summary(svmfit)

#choosing best parameter values
set.seed(1)
tune.out=tune(svm,y~.,data=dat[train,],kernal="radial",ranges=list(cost=c(0.1,1,10,100,1000),gamma=c(0.5,1,2,3,4)))
summary(tune.out)

#then we can predict! suing the -train subset
table(true=dat[-train,"y"],pred=predict(tune.out$best.model, newx=dat[-train,]))
