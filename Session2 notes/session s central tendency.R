arr = c(10,2,15,6,4,9,12,11,3,0,12,10,9,7,11,10,8,5,10,6)

lengthArr = length(arr)

sumArr =sum(arr)

meanArr =mean(arr)

medianArr = median(arr)

modeArr = mode(arr)

modeAccArr = names(sort(-table(arr)))[1]

#or

len = length(sort(table(arr)))

summary = fivenum(arr)

variance = var(arr)

std = sd(arr)

histo = table(arr)


hist(arr)