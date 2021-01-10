
library(dplyr)
filepath <- "household_power_consumption.txt"
household_power_all <- read.table(filepath,
                                  header = TRUE,
                                  sep = ";",
                                  na.strings = "?")
household_power_all <- mutate(household_power_all,
                              timestamp = strptime(paste(Date, Time),
                                                  "%d/%m/%Y %H:%M:%S")
                              )
household_power <- subset(household_power_all,
                          timestamp >= strptime("2007-02-01", "%Y-%m-%d") &
                            timestamp < strptime("2007-02-03", "%Y-%m-%d"))
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

with(household_power, {
    plot(timestamp, Global_active_power,
         type = "l",
         xlab = "",
        ylab = "Global Active Power")
    plot(timestamp, Voltage,
          type = "l",
          xlab = "datetime",
          ylab = "Voltage")
    plot(timestamp, Sub_metering_1,
                            type = "l",
                            ylab = "Energy sub metering",
                            xlab = ""
                           )
    lines(timestamp, Sub_metering_2, col = "red")
    lines(timestamp, Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       pch = NA,
       lty = 1,
       lwd = 1,
       bty = "n")

    plot(timestamp, Global_reactive_power,
        type = "l",
        xlab = "datetime")
    })
dev.off()
