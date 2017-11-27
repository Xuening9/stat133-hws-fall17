# ==========================
# Title: tests.R
# Description: this is the testing script file for function.R
# ==========================

setwd("/Users/Xuening/stat133/stat133-hws-fall17/hw04/code")
library(testthat)
source("functions.R")

test_data_char <- c(1, 4, 7, NA, "10")
test_data_NA <- c(1, 4, 7, NA, 10)
test_data <- c(1, 4, 7, 10)
test_data_oddnumber <- c(1, 4, 7, 10, 11)
test_data_summary <- list(1, 1.9, 3.25, 5.5, 5.5, 7.75, 9.1, 10, 9, sqrt(15), 0)
names(test_data_summary) <- c("minimum", "percent10", "quartile1", "median", "mean", "quartile3", "percent90", "maximum", "range", "stdev", "missing")
test_data_NA_summary <- list(1, 1.9, 3.25, 5.5, 5.5, 7.75, 9.1, 10, 9, sqrt(15), 1)
names(test_data_NA_summary) <- c("minimum", "percent10", "quartile1", "median", "mean", "quartile3", "percent90", "maximum", "range", "stdev", "missing")

# ==========================
context("remove_missing")

test_that("not numeric", {
  expect_error(remove_missing(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(remove_missing(test_data), c(1, 4, 7, 10))
})

test_that("with NA", {
  expect_equal(remove_missing(test_data_NA), c(1, 4, 7, 10))
})

test_that("another with NA",{
  expect_equal(remove_missing(c(1, 2, 3, 4, NA)), c(1, 2, 3, 4))
})

# =========================
context("get_minimum")

test_that("not numeric", {
  expect_error(get_minimum(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_minimum(test_data), 1)
})

test_that("with NA, with removing", {
  expect_equal(get_minimum(test_data_NA, na.rm = TRUE), 1)
})

test_that("with NA, without removing", {
  expect_equal(get_minimum(test_data_NA, na.rm = FALSE), NA)
})

# ==========================
context("get_maximum")

test_that("not numeric", {
  expect_error(get_maximum(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_maximum(test_data), 10)
})

test_that("with NA, with removing", {
  expect_equal(get_maximum(test_data_NA, na.rm = TRUE), 10)
})

test_that("with NA, without removing", {
  expect_equal(get_maximum(test_data_NA, na.rm = FALSE), NA)
})

# ============================
context("get_range")

test_that("not numeric", {
  expect_error(get_range(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_range(test_data), 9)
})

test_that("with NA, with removing", {
  expect_equal(get_range(test_data_NA, na.rm = TRUE), 9)
})

test_that("with NA, without removing", {
  expect_equal(get_range(test_data_NA, na.rm = FALSE), NA)
})

# ==============================
context("get_percentile10")

test_that("not numeric", {
  expect_error(get_percentile10(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_percentile10(test_data), 1.9)
})

test_that("with NA, with removing", {
  expect_equal(get_percentile10(test_data_NA, na.rm = TRUE), 1.9)
})

test_that("with NA, without removing", {
  expect_equal(get_percentile10(test_data_NA, na.rm = FALSE), NA)
})

# ============================
context("get_percentile90")

test_that("not numeric", {
  expect_error(get_percentile90(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_percentile90(test_data), 9.1)
})

test_that("with NA, with removing", {
  expect_equal(get_percentile90(test_data_NA, na.rm = TRUE), 9.1)
})

test_that("with NA, without removing", {
  expect_equal(get_percentile90(test_data_NA, na.rm = FALSE), NA)
})

# ===============================
context("get_median")

test_that("not numeric", {
  expect_error(get_median(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_median(test_data), 5.5)
})

test_that("with NA, with removing", {
  expect_equal(get_median(test_data_NA, na.rm = TRUE), 5.5)
})

test_that("with NA, without removing", {
  expect_equal(get_median(test_data_NA, na.rm = FALSE), NA)
})

test_that("odd number", {
  expect_equal(get_median(test_data_oddnumber), 7)
})

# ============================
context("get_average")

test_that("not numeric", {
  expect_error(get_average(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_average(test_data), 5.5)
})

test_that("with NA, with removing", {
  expect_equal(get_average(test_data_NA, na.rm = TRUE), 5.5)
})

test_that("with NA, without removing", {
  expect_equal(get_maximum(test_data_NA, na.rm = FALSE), NA)
})

# ============================
context("get_stdev")

test_that("not numeric", {
  expect_error(get_stdev(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_stdev(test_data), sqrt(15))
})

test_that("with NA, with removing", {
  expect_equal(get_stdev(test_data_NA, na.rm = TRUE), sqrt(15))
})

test_that("with NA, without removing", {
  expect_equal(get_stdev(test_data_NA, na.rm = FALSE), NA)
})

# ==============================
context("get_quartile1")

test_that("not numeric", {
  expect_error(get_quartile1(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_quartile1(test_data), 3.25)
})

test_that("with NA, with removing", {
  expect_equal(get_quartile1(test_data_NA, na.rm = TRUE), 3.25)
})

test_that("with NA, without removing", {
  expect_equal(get_quartile1(test_data_NA, na.rm = FALSE), NA)
})

# ===========================
context("get_quartile3")

test_that("not numeric", {
  expect_error(get_quartile3(test_data_char), "the vector is not numeric")
})

test_that("without NA", {
  expect_equal(get_quartile3(test_data), 7.75)
})

test_that("with NA, with removing", {
  expect_equal(get_quartile3(test_data_NA, na.rm = TRUE), 7.75)
})

test_that("with NA, without removing", {
  expect_equal(get_quartile3(test_data_NA, na.rm = FALSE), NA)
})

# ================================
context("count_missing")

test_that("not numeric", {
  expect_error(count_missing(test_data_char), "the vector is not numeric")
})

test_that("no NA", {
  expect_equal(count_missing(test_data), 0)
})

test_that("1 NA", {
  expect_equal(count_missing(test_data_NA), 1)
})

test_that("2 NA", {
  expect_equal(count_missing(c(NA, NA, 1, 4, 7, 10)), 2)
})

# =================================
context("summary_stats")

test_that("not numeric", {
  expect_error(summary_stats(test_data_char), "the vector is not numeric")
})

test_that("stats for test_data", {
  expect_equal(summary_stats(test_data), test_data_summary)
})

test_that("stats for test_data_NA", {
  expect_equal(summary_stats(test_data_NA), test_data_NA_summary)
})

# =================================
context("print_stats")

# ===================================
context("rescale100")

test_that("not numeric", {
  expect_error(rescale100(test_data_char), "the vector is not numeric")
})

test_that("example1", {
  expect_equal(rescale100(c(18, 15, 16, 4, 17, 9), xmin = 0, xmax = 20), c(90, 75, 80, 20, 85, 45))
})

test_that("min smaller than max", {
  expect_error(rescale100(test_data, xmin = 10, xmax = 0), "the min is not smaller than the max")
})

test_that("example2", {
  expect_equal(rescale100(c(4, 9, 15, 16, 17, 18), xmin = 0, xmax = 20), c(20, 45, 75, 80, 85, 90))
})

# ===================================
context("drop_lowest")

test_that("not numeric", {
  expect_error(drop_lowest(test_data_char), "the vector is not numeric")
})

test_that("length", {
  expect_equal(length(drop_lowest(test_data)), 3)
})

test_that("lowest for test_data", {
  expect_equal(drop_lowest(test_data), c(4, 7, 10))
})

test_that("lowest for test_data_NA", {
  expect_error(drop_lowest(test_data_NA), "NA exists")
})

# =================================
context("score_homework")

test_that("not numeric", {
  expect_error(score_homework(test_data_char), "the vector is not numeric")
})

test_that("with drop", {
  expect_equal(score_homework(test_data, drop = TRUE), 7)
})

test_that("without drop", {
  expect_equal(score_homework(test_data, drop = FALSE), 5.5)
})

test_that("with NA", {
  expect_error(score_homework(test_data_NA), "NA exists")
})

# ===================================
context("score_quiz")

test_that("not numeric", {
  expect_error(score_quiz(test_data_char), "the vector is not numeric")
})

test_that("with drop", {
  expect_equal(score_quiz(test_data, drop = TRUE), 7)
})

test_that("without drop", {
  expect_equal(score_quiz(test_data, drop = FALSE), 5.5)
})

test_that("with NA", {
  expect_error(score_quiz(test_data_NA), "NA exists")
})

# =================================
context("score_lab")

test_that("not numeric", {
  expect_error(score_lab(test_data_char), "the input is not numeric")
})

test_that("input is NA", {
  expect_error(score_lab(NA), "the input is not numeric")
})

test_that("11", {
  expect_equal(score_lab(11), 100)
})

test_that("12", {
  expect_equal(score_lab(12), 100)
})

test_that("6", {
  expect_equal(score_lab(6), 0)
})

test_that("3", {
  expect_equal(score_lab(3), 0)
})

test_that("9", {
  expect_equal(score_lab(9), 60)
})