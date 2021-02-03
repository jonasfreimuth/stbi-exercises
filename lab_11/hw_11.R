#!/usr/env/Rscript

library(MASS)
library(plot3D)
library(plot3Drgl)

dist <- read.table('data/lab_11/distMat.txt', header = TRUE)

dist_mat <- as.matrix(dist)

n <- 10 

stress <- rep(NA, n)

for (i in 1:n) {
  stress[i] <- isoMDS(dist_mat, k = i)$stress
} 

plot(stress, type = 'b', xlab = 'dimensions')

mds <- cmdscale(dist_mat, k = 3)

# the resulting plot is not what it should be and i don't know why
scatter3D(mds[,1], mds[,2], mds[,3], pch = 16, col = 'black')

plotrgl()
