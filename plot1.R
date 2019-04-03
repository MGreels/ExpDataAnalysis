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
#build Histogram showing Global Active Power instances
#Close Graphics Device

png(filename = "plot1.png", width = 480, height = 480)
hist(powercons$Global_active_power, 
                col = "orange",
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)")
dev.off()

