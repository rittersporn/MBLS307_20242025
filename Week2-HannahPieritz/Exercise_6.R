#Exercise 6

### Question 1 - Area of circle ###
area_circle <- function(d) {
  pi* (d/2)^2
}
area_circle(3.4)

#use it on a vector of data
diameter_circle <- seq(from = 0, to = 10, by = 1)
area_circle(diameter_circle)

### Question 2 - Convert F to Centegrade ###
F_to_C <- function(of) {
  oC <- (oF -32) * 5/9
  cat("Farenheit:", oF, "is equivalent to", oC, "centrigrade.\n")
}

F_to_C(100)

### Question 3 - Mean, median, and range of the vector ###
values <- rnorm(100, mean = 35, sd = 15) #length = 100, mean = 35, sd = 15

summary.fun <- function(dat) {
  value_mean <- mean(dat)
  value_median <- median(dat)
  value_min <- min(dat)
  value_max <- max(dat)
  
  #Print the results
  cat("Mean:", value_mean, "\n")
  cat("Median:", value_median, "\n")
  cat("The range is from", value_min, "to", value_max, "\n")
  
  #Plot histogram with density curve
  hist(dat, main = "Histogram with density curve", xlab = "Values", ylab = "Proportion", freq = FALSE)
  lines(density(dat), col = "red")
}

summary.fun(values)


### Question 4 - Calculate median value of a vector ###
the_median <- function(number) {
  # Calculate the length of the vector
  vector_length <- length(number)  
  
  # Sort the vector first
  sorted_numbers <- sort(number)
  
  # Check if the length is odd
  if (vector_length %% 2 == 1) {
    # Find the middle element of an odd-length vector
    middle_index <- (vector_length + 1) / 2
    median_value <- sorted_numbers[middle_index]
  } else {
    # Calculate the mean of the two middle elements of an even-length vector
    mid_indices <- c(vector_length / 2, (vector_length / 2) + 1)
    median_value <- mean(sorted_numbers[mid_indices])
  }
  
  # Return the median
  return(median_value)
}

# Test for odd length
random_data <- sample(1:100, size = 11, replace = TRUE)
print(random_data)
cat("The median is:", the_median(random_data), "\n")

# Test for even length
random_data_even <- sample(1:100, size = 10, replace = TRUE)
print(random_data_even)
cat("The median is:", the_median(random_data_even), "\n")


### Question 5 - Ricker model ###
Ricker_model <- function(initial_pop, growth_rate, duration, capacity = 100) {
    
    # Vector to store population sizes over time
    pop_sizes <- numeric(duration + 1)
    # Set starting population
    pop_sizes[1] <- initial_pop  
    
    # Loop through time steps to calculate population size
    for (t in 1:duration) {
      pop_sizes[t + 1] <- pop_sizes[t] * exp(growth_rate * (1 - pop_sizes[t] / capacity))
    }
    
    # Make a time vector for plotting
    time_points <- 0:duration
    
    # Plot the population dynamics over time
    plot(time_points, pop_sizes, type = "b", #type b means it plots points and lines btw points
         col = "blue", pch = 16, # pch 16 = plotting chara ter is a solid circle
         xlab = "Time (t)", ylab = "Population size (N)",
         main = paste("Population Growth with r =", growth_rate))
    
  }

# Run the function with different parameters
Ricker_model(initial_pop = 0.5, growth_rate = 1.2, duration = 100, capacity = 50)