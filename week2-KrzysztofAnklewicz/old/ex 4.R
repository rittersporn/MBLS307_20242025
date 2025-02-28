squid <- read.table("week2-KrzysztofAnklewicz/data/squid1.txt", header=TRUE)
str(squid)
summary(squid)

squid$year.fac <- factor(squid$year)
squid$month.fac <- factor(squid$month)
squid$maturity.stage.fac <- factor(squid$maturity.stage)
str(squid)

table(squid$year.fac, squid$month.fac)

par(mfrow = c(2, 2))
for (x in c("DML", "weight", "nid.length", "ovary.weight")) {dotchart(squid[, x], xlab=x)} # plot 1

squid$nid.length[11] <- 43.2

par(mfrow = c(2, 2))
for (x in c("DML", "weight", "eviscerate.weight", "ovary.weight")) {hist(squid[, x], main=x, xlab=x)} # plot 2

par(mfrow = c(2, 2))   # plot 3
plot(squid$DML, squid$weight, xlab="DML", ylab="Weight", main="No transformation")
plot(squid$DML, log(squid$weight),xlab="DML", ylab="log(weight)", main="log transformation")
plot(squid$DML, sqrt(squid$weight), xlab="DML", ylab="sqrt(weight)", main = "sqrt transformation")



par(mfrow = c(2, 2)) # plot 4
library("vioplot")
boxplot(DML~maturity.stage.fac, data=squid, xlab="Maturity stage", ylab = "DML", main="Box plot") # plot 4
vioplot(DML~maturity.stage.fac, data=squid, xlab="Maturity stage", ylab = "DML", main="Violin plot")


