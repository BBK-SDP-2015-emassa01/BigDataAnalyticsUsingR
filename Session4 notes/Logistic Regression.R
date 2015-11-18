library(ISLR)
?Default
plot(Default$balance, Default$income, col=ifelse(Default$default=='No',"Blue", "orange"), pch = ifelse(Default$default=='No',"o", "+"))

attach(Deafult)

plot(default, balance, xlab="Default", ylab="Balance")

#colours c=("blue", "orange")