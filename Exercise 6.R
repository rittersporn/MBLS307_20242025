##Exercise 6: Basic programming in R


## Question 1: 1. Create a function to calculate the area of a circle. Test the function by finding the area of a circle with a diameter of 3.4 cm. 

diameter <- 3.4
radius <-diameter/2
area <-pi * radius^2
print (area)

## Question 2: Function to convert farenheit into centegrade (oC = (oF - 32) x 5/9)

centegrade <- (farenheit - 32)*5/9


## Question 3: create a vector of normally distributed data
data_vector <-rnorm(1:100, mean=35, sd = 15)
#function to calculate mean, median and range of vector
data_mean <-mean(data_vector)
print (data_mean)

#function to calculate median
data_median<-median (data_vector)
print(data_median)

#function to calculate range of vector
data_range <-range(data_vector)
print (data_range)

#plot histogram with density curve
hist(data_vector, probability = TRUE, col = "lightblue", border = "black", main = "Histogram with density curve", xlab = "values")
lines(density(data_vector), col = "red", lwd=2)


## Question 4: calculate the median value of a vector of numbers 
c(1:10)

getwd()
file.exists("./data/squid1.txt")  
