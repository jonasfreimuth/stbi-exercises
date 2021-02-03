#!/usr/env/Rscript


# Homework ----------------------------------------------------------------

gmean <- function(x, na.rm = FALSE) {
  
  if (na.rm) {
    
    x <- x[!is.na(x)]
    
  } else if (any(is.na(x))) {
    
    return(NA)
    
  }
  
  return(prod(x)^(1/length(x)))
  
}

hmean <- function(x, na.rm = FALSE) {
  
  if (na.rm) {
    
    x <- x[!is.na(x)]
    
  } else if (any(is.na(x))) {
    
    return(NA)
    
  }
  
  return(length(x)/sum(1/x))
  
}

hmean(c(20, 60))

gmean(c(19000, 42000))
