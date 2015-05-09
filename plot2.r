# Course Project1 EXDA plot2
# this plot2 function will plot the graph for Global_active_power in a png file named plot2 with 480 x 480 pixels
plot2 <- function(datafilename) {

##unzip file of rows 2,075,259 
file <- unzip(datafilename)

##Read File  to dataframe also lets specify the known number of rows to make memory efficient for R.
df1 <- read.csv(file, header = TRUE, sep = ";", na.strings = "?", nrows = 2075259 )

#Lets remove the huge file from the environment
rm(file)

## Strip the Dataframe for only the concerned dates
df1 <- subset(df1, (Date == "1/2/2007") | (Date == "2/2/2007"))

##lets remove any na which was converted from "?" while reading the file
df1 <- na.omit(df1)


#Lets open the png device with required pixels
png("plot2.png", width=480, height=480)

#lets make sure that the graph is aligned properly
par(mfrow = c(1,1))

#Lets plot the graph
with(df1, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Global_active_power, pch = '.:', type = "l",xlab = "", ylab = 'Global Active Power (kilowatts)'))

#close the png device
dev.off()


}


