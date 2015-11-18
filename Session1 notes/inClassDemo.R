To learn more and/or disable this warning message see the "Use secure download method for HTTP" option in Tools -> Global Options -> Packages.
> x=1
> x+2
[1] 3
> x
[1] 1
> x=x+2
> y=1
> z=y+x
> x<-1
> p<-1
> p
[1] 1
> x
[1] 1
> x<- c(1,2,3,4)
> x= c(1,2,3,4)
> y= c(1,2,3,4)
> y= seq(1,2,3,4)
Error in seq.default(1, 2, 3, 4) : too many arguments
> y= seq(1,5)
> y= seq(1,10)
> y= seq(1,10, length = 10)
> y= seq(1,10, length = 15)
> clear x
Error: unexpected symbol in "clear x"
> clc x
Error: unexpected symbol in "clc x"
> y=1:5
> x
[1] 1 2 3 4
> y
[1] 1 2 3 4 5
> x+y
[1] 2 4 6 8 6
Warning message:
  In x + y : longer object length is not a multiple of shorter object length
> x= c(0,,2,3,4)
Error in c(0, , 2, 3, 4) : argument 2 is empty
> x= c(0,1,2,3,4)
> x
[1] 0 1 2 3 4
> y
[1] 1 2 3 4 5
> x+y
[1] 1 3 5 7 9
> x*y
[1]  0  2  6 12 20
> x*z
[1]  0  4  8 12 16
> z
[1] 4
> z=1:50
> z
[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34
[35] 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
> x*z
[1]   0   2   6  12  20   0   7  16  27  40   0  12  26  42  60   0  17  36  57  80   0  22  46  72 100   0
[27]  27  56  87 120   0  32  66 102 140   0  37  76 117 160   0  42  86 132 180   0  47  96 147 200
> x+z
[1]  1  3  5  7  9  6  8 10 12 14 11 13 15 17 19 16 18 20 22 24 21 23 25 27 29 26 28 30 32 34 31 33 35 37
[35] 39 36 38 40 42 44 41 43 45 47 49 46 48 50 52 54
> z+x
[1]  1  3  5  7  9  6  8 10 12 14 11 13 15 17 19 16 18 20 22 24 21 23 25 27 29 26 28 30 32 34 31 33 35 37
[35] 39 36 38 40 42 44 41 43 45 47 49 46 48 50 52 54
> z
[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34
[35] 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
> x
[1] 0 1 2 3 4
> z+x
[1]  1  3  5  7  9  6  8 10 12 14 11 13 15 17 19 16 18 20 22 24 21 23 25 27 29 26 28 30 32 34 31 33 35 37
[35] 39 36 38 40 42 44 41 43 45 47 49 46 48 50 52 54
> ls()
[1] "p" "x" "y" "z"
> rm(p)
> rm(ls())
Error in rm(ls()) : ... must contain names or character strings
> rm(list=ls())
> ?ls
> ?seq
> ?"vector"
> x<-5.3:8, length = 10
Error: unexpected ',' in "x<-5.3:8,"
> x<-5.3:8 length = 10
Error: unexpected symbol in "x<-5.3:8 length"
> x= seq(5.3,8, length = 10)
> is.vector(x)
[1] TRUE
> y=seq(3.5,7.9, 0.4)
> x+y
[1]  8.8  9.5 10.2 10.9 11.6 12.3 13.0 13.7 14.4 15.1 12.8 13.5
Warning message:
  In x + y : longer object length is not a multiple of shorter object length
> ?seq