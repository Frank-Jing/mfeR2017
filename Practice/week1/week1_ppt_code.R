## install and library packages

## get help
help()
example(seq) # runs the examples in R

rm(x) # removes x

## 3 classes of variable types in R
x <- as.Date("2010-12-21")
class(x)

x <- "2010-12-21"
class(x)
x <- as.Date(x)
class(x)
x <- as.numeric(x)
class(x)
x # number of days since Jan 1, 1970

x <- as.integer(x) # x <- 14964L assigns an integer
class(x)


## Vectors in R
x <- seq(from = 1, to = 10, by = 2)
x

y <- rep(c(1, 2), times = 3)
y

rep(c(1,2), each = 2)

x <- c(TRUE, FALSE, TRUE, FALSE)
length(x)

x <- c() # x is NULL
1:length(x) # that could mess you up in a for loop

seq(x) # a safe way to loop through a vector

x <- c("a", "b", "c", "d")
x[1] # access the first element
## [1] "a"

x[c(1, 3)] # access elements 1 and 3
## [1] "a" "c"

x[c(TRUE, FALSE, TRUE, FALSE)] # second way
## [1] "a" "c"

x <- 5:8
x[2] <- NA
x
## [1] 5 NA 7 8

y <- NULL
length(y)
## [1] 0

### names of vector element
x <- 1:3
names(x) <- c("A","B","C")
x <- c(A=1, B=2, C=3 ) # another way
x["B"]
## B
## 2

as.vector(x) # the names are removed

# the shorter vector will be recycled
c(2, 4, 6) + c(1, 1, 1, 2, 2, 2)  # this requires that length of two vectors are dividable.
# Or it would show that "longer object length is not a multiple of shorter object length".
## [1] 3 5 7 4 6 8
# this is the same as
rep(c(2, 4, 6), 2) + c(1, 1, 1, 2, 2, 2)
## [1] 3 5 7 4 6 8


# you could use Logical vector to filter data
x <- 1:5
y <- c(TRUE,FALSE,TRUE,FALSE,TRUE)
x[y]

x <- c(5, 2, -3, 8)
idx <- x*x > 8
idx
## [1] TRUE FALSE TRUE TRUE
# another way
">"(x*x, 8)
## [1] TRUE FALSE TRUE TRUE

#### assign elements to subset
x <- 1:6
x[x <= 2] <- NA
x
## [1] NA NA 3 4 5 6

#### The 'subset' function filters and removes any NAs.
x <- c(3, 1:5, NA, 79)
x
## [1] 3 1 2 3 4 5 NA 79
x[x > 4]
## [1] 5 NA 79 
## NA > 4 result NA
subset(x, x > 4)
## [1] 5 79

### %in% usage
##### %in% returns a logical vector indicating if there is a match or not for its left operand.
1:5 %in% c(1,3)
## [1] TRUE FALSE TRUE FALSE FALSE

#### funcrions on vectors
x <- c(1:1000, NA)
mean(x)
## [1] NA
mean(x, na.rm = TRUE)
## [1] 500.5
log(x)[998:1001]
## [1] 6.905753 6.906755 6.907755 NA
## log() function has no 'na.rm" parameter inside.


## HW submission
# You will submit a list of answers.
hw <- source("./lecture1p.R")$value
str(hw)

