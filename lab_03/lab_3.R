#!/usr/bin/Rscript


# Task 2 ------------------------------------------------------------------

# load data
protein <- read.table('data/lab_3/protein-consumption.tab')

# check data
head(protein)

# convert dataframe to matrix and save
prot_mat <- as.matrix(protein)

# check matrix
dim(prot_mat)
summary(prot_mat)

str(prot_mat)

# which three country eat most fish and most eggs
head(rownames(prot_mat[order(prot_mat[,'Fish'], decreasing = TRUE), ]), n = 3)
head(rownames(prot_mat[order(prot_mat[,'Eggs'], decreasing = TRUE), ]), n = 3)

# which countries have more than 20% red and white meat fraction in their 
# protein (sorry this is very botchy)
rownames(prot_mat)[(prot_mat[, 'RedMeat'] + prot_mat[, 'WhiteMeat'] > 20)]


# Task 3 ------------------------------------------------------------------

# load both GSS files
gssA <- read.table('data/lab_3/GSS7402A.tab', header = TRUE)
gssB <- read.table('data/lab_3/GSS7402B.tab', header = TRUE)

# check data
head(gssA)
head(gssB)

str(gssA)
str(gssB)

# calculate average age of first birth by living in city and by ethnicity
with(gssB, aggregate(agefirstbirth, by = list(city16), mean, na.rm = TRUE))
with(gssB, aggregate(agefirstbirth, by = list(ethnicity), mean, na.rm = TRUE))

# both together
with(gssB, aggregate(agefirstbirth, by = list(city16, ethnicity),
                     mean, na.rm = TRUE))

# tabulate ethnicity and living in a city
table(gssB$ethnicity)
table(gssB$city16)


# Task 4 ------------------------------------------------------------------

# check whether first colums are the same
length(union(gssA[, 1], gssB[, 1]))

# merge both data frames 
gss <- merge(gssA, gssB, by.x = 'kid', by.y ='child_id')

# aggregate year, ethnicity and city
with(gss, aggregate(agefirstbirth, by = list(year, ethnicity, city16),
                     mean, na.rm = TRUE))


