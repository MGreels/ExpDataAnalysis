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

#changes characters into numerics
powercons[,3:9] <- lapply(powercons[,3:9], as.numeric)
#Changes characters into Date-Time 
powercons<- mutate(powercons, date_time = as.POSIXct(with(powercons, dmy(Date) + hms(Time))))
#Sorts for 2007-02-01 and 2007-02-02 numbers
powercons <- powercons %>%
                filter(date(date_time) == mdy("02/01/2007")| date(date_time) == mdy("02/02/2007")) %>%
                select(date_time, Global_active_power:Sub_metering_3)

#Open PNG Graphics Device

png(filename = "plot3.png")
plot(powercons$date_time, powercons$Sub_metering_1, 
     type = "l", 
     col = "black", 
     lwd = "2", 
     ylab = "Energy sub metering", 
     xlab = "")
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
       lty=c(1,1,1))
dev.off()
