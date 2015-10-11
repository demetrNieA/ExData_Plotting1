require(datasets)

createPlot1 <- function(ds = data.table(), fileName = "plot1.png") {
  png(filename = fileName, width = 480, height = 480)
  hist(ds$GlobalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  dev.off()
}