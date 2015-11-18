#calculate MSE in R
library(ISLR)
attach(Auto)
y=Auto$mpg
x=Auto$horsepower
lm.fit= lm(y~x, data = Auto)
#mse part here:
mean((y-predict(lm.fit,Auto))^2)

# How to Calculate Error Rate in R (done for logistic regression/classification)
# • In logistic regression, calculate the training error rate
# – Building the glm.fit
# – Using glm.fit to make probability predictions
# – Set a threshold (could be 0.5, or other number) to make qualitative
# predictions based on the probability predictions
# – Using table() function to build a confusion matrix
# – Using mean() function to calculate the error rate

fix(Default)
glm.fit=glm(default~income+balance+student,data=Default,family=binomial)
summary(glm.fit)
glm(formula = default ~ income + balance + student, family = binomial,data = Default)

#making predictions as probabilities
glm.probs=predict(glm.fit,type="response")
glm.probs[1:10]

#The contrasts function indicates that R has created a dummy variable with a 1 for Yes.
contrasts(Default$default)
length(Default$default)

#create a vector for predicting yes or no. 
# It has the same length as Default$default, and has “No” as the initial values.
glm.pred=rep("No",10000)

#Set those whose prob > 0.5 to be “Yes”
glm.pred[glm.probs>.5]="Yes"

#The table function shows the confusion matrix
table(glm.pred,Default$default)

#using mean to show the accuracy and error rate
mean(glm.pred==Default$default)
mean(glm.pred!=Default$default)
