#!/usr/bin/Rscript


# Task 2 ------------------------------------------------------------------

# print numbers from 10 to twenty when divisible by 3
for (x in 10:20) {
  if (x %% 3 == 0) print(x)
}

# read all tab files
tab_list <- list()
files <- list.files('data/lab_2/', full.names = TRUE)
for (i in 1:length(files)) {
  
  tab_list[[i]] <- read.table(files[i])
  
}

tabs <- as.data.frame(tab_list)

# same functionality in a function
read_tab_files <- function(path) {
  tab_list <- list()
  files <- list.files(path, full.names = TRUE)
  for (i in 1:length(files)) {
    
    tab_list[[i]] <- read.table(files[i])
    
  }
  
  return(as.data.frame(tab_list))
}

tabs_2 <- read_tab_files('data/lab_2/')


# Task 3 ------------------------------------------------------------------

# function converting inches to cm
inch2cm <- function(x) {
  return(x * 2.54)
}

# recursive fibonaccis
fib_rec <- function(n) {
  
  if (n < 2) {
    return(n)
  } 
  
  return(fib_rec(n-1) + fib_rec(n-2))
  
}

# iterative fibonaccis
fib_iter <- function(n) {
  
  if (n < 2) {
    return(n)
  }
  
  f_n2 <- 0
  f_n1 <- 1
  
  for (x in 2:n) {
    
    f_n <- f_n1 + f_n2
    f_n2 <- f_n1
    f_n1 <- f_n
    
  }
  
  return(f_n)
  
}

system.time(print(fib_rec(25)))
system.time(print(fib_iter(25)))


# Homework ----------------------------------------------------------------


stud <- list(name = 'Jonas',
             age = '23',
             knowledge = round(runif(1) * 20),
             learn = function() {
               print(paste(stud$name, "is learning now."))
               stud$knowledge <<- stud$knowledge + 1
               print(paste("The knowledge of", stud$name, "increased by one!"))
             },
             get_knowledge = function() {
               return(stud$knowledge)
             },
             get_age = function() {
               return(stud$age)
             }
             )

stud$get_age()
stud$get_knowledge()
stud$learn()
stud$get_knowledge()











