# Ex. 2
x <- 12.43
log(x)
log10(x)
sqrt(x)
exp(x)

area_circle <- pi*20^2
area_circle

(14*0.51)^(1/3)

weight <- c(69, 62, 57, 59, 59, 64, 56, 66, 67, 66)
mean(weight)
var(weight)
sd(weight)
length(weight)
first_five <- weight[1:5]
first_five

height <- c(112, 102, 83, 84, 99, 90, 77, 112, 133, 112)
summary(height)

some_child <- height[c(2, 3, 9, 10)]
some_child
shorter_child <- height[height < 99]
shorter_child

bmi <- weight/(height/100)^2 
bmi

seq1 <- seq(0, 1, 0.1)
seq2 <- seq(10, 1, -0.5)
rep(1:3, 3)
rep(c("a", "c", "e", "g"), each=3)

height_sorted <- sort(height)
height_antisorted <- sort(height, decreasing = TRUE)

child_name <- c("Alfred", "Barbara", "James", "Jane", "John", "Judy", "Louise", "Mary", "Ronald", "William")
names_sort <- child_name[order(height)]
names_sort

weight_rev <- child_name[rev(order(weight))]
weight_rev

my_data <- c(2, 4, 1, 6, 8, 5, NA, 4, 7)
mean(my_data)
?mean
mean(my_data, na.rm = TRUE)

ls()
rm(seq1)
