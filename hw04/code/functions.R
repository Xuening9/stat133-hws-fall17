# ============================
# Title: functions
# Description: this file is the function used in hw04
# ============================

setwd("/Users/Xuening/stat133/stat133-hws-fall17/hw04/code")
#- remove_missing()
# - returns the input vector without missing values

remove_missing <- function(a){
  if(is.numeric(a)){
  a = a[!is.na(a)]
  return(a)
  }
  else{
    stop("the vector is not numeric")
  }
}

#- get_minimum()
#- find the minimum value from a numeric vector
get_minimum<- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <- head(sort(b, decreasing = FALSE),1)
  return(b)
}

#- get_maximum()
#- find the maximum value from a numeric vector
get_maximum <- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <-  head(sort(b, decreasing = TRUE),1)
  return(b)
}

#- get_range()
#- compute the overall range of the input vector
get_range <- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  min <- get_minimum(a, na.rm = TRUE)
  max <- get_maximum(a, na.rm = TRUE)
  return(max - min)
}

#- get_percentile10()
#- compute the 10th percentile of the input vector
get_percentile10 <- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <-  quantile(b,0.1)
  return(b)
}

#get_percentile90()
get_percentile90 <- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
 b <- remove_missing(a)
 b <-  quantile(b,0.9)
  return(b)
}

#- get_median()
#- compute the median of the input vector
get_median <- function(a,na.rm = TRUE){
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <- sort(b)
  length_b <- length(b)
  if (length_b %% 2 == 1) {
    return(b[(length_b + 1) / 2])
  } else {
    return((b[(length_b / 2)] + b[(length_b / 2 + 1)]) / 2)
  }
}

#- get_average()
#- compute the average (i.e. mean) of the input vector
get_average <- function(a, na.rm = TRUE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  length_b <- length(b)
  sum_b <- 0
  for (i in 1:length_b) {
    sum_b = sum_b + b[i]
  }
  return(sum_b / length_b)
}

#- get_stdev()
#- compute the standard deviation of the input vector
get_stdev <- function(a, na.rm = TRUE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  length_b <- length(b)
  sum_diff_sqr <- 0
  average_b <- get_average(b)
  for (i in 1:length_b) {
    sum_diff_sqr = sum_diff_sqr + (b[i] - average_b)^2
  }
  return(sqrt(sum_diff_sqr / (length_b - 1)))
}

#- get_quartile1()
#- compute the first quartile of the input vector
get_quartile1 <- function(a, na.rm = TRUE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <- quantile(b, 0.25)
  return(b)
}

#- get_quartile3()
#- compute the 3rd quartile of the input vector
get_quartile3 <- function(a, na.rm = TRUE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (!na.rm) {
    if (anyNA(a)) {
      return(NA)
      stop()
    }
  }
  b <- remove_missing(a)
  b <- quantile(b, 0.75)
  return(b)
}

#- count_missing()
#- calculates the number of missing values NA
count_missing <- function(a) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  b <- 0
  a_length <- length(a)
  for (i in 1:a_length) {
    if (is.na(a[i])) {
      b = b + 1}
  }
  return(b)
}

#- summary_stats()
#- returns a list of summary statistics
summary_stats <- function(a) {
  summary_a <- list()
  summary_a["minimum"] <- get_minimum(a)
  summary_a["percent10"] <- get_percentile10(a)
  summary_a["quartile1"] <- get_quartile1(a)
  summary_a["median"] <- get_median(a)
  summary_a["mean"] <- get_average(a)
  summary_a["quartile3"] <- get_quartile3(a)
  summary_a["percent90"] <- get_percentile90(a)
  summary_a["maximum"] <- get_maximum(a)
  summary_a["range"] <- get_range(a)
  summary_a["stdev"] <- get_stdev(a)
  summary_a["missing"] <- count_missing(a)
  return(summary_a)
}

#- print_stats()
#- takes a list of summary statistics, and prints the values in a nice format
print_stats <- function(a) {
  b <- summary_stats(a)
  ret <- ''
  for (i in 1:11) {
    ret <- paste(ret, 
                 format(names(b[i]), 
                             width = 9, 
                             justify = "left"), ":",
                 formatC(as.numeric(b[i]), 
                         format = "f", digits = 4, 
                         flag = "0"),"\n", sep = " ")
  }
  cat(ret,sep = "\n")
  #return(ret)
}

#- rescale100()
#- compute a rescaled vector with a potential scale from 0 to 100
rescale100 <- function(x, xmin, xmax) {
  if (!is.numeric(x)) {
    stop("the vector is not numeric")}
  if (xmin >= xmax) {
    stop("the min is not smaller than the max")
  }
  b <- rep(0, length(x))
  for (i in 1:length(x)) {
    b[i] = 100 * (x[i] - xmin) / (xmax - xmin)
  }
  return(b)
}

#- drop_lowest()
#- returns a vector of length n ??? 1 from a length n vector 
#- by dropping the lowest value
drop_lowest <- function(a) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (anyNA(a)) {
    stop("NA exists")}
  b <- sort(a)
  b <- b[2:length(b)]
  return(b)
}
#- score_homework()
#- compute a single homework value,return the average of the homework scores
score_homework <- function(a, drop = FALSE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (anyNA(a)) {
    stop()}
  b <- a
  if (drop) {
    b = drop_lowest(a)
  }
  return(get_average(b))
}

#- score_quiz()
#- compute a single quiz value,return the average of the quiz scores
score_quiz <- function(a, drop = FALSE) {
  if (!is.numeric(a)) {
    stop("the vector is not numeric")}
  if (anyNA(a)) {
    stop()}
  b <- a
  if (drop) {
    b = drop_lowest(a)
  }
  return(get_average(b))
}

#- score_lab()
#- takes a numeric value of lab attendance, and returns the lab score

score_lab <- function(x) {
  if (!is.numeric(x)) {
    stop("the input is not numeric")}
  b <- rep(0,length(x))
  for(i in 1:length(x)){
  if (x[i] == 11 | x[i] == 12) {b[i] <- 100}
  if (x[i] == 10) {b[i] <- 80}
  if (x[i] == 9) {b[i] <- 60}
  if (x[i] == 8) {b[i] <- 40}
  if (x[i] == 7) {b[i] <- 20}
    if (x[i] <= 6) {b[i] <- 0}
  }
  return(b)
}

#- score_grade()
#- takes a numeric value of overall grade and returns into letters grade
score_grade <- function(x){
  if (!is.numeric(x)) {
    stop("the input is not numeric")}
  b <- rep(0,length(x))
  for(i in 1:length(x)){
    if (x[i] < 50) {b[i] <- "F"}
    else if (x[i] < 60) {b[i] <- "D"}
    else if (x[i] < 70) {b[i] <- "C-"}
    else if (x[i] < 77.5) {b[i] <- "C"}
    else if (x[i] < 79.5) {b[i] <- "C+"}
    else if (x[i] < 82) {b[i] <- "B-"}
    else if (x[i] < 86) {b[i] <- "B"}
    else if (x[i] < 88) {b[i] <- "B+"}
    else if (x[i] < 90) {b[i] <- "A-"}
    else if (x[i] < 95) {b[i] <- "A"}
    else{b[i] <- "A+"}
  }
  return(b)
}




