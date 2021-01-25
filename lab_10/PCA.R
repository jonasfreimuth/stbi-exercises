# library(ggbiplot)


# iris pca ----------------------------------------------------------------

data(iris)

pca <- prcomp(iris[, 1:4])

plot(pca)

plot(pca$x)

colv <- as.numeric(as.factor(iris$Species))

plot(pca$x, col = colv, pch = 19)

biplot(pca)


# gene expression pca -----------------------------------------------------


