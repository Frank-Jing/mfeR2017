# Functions
`<-`(mynumber, 3)
print(mynumber)
`+`(3,4)
a <- `:`(11,20)
`[`(a,5)

myfunc <- function(x) x^2
myfunc(10)

g <- function(x, y=2, z=2) x*y*z
g(2)
g(2, 1)
g(2, 1, 1)

### %>% in magrittr
vignette("magrittr")  # introduction to magrittr

car_data %>%
{ 
  if (nrow(.) > 0)
    rbind(head(., 1), tail(., 1))
  else .
}

x <- 1:10
x %>% mean
y <- c(x, NA)
y %>% mean(na.rm=TRUE)

### %$% in magrittr
data("iris")
iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)

iris %$%
  cor(Sepal.Length, Sepal.Width)

### %<>% in magrittr
iris$Sepal.Length <- 
  iris$Sepal.Length %>%
  sqrt()
iris$Sepal.Length %<>% sqrt

## ifelse
x <- 1:10 # Creates sample data
ifelse(x<5 | x>8, x, 0)


# some optimization functions
### uniroot
f <- function(x) {
  5 - exp(x^2) - x^2
}
root <- uniroot(f, c(0, 2), tol = 10^-8)
root$root
f(root$root)

### optim
fr <- function(x) {   ## Rosenbrock Banana function
  x1 <- x[1]
  x2 <- x[2]
  100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
optim(c(-1.2,1), fr)$par
