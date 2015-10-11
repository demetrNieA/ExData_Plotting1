source("downloadAndUnpack.R")
source("read.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

createAllPlots <- function() {
  # to get english-named dates
  Sys.setlocale("LC_TIME", "C")
  
  downloadAndUnzip()
  ds <- readPowerConsumption(electricPowerConsumption.DataSetPath = electricPowerConsumption.DataSetPath)
  createPlot1(ds)
  createPlot2(ds)
  createPlot3(ds)
  createPlot4(ds)
}