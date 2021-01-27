#!/usr/env/Rscript


# Task 2 ------------------------------------------------------------------

gss <- read.table('https://vincentarelbundock.github.io/Rdatasets/csv/AER/GSS7402.csv',
                  sep = ",", row.names = 1, header = TRUE)

str(gss)

dim(gss)

head(gss)

summary(gss)

if (!dir.exists('data')) {
  dir.create('data')
}

if (!dir.exists('data/lab_05')) {
  dir.create('data/lab_05')
}

write.table(gss, file = 'data/lab_05/GSS7402.tab')


# Task 3 ------------------------------------------------------------------

table(gss$ethnicity)

table(gss$lowincome16)

table(gss$ethnicity, gss$lowincome16)

chisq.test(gss$ethnicity, gss$lowincome16)


# mode function from lecture
dg_mode = function (cat) {
  tab = table(cat)
  idx = which(max(tab) == tab)
  return(names(tab)[idx])
}

dg_mode(gss$ethnicity)
dg_mode(gss$lowincome16)


# Task 3 ------------------------------------------------------------------

tab <- table(gss$ethnicity, gss$lowincome16)

par(mfrow = c(1, 2))

mosaicplot(tab, shade = TRUE)
assocplot(tab)

# Task 4 ------------------------------------------------------------------

# can't be asked to deal with base R plotting, sorry


# Task 5 ------------------------------------------------------------------

n <- 10000

res <- rep(NA, n)

for (i in 1:n) {
  
  lowincome <- sample(gss$lowincome16, size = nrow(gss))
  ethnicity <- sample(gss$ethnicity, size = nrow(gss))
  
  test <- chisq.test(lowincome, ethnicity)
  
  res[i] <- test$statistic
  
}

sum(res > chi_test$statistic)
