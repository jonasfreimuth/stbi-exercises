
# geneExpr_PCA ------------------------------------------------------------

gene_data <-
  read.table(
    'data/lab_11/GSE5628_series_matrix_subset.txt',
    header = TRUE,
    row.names = 1
  )

str(gene_data)

log_gene <- log2(gene_data)

hist(as.matrix(log_gene))

boxplot(log_gene)
