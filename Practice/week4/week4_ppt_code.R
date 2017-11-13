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

# extract parts from date
mydate <- as.Date("2017-10-05")
weekdays(mydate)
months(mydate)
quarters(mydate)

# Difference between 2 dates
time1 <- as.Date("2017-10-05")
time2 <- as.Date("2008-07-08")
time1 - time2
difftime(time1, time2, units = "weeks")
difftime(time1, time2, units = "days") # the same as time1-time2

### Generate Regular Sequences of Dates
## first days of years
seq(as.Date("2007/1/1"), as.Date("2010/1/1"), "years")
## by month
seq(as.Date("2000/1/1"), by = "month", length.out = 4)
## quarters
seq(as.Date("2000/1/1"), as.Date("2001/1/1"), by = "quarter")

## package "lubridate"
library(lubridate)
ymd("20110604") 
mdy("06-04-2011")
dmy("04/06/2011")
# above all transform the date into form "yyyy-mm-dd"

arrive <- ymd_hms("2011-06-04 12:00:25")
second(arrive)
# !! seconds(arrive) is not the same as second(arrive), instead it computes seconds from 1970-12-31
second(arrive) <- 45
arrive  # here the second converts to "45" from "25"

mydate <- ymd("20130130")
mydate + days(2)
mydate + months(5)

mydate <- ymd("20130130")
mydate + days(1:5) # return a vector of char
# "2013-01-31" "2013-02-01" "2013-02-02" "2013-02-03" "2013-02-04"

jan31 <- ymd("2013-01-31")
jan31 + months(1) # NA because Feb has no 31th
ceiling_date(jan31, "month") - days(1)  # returns 2013-01-31
# Rounding to the nearest unit or multiple of a unit are supported
floor_date(jan31, "month") + months(2) - days(1) #returns 2013-02-28

## package "XTS"
### Construction
x <- matrix(1:4, nrow=2, ncol=2)
idx <- seq(as.Date("2016-10-27"), length=2, by="days")
x_xts <- xts(x, order.by = idx)  
x_xts

### Deconstruction
coredata(x_xts)  # Gives us a martix
index(x_xts)  # Gives us a vector of dates

## extract
edhec[c(1,2), 1]
edhec[(index(edhec) <= "1997-02-28"), 1]
edhec[c("1997-01-31","1997-02-28") , 1]
# above have the same results


### first()
first(edhec[, "Convertible Arbitrage" ], "3 months")

### intersection of date
x <- edhec["199701/02", 1]
y <- edhec["199702/03", 1]
z <- edhec["199703/04", 1]
x + y # only the intersection value adding together

merge(y, index(x), fill = 0)         # replace the missmatched part by 0
#            Convertible.Arbitrage
# 1997-01-31                0.0000
# 1997-02-28                0.0123
# 1997-03-31                0.0078
x + merge(y, index(x), fill = 0)
#            Convertible.Arbitrage
# 1997-01-31                0.0119
# 1997-02-28                0.0246  <-  x+y

merge(y, index(x), fill = na.locf)   # replace the missmatched part by NA
#            Convertible.Arbitrage
# 1997-01-31                    NA
# 1997-02-28                0.0123
# 1997-03-31                0.0078

x + merge(y, index(x), fill = na.locf)
#            Convertible.Arbitrage
# 1997-01-31                    NA  <- NA + x  = NA
# 1997-02-28                0.0246







