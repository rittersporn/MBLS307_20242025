library(tidyverse)
mpg_df <- mpg
mpg_df %>% head()
mpg_df %>% ggplot() 

# make a boxplot displaying engine size per car class. Add individual data points on top of the boxplot, 
# encode the car manufacturer as a color of the data points, and change the theme to “classic”. 
# Also, change the limits of the y-axis from 0 to 10 and give informative titles for the axes. 
# Finally, remove explicit plotting of outlier data points on the boxplot.

mpg_df$class.fac <- factor(mpg_df$class)
str(mpg_df)

mpg_df %>% ggplot(aes(x = class.fac, y = displ)) + 
  geom_boxplot(alpha=0) + 
  geom_jitter(height=0, width=0.2, aes(colour = manufacturer)) + 
  theme_classic() + 
  ylim(0, 10) +
  xlab("Car class") +
  ylab("Engine size") +
  ggtitle("Engine size by car class")

displs <- mpg_df %>% pull(displ)
mean(displs)


