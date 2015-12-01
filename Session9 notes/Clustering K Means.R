#K means in R
set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
plot(x)


#kmeans
km.out=kmeans(x,2,nstart=20) #apply k means to data x, k=2, do it 20 times!

km.out$cluster

#differentiate colours with a colour vector col=(km.out$cluster+1) which will change depending on number of cluster.
plot(x,col=(km.out$cluster+1),main="K-mean clustering results with k=2", xlab="",ylab="", pch=20,cex=2)

#what about k=3?
set.seed(4)
km.out=kmeans(x,3,nstart=20) #apply k means to data x, k=3, do it 20 times!
km.out

plot(x,col=(km.out$cluster+1),main="K-mean clustering results with k=3", xlab="",ylab="", pch=20,cex=2)
