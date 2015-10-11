require(datasets)

createPlot4 <- function(ds = data.table(), fileName = "plot4.png") {
  png(filename = fileName, width = 480, height = 480)
  par(mfrow = c(2, 2))
  
  with(ds, plot(ds$GlobalActivePower ~ ds$Timestamp, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
  
  with(ds, plot(ds$Voltage ~ ds$Timestamp, type = "l", ylab = "Voltage", xlab = "datetime"))
  
  with(ds, plot(ds$SubMetering1 ~ ds$Timestamp, type = "l", ylab = "Energy sub metering", xlab = ""))
  with(ds, points(ds$SubMetering2 ~ ds$Timestamp, type = "l", col = "red"))
  with(ds, points(ds$SubMetering3 ~ ds$Timestamp, type = "l", col = "blue"))
  
  legend("topright", lty = 1, col = c("black", "blue", "red"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(ds, plot(ds$GlobalReactivePower ~ ds$Timestamp, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

  dev.off()
}