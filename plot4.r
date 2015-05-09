## Course Project1 EXDA plot4
# This function will plot 4 graphs in a 2 x 2 format in a png file named plot1 with 480 x 480 pixels
plot4 <- function(datafilename) {

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
png("plot4.png", width=480, height=480)

#lets make sure that the graph is aligned properly. We need to plat 4 graphs so make it 2 x 2 rows/cols
par(mfrow = c(2,2), mar = c(4,4,2,1)) 

#plot the first graph for Global Active Power
with(df1, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Global_active_power, pch = '.:', type = "l",xlab = "", ylab = 'Global Active Power'))  

#Plot the 2nd graph for Voltage
with(df1, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Voltage, pch = '.:', type = "l",xlab = "datetime", ylab = 'Voltage'))

#plot the 3rd graph for the 3 sub metering and add a legend
with(df1, (plot (strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_1 ,main = "" , xlab = "" , ylab = "Energy sub metering", type ="l")))
with(subset(df1, Sub_metering_2 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_2 , type = "l", col = "red"))
with(subset(df1, Sub_metering_3 > -1), points(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Sub_metering_3 , type= "l", col = "blue"))
legend("topright", lty = 1, bty = 'n', col = c("black","red" ,"blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4th graph Global_reactive_power
with(df1, plot(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M"), Global_reactive_power, pch = '.:', type = "l",xlab = "datetime"))

#close the png device
dev.off()



}
