# Boxplot displaying engine size per car class

# Load the necessary library
library(ggplot2)

# Plot the engine size vs car class using the mpg dataset
ggplot(data = mpg, aes(x = class, y = displ)) +
  #x = Car class in the column "class", y = Engine size is in column "displ". 
  geom_boxplot(outlier.colour = "red") +
  geom_jitter() +  # Add jitter for individual points
  theme_classic() +  #Change theme to classic
  labs(title = "Engine Size Across Car Classes",
       x = "Car Class",
       y = "Engine Size (liters)")
