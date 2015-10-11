require(datasets)

createPlot3 <- function(ds = data.table(), fileName = "plot3.png") {
  png(filename = fileName, width = 480, height = 480)
  with(ds, plot(ds$SubMetering1 ~ ds$Timestamp, type = "l", ylab = "Energy sub metering", xlab = ""))
  with(ds, points(ds$SubMetering2 ~ ds$Timestamp, type = "l", col = "red"))
  with(ds, points(ds$SubMetering3 ~ ds$Timestamp, type = "l", col = "blue"))
  
  legend("topright", lty = 1, col = c("black", "blue", "red"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}