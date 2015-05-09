## Course Project1 EXDA PLOT1
# This function will plot the Histogram of Global_active_power in a png file named plot1 with 480 x 480 pixels

plot1 <- function(datafilename) {



##unzip file of rows 2,075,259 
file <- unzip(datafilename)

##Read File  to dataframe also lets specify the known number of rows to make memory efficient for R.
df1 <- read.csv(file, header = TRUE, sep = ";", na.strings = "?", nrows = 2075259 )


#remove the huge file from the environment
rm(file)

## Strip the Dataframe for only the concerned dates
df1 <- subset(df1, (Date == "1/2/2007") | (Date == "2/2/2007"))

##lets remove any na which was converted from "?" while reading the file
df1 <- na.omit(df1)


#Lets open the png device with required pixels
png("plot1.png", width=480, height=480)

#lets make sure that the graph is aligned properly
par(mfrow = c(1,1))

#call Hist function to plot the  histogram 
hist(df1$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

#close and off the device
dev.off()


}
