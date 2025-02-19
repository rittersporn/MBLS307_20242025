### Challenge
### Volcano plot and boxplot of relative protein quantification data from a proteomics experiment
### 14.02.2025

library(ggplot2)
library(readr)
library(dplyr)
library(ggrepel)

file_path <- "./data/Data_challenge.txt"

data <- read.table(file_path, sep='\t', header = TRUE)

#Remove rows with NA values
de <- data[complete.cases(data), ]

#Basic scatter plot
ggplot(data=de, aes(x=log2_PAD4_vs_YFP, y=pval_PAD4_vs_YFP)) + geom_point()

#Convert p-value to -log10(p-value) directly in the aes()
p <- ggplot(data=de, aes(x="log2 abundance PAD4 vs YFP", y="-log10(p-value)")) + geom_point() + labs(title = "Volcano plot PAD vs YFP")
  

# Add a more simple theme to the plot
p <- ggplot(data=de, aes(x=log2_PAD4_vs_YFP, y=-log10(pval_PAD4_vs_YFP))) + geom_point() + theme_minimal()
# can also write this as p <- p + theme_minimal()


# Add vertical lines for log2FoldChange thresholds, and one horizontal line for the p-value threshold
p2 <- p + geom_vline(xintercept=c(-0.6, 0.6), col="red") +
  geom_hline(yintercept=-log10(0.05), col= "red")
p2

colnames(de)



#Add a column of NAs
de$diffexpressed <- "NO"


#Add lines
p2 <- p + geom_vline(xintercept=c(-0.6, 0.6), col="red") +
  geom_hline(yintercept=-log10(0.05), col="red")


# Organize the labels nicely using the "ggrepel" package and the geom_text_repel() function
#Data_challenge$delabel <- NA

#Write name of genes next to the points
#Create a new column "delabel" to de, that will contain the name of genes differentially expressed
de$delabel <- NA
de$delabel[(de$log2_PAD4_vs_YFP >10) & (de$pval_PAD4_vs_YFP < 0.05)] <- de$Protein.IDs[(de$log2_PAD4_vs_YFP > 10) & (de$pval_PAD4_vs_YFP < 0.05)]


ggplot(data=de, aes(x=log2_PAD4_vs_YFP, y=-log10(pval_PAD4_vs_YFP), label=delabel)) + 
  geom_point() + 
  theme_minimal() +
  geom_text(nudge_y = 1) +
  geom_vline(xintercept=c(-0.6, 0.6), col="red") +
  geom_hline(yintercept=-log10(0.05), col="red")


#Organize the labels using "ggrepel"
# load library
library(ggrepel)
dev.off()

### Boxplots for the abundance of one or more selected proteins in two samples from 
#four replicates (‘PAD4’ and ‘YFP’) and display log2 ratio and p-value on the plot 

#Data in 2 boxes
ggplot(data=df2, mapping=aes(x=grouping, y=sample1)) + geom_boxplot()



Volcano plot PAD vs YFP
y axis:   -log10(p-value)
x axis:  log2 abundance PAD4 vs YFP