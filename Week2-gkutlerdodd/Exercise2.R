#Exercise 2
#2.2
log(12.43)
log10(12.43)
log2(12.43)
exp(12.43)

#2.3
area_circle <- pi*(20/2)^2

#2.4
(14*0.51)^(1/3)

#2.5
weight <- c(69, 62, 57, 59, 59, 64, 56, 66, 67, 66)

#2.6
mean(weight)
var(weight)
sd(weight)
range(weight)
length(weight)
first_five <- weight[1:5]

#2.7
height <- c(112, 102, 83, 84, 99, 90, 77, 112, 133, 112)
summary(height)
some_child <- height[c(2,3,9,10)]
shorter_child <- height[height <= 99]

#2.8
bmi <- weight/((height/100)^2)

#2.9
seq1 <- seq(0, 1, by=0.1)

#2.10
seq2 <- seq(10, 1, by=-0.5)

#2.11
rep(c(1,2,3), 3)
rep(c("a","c","e","g"), each=3)
rep(c("a","c","e","g"), 3)
rep(rep(c(1,2,3), each=3), 2)
rep(c(1,2,3,4,5), seq(5,1,by=-1))
rep(c(7,2,8,1), c(4,3,1,5))

#2.12
height_sorted <- sort(height)
height_inv <- sort(height, decreasing=TRUE)

#2.13
child_name <- c("Alfred", "Barbara", "James", "Jane", "John", "Judy", "Louise", "Mary", "Ronald", "William")

#2.14
names_sort <- child_name[order(height)]
#shortest = Louise, tallest = Ronald

#2.15
weight_rev <- child_name[order(weight, decreasing=TRUE)]

#2.16
mydata <- c(2, 4, 1, 6, 8, 5, NA, 4, 7)
mean(mydata)
mean(mydata, na.rm=TRUE)

#2.17
ls()
rm(seq1)