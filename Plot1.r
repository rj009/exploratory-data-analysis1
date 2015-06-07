
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
png(file= "plot1.png")
par(mfrow = c(1,1), mar= c(4,4,2,2))
hist(nday_file$Global_active_power, col= "red", xlab = "Global Active Power", ylab = "Frequency", main= "Global Active Power")
#rug(nday_file$Global_active_power)


dev.off()