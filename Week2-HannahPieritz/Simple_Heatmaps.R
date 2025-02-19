##Making simple heatmaps with the pheatmap package
#14.02.2025

install.packages("pheatmap")


# make a data frame with gene expression values
# The gene IDs should be in row names
#Expression of 10 genes across 5 conditions
df <- data.frame(row.names = c("geneA", "geneB", "geneC", "geneD", "geneE", "geneF", "geneG", "geneH", "geneI", "geneJ"),
                 condition1 = runif (10, min = -3, max = 3),
                 condition2 = runif (10, min = -3, max = 3),
                 condition3 = runif (10, min = -3, max = 3),
                 condition4 = runif (10, min = -3, max = 3),
                 condition5 = runif (10, min = -3, max = 3))

### make a simple heatmap
#load library
library(pheatmap)

#make the heatmap
pheatmap(df)


#re-draw the heatmap without clustering genes
pheatmap(df,
         cluster_cols = FALSE)

#remove grey border around the cells
pheatmap(df,
         border_color = NA)




png("Gene expression heatmap", width = 350, height = 400)
pheatmap(df, border_color = NA)
dev.off()

getwd()
