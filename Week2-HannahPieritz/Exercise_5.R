#Exercise_5
#12.02.2025

### Question 1 - ###
# Import the data to R
prawn_data <- read.csv("./data/prawnGR.csv", header = TRUE)

#to see all files in the data folder
list.files("./data")

#Summary of prawn data
summary(prawn_data)

#Boxplot of Growth rate by diet type
boxplot(prawn_data$GRate ~ prawn_data$diet, 
        main = "Growth Rate by Diet Type",
        xlab = "Diet Type",
        ylab = "Growth Rate",
        col = c("pink", "blue"))

# Number of observations for each diet
table(prawn_data$diet)

### Question 2 - ###
#Assess normality of growth rate for each diet separately
natural_growth <- prawn_data$GRate[prawn_data$diet == "Natural"]
shapiro.test(natural_growth)

artificial_growth <- prawn_data$GRate[prawn_data$diet == "Artificial"]
shapiro.test(artificial_growth)

#Test for equal variance
var.test(natural_growth, artificial_growth)

#For natural growth:
#p value is more than 0.05 (it is 0.307), so data is normally distributed

#For artifical growth:
#The p- value is also more than 0.05 (it is 0.1533), so the data is normally distrobued

#For the variances the p value is more than 0.05 (it is 0.07445), so you can say the variances are equal

### Question 3 - Two samples t-test ###
#Null Hypothesis: There is no difference in the mean growth rates between the two diet groups
t_test_result <- t.test(GRate ~ diet, data = prawn_data, var.equal = TRUE)
t_test_result

#You fail to reject the null hypothesis
# the p-value is more than 0.05 (it is 0.1901), so you can not reject the null hypothesis. There is no significant difference btw the growth rates

#The value of the t statistic is -1.3259
#The degrees of freedom is 58
#The p value is 0.1901

### Question 4 - Linear model ###
#Fit linear model w GRate as response variable and diet as explanatory variable
growth.lm <- lm(GRate ~ diet, data = prawn_data)
summary(growth.lm)

### Question 5 - ANOVA table ###

anova_table <- anova(growth.lm)
anova_table

#ANOVA p-value is also 0.1901 (same as t-test)
#Value of F statistics is 1.7579
#Degrees of freedom for the diet factor is 1, for the residuals there are 58 df
# Pr(>F) = 0.1901, so it is more than 0.05. This shows that the diet does not have a significant effect on the growth rate of prawns

#Report
# You perform an ANOVA to compare the mean growth rate of praws that have a natural diet to those with an artifical diet.
# Results show that diet doesn't have a statistically significant effect on the growth rate.

### Question 6 - Plot residuals of fitted model ###
par(mfrow = c(2,2))

plot(growth.lm)

#Conclusions
# How to interpret residuals vs fitted?
#Q-Q plot has straight line, so residuals are normally distributed
#??

### Question 7- ###
gigartina_data <-read.csv("./data/Gigartina.csv", header = TRUE)
str(gigartina_data)

#Number of replicates per diatom treatment
table(gigartina_data$diatom.treat)

#Plot to examine if there are abvious differences in diameter btw treatments
boxplot(gigartina_data$diameter ~ gigartina_data$diatom.treat,
      main = "Comparison of Spore Diameter Across Treatments",
      xlab = "Diatom Treatment",
      ylab = "Spore Diameter (µm)",
      col = c("green", "blue", "red", "purple"))

### Question 8 - One-way ANOVA ###
#Null Hypothesis: The mean spore diameters of Metacarpus is the same in all 4 treatment groups

### Question 9 - ANOVA using linear model fnc ###
gigartina.lm <-lm(diameter ~ diatom.treat, data = gigartina_data)


#check summary of the linear model
summary(gigartina.lm)

### Question 10 - ###
anova(gigartina.lm)
#the p-value is 1.929e-08, which is smaller than 0.05
#Because the p value is smaller than 0.05, you reject the null hypothesis
#The F-value is 22.775
#The degrees of freedom ??? for diatom. treat is 3, and for residuals is 36
#Because you reject the null hypothesis there is a significant difference in mean spore diameter btw the 4 groups


### Question 11 - Residual plots ###
par(mfrow = c(2,2))
residuals <- resid(gigartina.lm)
#1. Residuals vs. fitted plot (to check for constant variance)
plot(fitted(gigartina.lm), residuals, main = "Residuals vs Fitted", xlab = "Fitted values", ylab = "Residuals")
#Seem to be randomly scattered around 0 -> show no pattern -> so equal variance

#2 Normal QQ plot (to check the normality of residuals)
qqnorm(residuals, main = "Normal Q-Q Plot")
qqline(residuals, col = "red")
#Follows straight line at the beginning but deviates towards the end
# -> so residuals are approximately normally distributed

#3 Scale-location plot (to check homogenity of variance)
plot(fitted(gigartina.lm), sqrt(abs(residuals)),  main = "Scale-Location", xlab = "Fitted values", ylab = "Square root of |Residuals|")


#4 residuals vs. leverage plot (to see if there are influential points)
plot(hatvalues(gigartina.lm), residuals, main = "Residuals vs Leverage", xlab = "Leverage", ylab = "Residuals")

#Do you accept this model as acceptable --> Yes?


### Question 13- ###
install.packages("mosaic")
library(mosaic)

tukey_results <- TukeyHSD(aov(gigartina.lm))
print(tukey_results)

#Groups different if you use p-value cutoff (alpha) of p < 0.05
#Sdecl - ASGM
#Sexpo-ASGM
#Sstat-ASGM 
#Sstat-Sexpo


### Question 14 - Plot of the comparisons ###
plot(TukeyHSD(gigartina.lm))


### Question 15- ###
temora_data <- read.csv("./data/TemoraBR.csv", header = TRUE)

#The variable types
str(temora_data)   
# To see the first few rows
head(temora_data)   
summary(temora_data)

#There are 3 variables
#The variables are: 
    # Temp: numeric
    # beat_rate: numeric
    # acclimitisation_temp: Integer
#The response (dependent) variable is beat_rate. 
#The explanatory (independent) variable is temp and accimitisation_temp.

### Question 16 - Convert acclimitisation_temp to factor###
#acclimitisation temp is numeric
# but because it represents categroical groups you should treat it as a factor

#To convert it to a factor:
temora_data$Facclimitisation_temp <- factor(temora_data$acclimitisation_temp)

#visualize the data
boxplot(beat_rate ~ Facclimitisation_temp, data = temora_data,
    main = "Beat Rate Across Acclimatisation Temperatures",
    xlab = "Acclimatisation Temperature (°C)",
    ylab = "Beat Rate (Hz)",
    col = c("red", "blue", "green"))


### Question 17 - Compare slopes & intercepts using ANOVA###
ancova_model <- lm(beat_rate ~ temp * Facclimitisation_temp, data = temora_data)
summary(ancova_model)

### Question 18 - Fit model using lm ###
ancova_model <- lm(beat_rate ~ temp * Facclimitisation_temp, data = temora_data)


### Question 19 - Summary ANOVA table ###
summary(ancova_model)


### Question 20 - Assess assumptions of normality & equal variance ###
residuals <- resid(ancova_model)
par(mfrow = c(2, 2))

# Normal QQ plot (to check the normality of residuals)
qqnorm(residuals)
qqline(residuals, col = "blue")

# Histogram of residuals (to check normality)??



### Question 21 - ###