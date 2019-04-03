####################################################3
###Example of plotting for Coursera course 4, 
###
###

library(dplyr)
library(lubridate)

##Load Data into R
powercons <- tbl_df(read.table("household_power_consumption.txt", 
                               sep = ";", 
                               header = TRUE, 
                               strip.white = TRUE,
                               stringsAsFactors = FALSE))


powercons[,3:9] <- lapply(powercons[,3:9], as.numeric)
powercons<- mutate(powercons, date_time = as.POSIXct(with(powercons, dmy(Date) + hms(Time))))
powercons <- powercons %>%
                filter(date(date_time) == mdy("02/01/2007")| date(date_time) == mdy("02/02/2007")) %>%
                select(date_time, Global_active_power:Sub_metering_3)


#Open PNG Graphics Device
# Create 4 Graphs as desribed, Global Active, Global Reacative, Voltage and Submetering by time


png(filename = "plot4.png")
par(mfrow = c(2,2))
par(mar = c(2,4,1,1))

#Plot 1 - Global Active Power by Time
plot(powercons$date_time, 
     powercons$Global_active_power, 
     type="l",
     ylab = "Global Active Power",
     xlab = "",
     cex = 0.4)

#Plot 2 - Voltage by TIme
plot(powercons$date_time, 
     powercons$Voltage, 
     type="l",
     ylab = "Voltage",
     xlab = "",
     cex = 0.4)

# Plot 3 - Energy sub Metering by Time
plot(powercons$date_time, powercons$Sub_metering_1, 
     type = "l", 
     col = "black", 
     lwd = "2", 
     ylab = "Energy sub metering", 
     xlab = "",
     cex = 0.4)
points(powercons$date_time, powercons$Sub_metering_2, 
       type = "l", 
       col = "red", 
       lwd = "2")
points(powercons$date_time, powercons$Sub_metering_3, 
       type = "l", 
       col = "blue", 
       lwd = "2")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col=c("black", "red", "blue"), 
       lty=c(1,1,1), cex = .4)

#Plot 4- Global Reactive Power by time
plot(powercons$date_time, 
     powercons$Global_reactive_power, 
     type="l",
     ylab = "Global Active Power",
     xlab = "",
     cex = 0.4)

dev.off()



