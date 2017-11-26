
# code for week 3
### Theme of the week
### 1. Matrix and its syntax
### 2. data.frame
### 3. tibble and its difference with data.frame

mymat <- matrix(1:10, nrow=2)
# mean across rows (can also use rowMeans() function)
apply(mymat, 1, mean)  # apply mean along rows
apply(mymat, 2, max)  # apply max along columns

mymat1 <- matrix(1:4, nrow=2)
mymat2 <- matrix(6:9, nrow=2)
mymat3 <- matrix(10:11, ncol=2)
cbind(mymat1, mymat2)
rbind(mymat1, mymat3)

### syntax in matrix

A * B	   # Element-wise multiplication
A %*% B	 # Matrix multiplication
A %o% B	 # Outer product. AB'
crossprod(A,B)
crossprod(A)	# A'B and A'A respectively.
t(A)	# Transpose
diag(x)	# Creates diagonal matrix with elements of x in the principal diagonal
diag(A)	# Returns a vector containing the elements of the principal diagonal
diag(k)	# If k is a scalar, this creates a k x k identity matrix. Go figure.
solve(A, b)	# Returns vector x in the equation b = Ax (i.e., A-1b)
solve(A)	# Inverse of A where A is a square matrix.
ginv(A)	# Moore-Penrose Generalized Inverse of A. 
ginv(A) # requires loading the MASS package.
y<-eigen(A)	# y$val are the eigenvalues of A
            # y$vec are the eigenvectors of A
y<-svd(A)	# Single value decomposition of A.
          # y$d = vector containing the singular values of A
          # y$u = matrix with columns contain the left singular vectors of A 
          # y$v = matrix with columns contain the right singular vectors of A
R <- chol(A)	# Choleski factorization of A. Returns the upper triangular factor, such that R'R = A.
y <- qr(A)	# QR decomposition of A. 
            # y$qr has an upper triangle that contains the decomposition and a lower triangle that contains information on the Q decomposition.
            # y$rank is the rank of A. 
            # y$qraux a vector which contains additional information on Q.  
            # y$pivot contains information on the pivoting strategy used.
cbind(A,B,...)	# Combine matrices(vectors) horizontally. Returns a matrix.
rbind(A,B,...)	# Combine matrices(vectors) vertically. Returns a matrix.
rowMeans(A)	# Returns vector of row means.
rowSums(A)	# Returns vector of row sums.
colMeans(A)	# Returns vector of column means.
colSums(A)	# Returns vector of column sums.

# data.frame
courses <- c("Stochastic Calculus", "Fixed Income")
examGrades <- c(92, 98)
gradeBook <- data.frame(courses, examGrades, 
                        stringsAsFactors = FALSE)
gradeBook
## choose stringsAsFactors = FALSE most of time

gradeBook[[1]]           # first way
gradeBook[["courses"]]   # second way
gradeBook$courses

# preserve the data.frame class, set drop = FALSE
gradeBook[, 2] # returns a vector
## [1] 92 98
gradeBook[, 2, drop = FALSE] # returns a data.frame
## examGrades
## 1 92
## 2 98


# subset a data.frame

set.seed(1234)
x.df <-data.frame(V1 =rnorm(4), 
                  V2 =runif(4),
                  V3 =rchisq(4,df = 2), 
                  V4 = 1:4)
x.df

## select both rows and cols
x.sub2 <- subset(x.df, 
                 V4 > 2 & V1 > 0.6,
                 select = c(V2, V3))

x.sub3 <- x.df[x.df$V4 == 2, ]
x.sub4 <- x.df[x.df$V4 %in% c(1, 4), ] #observations for which the values of variable V4 are equal to either 1 or 4.

x.sub5 <- x.df[, -c(1,3)] #remove the first and third columns

# Let's makes the second col in row 1 an NA
# complete.cases() gets rid of any rows with at least one NA value.
x.df[1,2] <- NA
x.df[complete.cases(x.df), ] # removes row 1


## merge two data.frame with same category
courses <- c("Stochastic Calculus", "Fixed Income")
midtermGrades <- c(89, 91)
gradeBook2 <- data.frame(courses, midtermGrades,
                         stringsAsFactors = FALSE)
merge(gradeBook, gradeBook2)

## add col
dat1 <- 1:4
dat2 <- rep(c("A","B"),each=2)
myframe <- data.frame(col1=dat1,col2=dat2)
myframe$col3 <- 5:8
myframe

## read csv
optdata <- read.csv(file="../week2/lab/optionsdata.csv",
                    header = T, stringsAsFactors = FALSE)


# tibble
tibble(x = 1:3, y = list(1:5, 1:10, 1:20))

tibble(x = 1:5, y = 1, z = x ^ 2 + y)

df <-data.frame(colName = 1:5, m = 2:6)df$c
## [1] 1 2 3 4 5
# [[extracts a single column as a vector.
# `$` works similarly to `[[`, but does *partial matching* on the column name.
tbl <- as_tibble(df); tbl$c
# Tibbles never do partial matching, and will throw a warning and return `NULL` if the column does not exist.
## Warning: Unknown or uninitialised column:'c'.
## NULL45 / 50
