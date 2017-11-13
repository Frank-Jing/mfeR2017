# Manipulate strings
grep() # Searches for a substring, like the Linux command of the same name.
gsub() # Replaces all matches of a substring with another string.
nchar() # Finds the length of a string.
paste()
paste0() # Assembles a string from parts.
sprintf() # Returns a character vector containing a formatted combination of text and variable values.
substr() # Extracts a substring.
strsplit() # Splits a string into substrings.

grep("Pole",c("Equator","North Pole","South Pole"))

gsub(" Pole","",c("Equator","North Pole","South Pole"))

nchar("South Pole")

paste("North","and","South","Poles")
paste("North","Pole",sep="")
# paste0 is same as sep="" (more efficient)
paste0("North","Pole") == paste("North","Pole",sep="") 

sprintf("the square of %d is %d",i,i^2)

substr("Equator",start = 3,stop = 5)

strsplit("10-05-2017",split="-")

#--------------------------------------------------------------------
## Dates

mychar <- "October 5th, 2017"
mydate <- as.Date(mychar, format = "%B %eth, %Y")
# format	A character string.
# If not specified, it will try "%Y-%m-%d" then "%Y/%m/%d" on the first non-NA element, and give an error if neither works.

### Generate Regular Sequences of Dates
## first days of years
seq(as.Date("2007/1/1"), as.Date("2010/1/1"), "years")
## by month
seq(as.Date("2000/1/1"), by = "month", length.out = 4)
## quarters
seq(as.Date("2000/1/1"), as.Date("2001/1/1"), 
    by = "quarter")

## XTS
### Construction
x <- matrix(1:4, nrow=2, ncol=2)
idx <- seq(as.Date("2016-10-27"), length=2, by="days")
x_xts <- xts(x, order.by = idx)  
x_xts

### Deconstruction
coredata(x_xts)  # Gives us a martix
index(x_xts)  # Gives us a vector of dates

### first()
first(edhec[, "Convertible Arbitrage" ], "3 months")

### intersection of date
x <- edhec["199701/02", 1]
y <- edhec["199702/03", 1]
z <- edhec["199703/04", 1]
x + y # only the intersection





