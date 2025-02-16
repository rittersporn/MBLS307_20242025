?read.table
whales <- read.table("week2-KrzysztofAnklewicz/data/whaledata.txt", header=TRUE)

str(whales)
summary(whales)

whale.sub <- whales[1:10, 1:4]
whale.num <- whales[, c(1, 3, 4)]
whales[-(1:10), -(8)]

whales[whales$depth > 1200, ]
whales[whales$water.noise == "high" & whales$month=="May", ]
whales[whales$water.noise == "low" & whales$month=="October" & whales$gradient > median(whales$gradient), ]
whales[whales$latitude > 60 & whales$latitude < 61 & whales$longitude > -6 & whales$longitude < -4, ]

whales[whales$depth > 1200 & whales$number.whales >  mean(whales$number.whales),]
mean(whales$number.whales, na.rm = TRUE)

subset(whales, subset= (month == "May" & time.at.station<1000 & depth < 1000), select = c("month", "latitude", "longitude", "number.whales"))

whales[order(whales$water.noise, whales$depth), ]

tapply(whales$number.whales, whales$water.noise, mean, na.rm=TRUE)

aggregate(whales[, c(2, 4, 7, 8)], list(noise = whales$water.noise), mean, na.rm=TRUE)

table(whales$water.noise, whales$month)
xtabs(~ water.noise + month, data=whales)
