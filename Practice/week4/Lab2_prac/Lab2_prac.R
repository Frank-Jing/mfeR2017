#########################################################
### This file is for mfeR2017 Week4 lab2  ###############
### This project focuses on xts, data filter  ###########
#########################################################

rm(list= ls())

# library packages related
library(lubridate)
library(xts)


# import data
data.origin <- read.csv("D:/Git_Projects/mfeR2017/Practice/week4/Lab2_prac/lab2data.csv")

indx <- mdy(data.origin$Date)
data <- xts(data.origin[, -1], order.by = indx)



data <- read.csv(file = "/Users/Weixiang/Documents/Git Projects/mfeR2017/Practice/week4/Lab2_prac/lab2data.csv", 
                 stringsAsFactors = FALSE, 
                 header = TRUE)
