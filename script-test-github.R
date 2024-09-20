# test script
library("tidyverse")
head(mpg)
ggplot(mpg, aes(x = class, y = displ)) +
  geom_boxplot() +
  geom_jitter()
