#!/usr/bin/Rscript


# Task 2 ------------------------------------------------------------------


# print R version
R.version.string

# create random numbers
rnorm(10)

# save random numbers
v1 <- rnorm(10)
v2 <- rnorm(10)

v1 + v2

# save numbers 1:100
v3 <- 1:100

# sum of numbers 1:100
sum(v3)


# Task 3 ------------------------------------------------------------------


# create matrix with 7 rows and 6 columns
M <- matrix(1:42, nrow = 7, ncol = 6)

# matrix summary commands
dim(M)
nrow(M)
ncol(M)
summary(M)

# mathematical matrix operations
sum(M)
mean(M)

# class of M
class(M)

# amino acid list (mol. weights from wikipedia)
AA <- list(Ala = 89.10,
           Asn = 132.12,
           Asp = 133.10,
           Arg = 174.20
           )

# printing single values
AA[['Ala']]
AA$Ar             # partial matching
AA$Asp
AA['Asn']


# Task 4 (partly) ---------------------------------------------------------

# inspect elements in the environment
ls()

# remove M
rm(M)

# inspect again
ls()



