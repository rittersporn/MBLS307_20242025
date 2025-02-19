### Exercise 2

#12.02.2025

### Question 2 Log ###
x <- 12.43

#natural log
log(x)

#log to the base 10
log10(x)

#log to the base 2
log2(x)

#square root and natural antilog of 12.43
sqrt(x)
exp(x)

### Question 3 Area of circle ###
d <- 20
r <- d/2
area_circle <- pi * r^2
print(area_circle)
cat("Area of the circle:", area_circle)

### Question 4 Cube root ###
x <- 14 * 0.51
cube_root_x <- x^(1/3)
cat(cube_root_x)

### Question 5 Vectors ###
weight <- c(69,62,57,59,59,64,56,66,67,66)

### Question 6 Mean, variance, SD, range ###
mean_weight <- mean(weight)
var_weight <- var(weight)
sd_weight <- sd(weight)
range_weight <- range(weight)
# num of children is length of the vector
num_children <-length(weight)

first_five <- weight[1:5]
print(first_five)

### Question 7 Summary fnc ###
height <- c(112,102,83,84,99,90,77,112,133,112)
summary(height)

#Extract height of 2nd, 3rd, 9th & 10th child
some_child <- height[c(2,3,9,10)]
shorter_child <- height[height <= 99]

### Question 8 Vectorisation ###
#Change height from cm to m
height_m <- height/100
bmi <- weight / (height_m^2)


### Question 9 Sequences_seq ###
seq1 <- seq(from = 0, to = 1, by = 0.1)


### Question 10 Sequences_rev ###
seq2 <- rev(seq(from = 1, to = 10, by = 0.5))

### Question 11 Sequences_rep ###
#1 2 3 1 2 3 1 2 3
seq3 <- rep(1:3, times = 3)

#“a” “a” “a” “c” “c” “c” “e” “e” “e” “g” “g” “g”
seq4 <- rep(c("a", "c", "e", "g"), each = 3)

#“a” “c” “e” “g” “a” “c” “e” “g” “a” “c” “e” “g”
seq5 <- rep(c("a", "c", "e", "g"), each = 3)

#1 1 1 2 2 2 3 3 3 1 1 1 2 2 2 3 3 3
seq6 <- rep(c(1,2,3), each = 3, times = 2)

#1 1 1 1 1 2 2 2 2 3 3 3 4 4 5
seq7 <- rep(c(1,2,3,4,5), times = c(5,4,3,2,1))

#7 7 7 7 2 2 2 8 1 1 1 1 1
seq8 <- c(rep(7,4), rep(2,3), rep(8,1), rep(1,5))


### Question 12 Sorting ###
#ascending order
height_sorted <- sort(height)

#descending order
heigh_sorted_descending <- rev(sort(height))

#Question 13 New vector with names
child_name <- c("Alfred", "Barbara", "James", "Jane", "John", "Judy", "Louise", "Mary", "Ronald", "William")
  
### Question 14 Order fnc ###
names_sort <- child_name[order(height)]

#Shortest child
shortest <- names_sort[1]

#Tallest child
tallest <- names_sort[10]


### Question 15 Order fnc ###
weight_rev <- child_name[order(weight, decreasing = TRUE)]

#Heaviest child
heaviest <- weight_rev[1]

#Lightest child
lightest <- weight_rev[10]

### Question 16 Missing data ###
mydata <- c(2, 4, 1, 6, 8, 5, NA, 4, 7)
mean(mydata)

#r returns NA because NA is in the data. It prevents you from making further calculations when data is missing

mean_value_wo_na <- mean(mydata, na.rm = TRUE)

### Question 17 All variables ###
rm(seq1)
rm(seq8)
ls()
