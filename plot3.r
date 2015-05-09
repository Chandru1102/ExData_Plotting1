## Course Project1 EXDA plot3
# This function will plot the graph for comparing 3 sub metering  in a png file named plot3 with 480 x 480 pixels
plot3 <- function(datafilename) {

#unzip file of rows 2,075,259 
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

#Draw a graph for 3 different sub metering using the subset function and then add a legend at the topright
with(df1, (plot (strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_1 ,main = "" , xlab = "" , ylab = "Energy sub metering", type ="l")))
with(subset(df1, Sub_metering_2 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_2 , type = "l", col = "red"))
with(subset(df1, Sub_metering_3 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_3 , type= "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red" ,"blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close the png device
dev.off()


}
