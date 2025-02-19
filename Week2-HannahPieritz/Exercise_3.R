#Exercise 3
#12.01.25

### Question 5 - Import file into R ###
file_path <- "./data/whaledata.txt"

#. because it is a relative pathway. Refers to the working directory
getwd()

whale <- read.table(file_path, header = TRUE, sep = "\t")

#sep = "\t" means separator for tab-delimited filed is a tab (\t)

#To see first few rows of data
head(whale)



### Question 6 - See data ###
#names of columns (the variable names)
names(whale)

#To see the structure of the dataset & summary of variables
str(whale)

# Number of oberservations in this dataset = # of rows
nrow(whale)


# Number of variables in this dataset = # columns
ncol(whale)

#To see the type of variables
class(whale$month)
class(whale$water.noise)


### Question 7 - Summary of dataset ###
summary(whale)

# Variables with missing values
# read this from the summary
# number of whales, (1)

# Number of missing values
# 1

### Question 8 - Manipulating dataframe ###

#8a
#1:10 is the first 10 rows, 1:4 is the first 4 columns
whale.sub <- whale[1:10, 1:4]

#8b
whale.num <- whale[,c("month", "water.noise", "number.whales")]

#8c
whale.may <- whale [1:50, ]

#8d
whale.subset <- whale [-(1:10), -ncol(whale)]
# -(1:10) excludes the 1st 10 rows
# -ncol(whale) excludes the last column

### Question 9 - Conditional statements ###

#9a - at depths greater than 1200 m
depth_greater_1200 <- whale[whale$depth > 1200, ]

#9b - gradient steeper than 200 degrees
gradient_steeper_200 <- whale[whale$gradient > 200, ]

#9c - water noise level of ‘low’
low_noise_level <- whale[whale$water.noise == "low", ]

#9d - water.noise level of ‘high’ in the month of ‘May’
may_high_noise <- whale[whale$water.noise == "high" & whale$month == "May", ]

#9e - month of ‘October’, water noise level of ‘low’ and gradient greater than the median value of gradient (132)
Oct_low_132 <- whale[whale$month == "October" & whale$water.noise == "low" & whale$gradient > 132, ]

#9f - all observations from between latitudes 60.0 and 61.0 and longitudes -6.0 and -4.0
Lat60_61_long6_4 <- whale[whale$latitude >= 60.0 &  whale$latitude <= 61.0 & whale$longitude >= -6.0 & whale$longitude <= -4.0, ]

#9g - all rows that do not have a water noise level of medium
Water_noise_not_medium <- whale[whale$waternoise != "medium", ]

### Question 10 - Include R fncs ###
Oct_low_132 <- whale[whale$month == "October" & whale$water.noise == "low" & whale$gradient > median(whale$gradient), ]

### Question 11 -  Problem with output ###
depth_more_1500_spotted_more_average <- whale[whale$depth > 1500 & whale$number.whales > mean(whale$number.whales), ]


### Question 12 - Subset fnc ###
#12a All rows in May
whale_may <- subset(whale, month == "May" & time.station < 1000 & depth >1000)

#12b
whale_october <- subset(whale, month == "October" & latitude > 61, select = c(month,latitude, longitude, number.whales)) 

### Question 13 - Order dataframes ###
whale.depth.sort <- whale[order(whale$depth), ]

### Question 14 - Order by ascending & descending ###
#14a ascending
whale.depth.noise <- whale[order(whale$water.noise, whale$depth), ]

#14b descending
whale.depth.noise <- whale[order(whale$water.noise, -whale$depth), ]

### Question 15 - Summarize variables ###
mean(whale$time.at.station)     # mean time at station
median(whale$depth)             # median depth
length(whale$number.whales)     # number of observations

# mean  # of whale @ each water noise level
mean_whales_noiselevel <- tapply(whale$number.whales, whale$water.noise, mean)

# median  # of whale @ each water noise level
median_whales_noiselevel <- tapply(whale$number.whales, whale$water.noise, median)

# median  # of whale for each month
median_whales_month <- tapply(whale$number.whales, whale$month, median)

### Question 16 - Summarize variables ###
#16a
# FUN = mean. It applies the mean fnc to each group
# ~ water.noise. Groups the data by the water.noise
mean_water_noise <- aggregate(cbind(time.at.station, number.whales, depth, gradient) ~ water.noise, data = whale, FUN = mean, na.rm = TRUE)

#16b
mean_water_noise_month <- aggregate(cbind(time.at.station, number.whales, depth, gradient) ~ water.noise + month, data = whale, FUN = mean, na.rm = TRUE)

### Question 17 - Table & Tabs fnc ###
#17a Determine # of observations for each combo
num_obs_water_noise <- table(whale$water.noise)

#17b Display # of observations
num_obs_water_noise_month <- table(whale$water.noise, whale$month)

#17c Replace with xtabs
num_obs_wn_xtab <- xtabs(~ water.noise, data = whale)
  
num_obs_wnmonth_xtab <- xtabs(~ water.noise + month, data = whale)

### Question 18 - Export the dataframe ###
exported_file_path <- ".data/whale_num.txt"
write.table(whale.num, file = exported_file_path, sep = "\t", row.names = FALSE, col.names = TRUE)
