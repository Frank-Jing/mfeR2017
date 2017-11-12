# R workshop Lab 3. Nov.9th

rm(list=ls())
## CAPM Failure Project

library(data.table)
library(xts)
library(reshape2)

### input data
data.FFfator <- fread(file.choose())
data.FFport <- fread(file.choose())

## data.tablize
data.FFfator <- data.table(data.FFfator)
data.FFport <- data.table(data.FFport)

data.FFfator <- data.FFfator[Date which(data.FFfator$Date == 201312), ]
data.FFport <- data.FFport[which(data.FFport$Date == 196301):which(data.FFport$Date == 201312), ]

#
data <- data.FFport[, MktRf := data.FFfator$MktRF, by = Date]

data.FFfator[,Date:=ymd(paste0(Date,"01"))]

N <- 25
alpha <- numeric(N)
beta <- numeric(N)
r_t <- numeric(N)




