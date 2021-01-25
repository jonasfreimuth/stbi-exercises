#/usr/bin/Rscript


# Task 2 ------------------------------------------------------------------

library(ggplot2)
library(cowplot)

gss <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/AER/GSS7402.csv')

# inspect data variables
str(gss)

kids_plot <- ggplot(gss, aes(kids)) +
  geom_histogram()

ethnicity_plot <- ggplot(gss, aes(ethnicity)) +
  geom_bar()

age_plot <- ggplot(gss, aes(age)) +
  geom_histogram()

lowincome_kids_plot <- ggplot(gss, aes(lowincome16, kids)) +
  geom_boxplot()

lowincome_immigration_plot <- ggplot(gss, aes(lowincome16, immigrant)) +
  geom_count()

lowincome_agefirstchild_plot <- ggplot(gss, aes(lowincome16, agefirstbirth)) +
  geom_boxplot()

plot_grid(kids_plot, ethnicity_plot, age_plot, 
          lowincome_kids_plot, lowincome_immigration_plot,
          lowincome_agefirstchild_plot, nrow = 2, ncol = 3)


# Task 4 ------------------------------------------------------------------

tinytex::latexmk('data/lab_4/template-basic/template-minimal.tex')

# Task 5 ------------------------------------------------------------------


mean_new <- function(x, na.rm = FALSE) {
  
  if (na.rm) {
    
    x <- x[!is.na(x)]
    
  } else if (any(is.na(x))) {
    
    return(NA)
    
  }
  
  return(sum(x) / length(x))
  
}

median_new <- function(x, na.rm = FALSE) {
  
  if (na.rm) {
    
    x <- x[!is.na(x)]
    
  } else if (any(is.na(x))) {
    
    return(NA)
    
  }
  
  x <- sort(x)
  
  half_point <- (length(x) + 1) / 2
  
  a <- c(x[ceiling(half_point)], x[floor(half_point)])
  
  return(mean_new(a))
}

# Tests

x <- runif(50)

mean(x)
mean_new(x)

median(x)
median_new(x)
