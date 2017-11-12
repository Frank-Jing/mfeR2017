# This is lab1 code for MFER2017 workshop
# Task description can be found in Lab1.tex and Lab1.pdf
# This project focus on usage of function and basic R commmand

## Form Black-Scholes Price Function
BSprice <- function(r,t,k,s0,sig){
  d_1 <- (log(s0/k) + (r + .5*sig^2)*t)/(sig*sqrt(t))
  d_2 = d_1 - sig*sqrt(t)
  price <- s0*pnorm(d_1) - exp(-r*t)*k*pnorm(d_2)
  return(price)
}

## Set the constant parameter
kt <- 1
kr <- .04
ksig <- .25
kk <- 95
ks0 <- 100

## Compare the price 
library(qrmtools)
### qrmtool::Black_Scholes(t, S, r, sigma, K, T, type=c("call", "put"))
price1 <- BSprice(kr,kt,kk,ks0,ksig)
price1

price2 <- Black_Scholes(0, ks0, kr, ksig, kk, kt, type = "call")
price2

## Set a series K and T
### different K strike price
K <- 75:125
price.seq <- BSprice(kr, kt, K, ks0, ksig) 
price.seq

### different maturity T
T <-1:24/12
price.result <- sapply(T, function(x) BSprice(kr, x, K, ks0, ksig))

library(data.table)
price.result <- data.table(price.result)

### Run csv file in Lab1
data <- fread("D:/Git_Projects/mfeR2017/Practice/week2/lab/optionsdata.csv")
data_price <- data[, CallPrice := BSprice(r = r, t = T, k = K, s0 = S0, sig = sigma)]

### save csv file
write.csv(data_price, "D:/Git_Projects/mfeR2017/Practice/week2/lab/optionswithprice.csv")
