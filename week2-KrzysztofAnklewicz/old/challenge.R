library(tidyverse)
library(ggrepel)

df_prot <- read.delim("week2-KrzysztofAnklewicz/data/Sun-etal-2021-IP-MS-PAD4-vs-YFP.txt",
           header=TRUE)
View(df_prot)
cutoff = 2
pval = 0.005

df_prot <- df_prot %>% rename(fold2 = log2_PAD4_vs_YFP, pvalue = pval_PAD4_vs_YFP)

df_prot$label <- NA
df_prot$label[abs(df_prot$fold2) > 4*cutoff & 
                df_prot$pvalue < pval/100] <- df_prot$Protein.IDs

ggplot(data=df_prot, aes(x=fold2, y=-log10(pvalue), labels=label)) + 
  geom_point() + geom_vline(xintercept=c(-cutoff, cutoff), col="red") +
  geom_hline(yintercept=-log10(pval), col="red") +
  geom_label_repel(aes(label = label), na.rm = TRUE, size = 2, max.overlaps = 15) + 
  xlab("log2(PAD4/YFP)") + ggtitle("Volcano plot PAD4 vs YFP") 

# BOXPLOT
library(reshape2)

df_flip <- melt(df_prot[186,])
df_flip$sample_group <- NA
df_flip$sample_group[grepl("PAD4", df_flip$variable)] <- "PAD4"
df_flip$sample_group[grepl("YFP", df_flip$variable)] <- "YFP"
fold2 <- df_flip$value[df_flip$variable == "fold2"]
pvalue <- df_flip$value[df_flip$variable == "pvalue"]
df_flip <- df_flip %>% filter(variable!="fold2" & variable!="pvalue")

ggplot(data=df_flip, aes(x = sample_group, y = value)) + 
  geom_boxplot(alpha=0) + 
  geom_jitter(height=0, width=0.1) + 
  ggtitle(str_c("Normalised abundance of ", df_flip$Protein.IDs[1]),
          subtitle = str_c("P-value: ", pvalue, ", log2 ratio: ", round(fold2, 2)))+
  ylab("Normalised abundance") + xlab("Group") 
