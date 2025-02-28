library(tidyverse)
t2 <- table2
View(t2)

population_count <- t2 %>% filter(type=="population") %>%  pull(count)

t2_fix <- t2 %>% filter(type=="cases") %>% 
  rename(cases=count) %>% 
  mutate(population=population_count) %>% 
  select(-type) %>% 
  mutate(rate=cases/population*10000)

View(t2_fix)

t3 <- table3
View(t3)

t3_fix <- t3 %>% separate_wider_delim(rate, delim = "/", names=c("cases", "population")) %>% 
  mutate(cases=parse_double(cases), population=parse_double(population)) %>% 
  mutate(rate=cases/population*10000)

View(t3_fix)
