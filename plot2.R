require(datasets)

createPlot2 <- function(ds = data.table(), fileName = "plot2.png") {
  png(filename = fileName, width = 480, height = 480)
  with(ds, plot(ds$GlobalActivePower ~ ds$Timestamp, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
  dev.off()
}