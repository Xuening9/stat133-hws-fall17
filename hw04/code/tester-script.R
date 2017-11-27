# =====================================================
# Title: tester-script.R
# Description: this file runs the tests for Function.R
# =====================================================

#setting working directory
setwd("/Users/Xuening/stat133/stat133-hws-fall17/hw04/code")

# test script
library(testthat)

#source in functions to be tested
source("functions.R")

sink("../output/test-reporter.txt")
test_file("tests.R")
sink()