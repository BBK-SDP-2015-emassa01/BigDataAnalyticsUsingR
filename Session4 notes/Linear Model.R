library(ISLR)
attach(Default)

plot(Default$balance, Default$default, col="orange")

#gives you warning that the data should be number not categories
lm.fit = lm(Default$default~Default$balance,data=Default)

#so you convert data
lm.fit = lm(as.numeric(Default$default)~Default$balance,data=Default)

abline(lm.fit)

lm.fit = lm(as.numeric(Default$default)~Default$balance,data=Default)


#plot between 0 and 1
plot(Default$balance, as.numeric(Default$default)-1, col="orange")

#we can change the variable going forward store it locally
default_num=as.numeric(Default$default)-1

#then use it in the model
lm.fit = lm(as.numeric(default_num)~Default$balance,data=Default)
plot(Default$balance, as.numeric(default_num), col="orange")
abline(lm.fit, col="red")


#GENERAL LINEAR MODEL
#general linear model
glm.fit=glm(default~balance, data=Default, family=binomial)
summary(glm.fit)

#response means give me probability not category, for 1000, and 2000 y values
newy = predict(glm.fit, data.frame(balance=c(1000,2000)), type="response")
newy


#STUDENT EXAMPLE - both variables are qualitative so it's fine. you do not have to do it explicitly
glm.fit.student=glm(default~student, data=Default, family = binomial)
glm.fit.student


#now we are going to do a prediction
student_num=as.numeric(Default$student)-1
#gives a vector of students not as Y /N but 0/1.

glm.fit.student.num=glm(Default$default~Default$student, data=Default, family = binomial)

newy.student.num=predict(glm.fit.student.num,data.frame(student_num=c(0,1)),type="response")
newy

##new example, kind of a cheating way to use .... to create the curve
glm.fit=glm(default~balance, data=Default, family=binomial)
plot(Default$balance, glm.fit$fit, col="blue", pch=".")
plot(Default$balance, Default$default)
plot(Default$balance, glm.fit$fit,col="blue", pch=".")

#this is the non-cheating way
default_num=as.numeric(Default$default)-1
plot(Default$balance, default_num,col="orange")
xrange=seq(min(Default$balance),max(Default$balance),length.out=100)
#I want to use a function of the library called inverse logit. inverse of logit function. What does that mean?
#y=f(x), it means, takes the output as input, and input of previous function as output.
library(boot)
lines(xrange, inv.logit(glm.fit$coef[1]+glm.fit$coef[2]*xrange),col="red")

#second way
yrange=predict(glm.fit,data.frame(balance=xrange), type="response")
lines(xrange,yrange,col="black") #gives you a continous line but is harder to understand. it is better though!
#this is the prediction function - so its the recommended way.





