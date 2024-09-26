### make a data frame with gene expression values. The gene IDs should be in row names. test change in the comment
df <- data.frame(row.names = c("geneA", "geneB", "geneC"),
                 sample1 = runif(3, min = -3, max = 3),
                 sample2 = runif(3, min = -3, max = 3),
                 sample3 = runif(3, min = -3, max = 3),
                 sample4 = runif(3, min = -3, max = 3))

### make a simple heatmap
# load library
library(pheatmap) 

# make the heatmap
pheatmap(df)


# re-draw the heatmap without clustering genes
pheatmap(df,
         cluster_cols = FALSE)

### exercise – making simple heatmaps
# make a dataframe, where gene IDs are in row names;
# number of values to be drawn by runif() should be the same as the number of rows (genes)
df <- data.frame(row.names = c("geneA", "geneB", "geneC", "geneD", "geneE", "geneF", "geneG", "geneH", "geneI", "geneJ"),
                 condition1 = runif(10, min = -3, max = 3),
                 condition2 = runif(10, min = -3, max = 3),
                 condition3 = runif(10, min = -3, max = 3),
                 condition4 = runif(10, min = -3, max = 3),
                 condition5 = runif(10, min = -3, max = 3))

# load the library
library(pheatmap)

# initial plot
pheatmap(df)

# final plot
pheatmap(df,
         cluster_cols = FALSE,
         border_color = NA,
         filename = "heatmap.png")
