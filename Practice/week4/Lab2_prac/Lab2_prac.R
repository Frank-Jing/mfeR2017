library(data.table)
library(lubridate)
library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

data <- read.csv(file = "/Users/Weixiang/Documents/Git Projects/mfeR2017/Practice/week4/Lab2_prac/lab2data.csv", 
                 stringsAsFactors = FALSE, 
                 header = TRUE)
