matrix(c(1,2,3,4),2,2,byrow=TRUE)

matrix(c(1,2,3,4),2,2,byrow=FALSE)

matrix(c(1,2,3,4),3,4,byrow=TRUE)

matrix(c(1,2,3),3,4)

A= matrix(c(1:12),3,4)
dim(A)
A[,2] # PICKS OUT THE ENTIRE COLUMN
A[1:2,2]  # PICKS OUT THE ENTIRE COLUMN OF ROW 1-2 ONLY

A[-c(1,3),] #DONT WANT ROW 1 OR 3, BUT WE WANTEVERYTHING ELSE


#B=matrix(c(1,3,5,7,9), 4,5, byrow=TRUE)

B= matrix(data=seq(1,39,by=2), 4,5, byrow=TRUE)

B= matrix(seq(1,39,2), 4,5, byrow=TRUE)

B[c(2,4),c(2,3)]
B[-c(1,3),-c(1,4,5)]
B[-c(1,3),c(2,3)]
B[c(2,4),-c(1,4,5)]

c=matrix(c(1,1,2,3,5,8,13,21,34),3,3)

C[1,1]
C[2,1]
C[c(1,2),1]
C[,1]


# install.packages('numbers')

fib <- function(x) {if (x<=2) 1 else fib(x-1)+fib(x-2)}

#file.Rmd  is a markdown file which can be 'knitted' to PDF or HTML to see code, and the output of the code on that file.