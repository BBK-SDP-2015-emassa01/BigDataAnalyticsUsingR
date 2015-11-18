library(MASS)
install.packages("ISLR")
fix(Boston)
?Boston


#name your mode, here we will use "lm.fit"
lm.fit = lm(medv~lstat, data=Boston)

# e.g., 
#medv is just median value
esha = lm(medv~lstat, data=Boston)

lm.fit
summary(lm.fit)

plot(Boston$medv, Boston$lstat)
plot(lm.fit)

#draw a red line of best fit

confint(lm.fit)

abline(lm.fit, col="red")

predict(lm.fit,data.frame(lstat=(c(5,10,15)))),interval="prediction")
