loaddatafile <- function(fname) {

#unzip file of rows 2,075,259 
file <- unzip(fname)

##Read File 
df1 <- read.csv(file, header = TRUE, sep = ";", na.strings = "?", nrows = 2075259 )


df1 <- subset(df1, (Date == "1/2/2007") | (Date == "2/2/2007"))
df1 <- na.omit(df1)

return(df1)
}



