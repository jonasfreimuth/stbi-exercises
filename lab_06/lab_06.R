#!/usr/env/Rscript

# Task 3 ------------------------------------------------------------------

gss <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/AER/GSS7402.csv')

inc_eth_tab <- table(gss$ethnicity, gss$lowincome16)
inc_eth_tab_prop <- prop.table(inc_eth_tab)
inc_eth_tab_perc <- inc_eth_tab_prop * 100

# assocplot(inc_eth_tab) # uncomment if you can't be asked to install vcd
vcd::assoc(inc_eth_tab, shade = TRUE)

test <- chisq.test(inc_eth_tab)
test

cohen_W <- function(x, y = NULL) {
  
  if (is.vector(x) & is.vector(y)) {
    
    tab <- table(x, y)
    
  } else if (class(x) == 'table') {
    
    tab <- x
    
  } else {
    
    stop('Could not construct table.')
    
  }
  
  exp <- prop.table(chisq.test(tab)$expected)
  obs <- prop.table(tab)
  
  w <- sqrt(sum(((obs - exp)^2 / exp)))
  
  print(w)
  
  return(w[[1]])
} 

cohen_W(inc_eth_tab)


