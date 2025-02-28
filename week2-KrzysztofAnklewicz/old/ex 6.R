library(tidyverse)
circle_area <- function(r) {return( pi*r^2)}
circle_area(3.4)
circle_area(c(2, 4, 1.652))

FtoC <- function(Fahrenheit) {
  Celsius <- (Fahrenheit - 32) * 5/9
  paste("Farenheit: ", Fahrenheit,"  is equivalent to ", Celsius, " centigrade.") %>% return()
}
FtoC(30)

Ricker <- function(N, r, K=100, t_max=60, data=c(0)) {
  t_max <- t_max - 1 
  if (t_max == 0) {return(data)} else if (t_max>0) {
    append(data, N)
    dN <- N * exp(r*(1 - N/K))
    Ricker(dN, r, K, t_max, data)
  }
}
Ricker(N=1, r=1.5)
