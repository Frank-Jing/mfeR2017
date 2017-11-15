DT <- data.table(V1=c(1L,2L),
                 V2=LETTERS[1:3],
                 V3=round(rnorm(4),4),
                 V4=1:12)

DT[,.(V4.Sum = sum(V4)),by=V1] 

data.table(mtcars)
