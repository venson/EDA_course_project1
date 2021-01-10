library(dplyr)
filepath <- "household_power_consumption.txt"
household_power_all <- read.table(filepath,
                                  header = TRUE,
                                  sep = ";",
                                  na.strings = "?")
household_power_all <- mutate(household_power_all,
                              timestamp = strptime(paste(Date, Time),
                                                  "%d/%m/%Y %H:%M:%S"))
household_power <- subset(household_power_all,
                          timestamp >= strptime("2007-02-01", "%Y-%m-%d") &
                            timestamp < strptime("2007-02-03", "%Y-%m-%d"))
png(file = "plot1.png", width = 480, height = 480)
hist(household_power$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
