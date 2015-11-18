cigarettes = c(0,5,10,15,20)

lungCapacity = c(45,42,33,31,29)

plot(cigarettes, lungCapacity)

cov(cigarettes, lungCapacity)

cor(cigarettes, lungCapacity)
# correlation is -0.9615092, which is a strong negative correlation. 
# as number of cigarettes increases, lung capacity decreases.
# we cannot imply causation.