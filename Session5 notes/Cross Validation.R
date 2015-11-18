#Plot autodata horsepower and mpg to understand rshp
# Suppose that we want to predict mpg from horsepower
attach(Auto)
set.seed(1)
train=sample(392,196)
#fit the model using the training set
lm.fit.train=lm(mpg~horsepower,data=Auto, subset=train)
#evaluate the model using the validation set
mean((Auto$mpg-predict(lm.fit.train,Auto))[-train]^2)

plot(Auto$horsepower,Auto$mpg,xlab="horsepower",ylab="mpg",col="blue")
abline(lm.fit.train,col="red")

#try a quadratic model
# • Repeat the procedure
# – Randomly split Auto data set (392 obs.) into training (196 obs.) and
# validation data (196 obs.) – the same as before
# – Fit the model using the training data set
lm.fit2.train=lm(mpg~poly(horsepower,2),data=Auto, subset=train)
# – Then, evaluate the model using the validation data set
mean((Auto$mpg-predict(lm.fit2.train,Auto))[-train]^2)
# [1] 19.82259 #linear model: 26.14142
# • Compare the two test errors
# – The quadratic model has a smaller test error, thus is better!

#now lets do a LEAVE ONE OUT CROSS VALIDATION
# • Using the Auto data set again, building a linear model
glm.fit=glm(mpg~horsepower,data=Auto)
# This is the same as lm.fit(mpg~horsepower,data=Auto)
library(boot) #cv.glm() is in the boot library
cv.err=cv.glm(Auto,glm.fit)
# cv.glm() does the LOOCV
cv.err$delta
#[1] 24.23151 24.23114
#The MSE is 24.23151.

#now lets do a KFOLD VALIDATION
# • Very easy! 
glm.fit=glm(mpg~horsepower,data=Auto)
# This is the same as in LOOCV
library(boot) # This is the same as in LOOCV
cv.err=cv.glm(Auto,glm.fit, K=10)
#K means K-fold, can be 5, 10 or other numbers
cv.err$delta
# [1] 24.3120 24.2926
#number will change because we use k folds which can be different.

#LAB EXERCISE
#Validation set approach to degree 3
set.seed(1)
train=sample(392,196)
lm.fit3 = lm(mpg~poly(horsepower,3), data=Auto, subset=train)
mean((mpg-predict(lm.fit3, Auto))[-train]^2)


#Leave-One-Out Cross Validation
#• Experiment on the CV for increasingly complex polynomial fits
#• Initialise a vector of length len all to be number val
#– vec = rep(val,len)
#• Using for loop to repeat procedure
cv.error = rep(0,5)
cv.error
for(i in 1:5){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error[i] =cv.glm(Auto,glm.fit)$delta[1]
}
cv.error


# K-Fold Cross Validation
# • Implement k-fold CV by passing the argument K
set.seed(17)
cv.error.10=rep(0,10)
for(i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i), data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit, K=10)$delta[1]
}
cv.error.10
