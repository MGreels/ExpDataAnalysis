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

#Construct Graph Below here - Dataset is clean from above code

png(filename = "plot2.png")
plot(powercons$date_time, 
     powercons$Global_active_power, 
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()