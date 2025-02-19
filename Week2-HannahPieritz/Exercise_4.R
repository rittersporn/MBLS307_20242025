#Exercise 4
#12.02.2025

### Question 4 - Summarise dataset ###
file_path <- "./data/squid1.txt"
squid <- read.table(file_path, header = TRUE, sep = "\t")

str(squid)
summary(squid)

squid$year_factor <- as.factor(squid$year)
squid$month_factor <- as.factor(squid$month)
squid$maturity.stage_factor <- as.factor(squid$maturity.stage)

str(squid)

### Question 5 -  # of observations per month & year ###
#5a # of oberservations per month & year
xtabs(~ year_factor + month_factor, data = squid)

#5b Is there data for each month in each year?
# No, because there are 0 for Jan - Nov in 1989, 0 for Feb & June 1990 & 0 for August - Dec 1991

#5c Years with most oberservations
yearly_counts <- rowSums(table(squid$year_factor, squid$month_factor))

### Question 6 - Dotplots ###
dotchart(squid$DML, main = "Dotplot of DML", xlab = "DML")
dotchart(squid$weight, main = "Dotplot of Weight", xlab = "Weight")
dotchart(squid$nid.length, main = "Dotplot of Nid Length", xlab = "Nid Length")
dotchart(squid$ovary.weight, main = "Dotplot of Ovary Weight", xlab = "Ovary Weight")
#Yes, there is one main outlier in nid.length

pdf("./data/squid_dotplots.pdf")

### Question 7 - ###
#7a confirm its the correct value
which(squid$nid.length >400)
# answer: the 11th oberservation 

squid$nid.length[11]

#7b change this value to 43.2
squid$nid.length[11] <- 43.2

#7c redo dotchart
dotchart(squid$nid.length, main = "Corrected dotchart of nid length", xlab = "Nid Length")

### Question 8 - Histograms ###

#Export plots as pdfs to directory
pdf("squid_histograms.pdf")

#Create histograms for the variables; DML, weight, eviscerate.weight, ovary.weight
hist(squid$DML, main = "Histogram of DML", xlab = "DML", col = "blue")
hist(squid$weight, main = "Histogram of Weight", xlab = "Weight", col = "blue")
hist(squid$eviscerate.weight, main = "Eviscerate Weight", xlab = "Eviscerate Weight", col = "blue")
hist(squid$ovary.weight, main = "Ovary Weight", xlab = "Ovary Weight", col = "blue")

dev.off()

#Change the number of breaks to see how the shape of distribution changes
# more breaks -> histograms gives more detail
hist(squid$DML, breaks = 1, main = "Histogram of DML with 10 Breaks", xlab = "DML", col = "blue")
hist(squid$DML, breaks = 50, main = "Histogram of DML with 50 Breaks", xlab = "DML", col = "blue")

### Question 9 - Scatterplots ###
# Relationship between DML & Weight
plot(squid$DML, squid$weight, main = "Scatterplot of DML vs. Weight", xlab = "DML", ylab = "Weight")
# the relationship appears somewhat linear, however it has a slight exponential curve


# Save plots as a pdf file
pdf("squid_scatterplots.pdf")

#To linearise the relationship apply either log or sqrt
squid$log_weight <- log(squid$weight)
squid$sqrt_weight <- sqrt(squid$weight)
#Scatterplot of DML vs log(weight)
plot(squid$DML, squid$log_weight, main = "Scatterplot of DML vs. Log Weight", xlab = "DML", ylab = "Log(Weight)")

#Scatterplot of DML vs sqrt(weight)
plot(squid$DML, squid$sqrt_weight, main = "Scatterplot of DML vs. Sqrt Weight", xlab = "DML", ylab = "Sqrt(Weight)")
# when you sqrt weight the relationship becomes more linear. This transformation best linearises the relationship


dev.off()

### Question 10 - Boxplot ###
# Box plot
boxplot(squid$DML ~ squid$maturity.stage, 
        main = "DML by maturity stage", 
        xlab = "Maturity Stage",
        ylab = "DML")

# Violin plot
install.packages("vioplot")
library(vioplot)
vioplot(split(squid$DML, squid$maturity.stage),
        names = levels(squid$maturity.stage_factor),
        main = "Violin Plot of DML by Maturity Stage",
        xlab = "Maturity Stage",
        ylab = "DML")
