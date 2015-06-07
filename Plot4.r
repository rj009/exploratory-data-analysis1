
setwd("C:/Users/ridhi/Desktop/Coursera/Exploratory Analysis//Project1")
getwd()
file <- read.table("household_power_consumption.txt", header= TRUE, stringsAsFactors = FALSE, comment.char= "#", na.strings = "?", sep =";")
#str(file)

## separate the two dates
file$Date <- as.Date(file$Date, "%d/%m/%Y")
str(file)
ex_date1 <- "1/2/2007"
ex_date1 <- as.Date(ex_date1,  "%d/%m/%Y")
ex_date2 <- "2/2/2007"
ex_date2 <- as.Date(ex_date2,  "%d/%m/%Y")
print(ex_date1)
print(ex_date2)
nday_file <- subset (file, file$Date== ex_date1  |file$Date == ex_date2)
#str(nday_file)
nday_file$Date <- as.character(nday_file$Date)
#str(nday_file)
nday_file$daytime <- with(nday_file, paste(Date, Time, sep = " "))
str(nday_file)
dayformat <- strptime(nday_file$daytime, format = "%Y-%m-%d %H:%M:%S")
#str(dayformat)
png(file= "plot4.png")
par(mar= c(3,3,1,1),mfrow = c(2,2))

plot(dayformat, nday_file$Global_active_power, type = "l", xlab= "", ylab= " Global Active Power")
plot(dayformat, nday_file$Voltage, type = "l", xlab= "datetime", ylab= " Voltage")
plot(dayformat, nday_file$Global_active_power, type = "n", xlab= "", ylab= " Energy Sub-metering",ylim=range(nday_file$Sub_metering_1))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch=2)
points(dayformat, nday_file$Sub_metering_1, col= "black", type= "l" )
points(dayformat, nday_file$Sub_metering_2, col= "red", type= "l" )
points(dayformat, nday_file$Sub_metering_3, col= "blue", type= "l" )
plot(dayformat, nday_file$Global_reactive_power, type = "l", xlab= "datetime", ylab= " Global Reactive Power")

dev.off()