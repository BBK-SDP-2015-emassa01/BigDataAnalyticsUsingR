x=c(2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2,1,1.5,1.1)
mean(x)
x- (mean(x))

y=c(2.4, 0.7,2.9,2.2,3,2.7,1.6,1.1,1.6,0.9)
y- mean(y)

CoMatrix=matrix(c(cov(x,x),cov(x,y),cov(y,x), cov(y,y)),2,2)
CoMatrix

eigen(CoMatrix)
