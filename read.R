require(data.table)

# Row number to read in one iteration
READ_COUNT = 100000

readPowerConsumption <- function(electricPowerConsumption.DataSetPath,
                                 electricPowerConsumption.filter = c("1/2/2007", "2/2/2007")) {
  datasetName <- paste(electricPowerConsumption.DataSetPath,
                       "household_power_consumption.txt",
                       sep = "")
  colnames = c("Date",
               "Time",
               "GlobalActivePower",
               "GlobalReactivePower",
               "Voltage",
               "GlobalIntensivity",
               "SubMetering1",
               "SubMetering2",
               "SubMetering3")
  
  powerConsumption <- data.table()
  currPos <- 0
  # We will iterate until we read and filter all file.
  while (TRUE) {
    message("Reading from row ", currPos)
    chunk <- read.table(
      file = datasetName,
      header = TRUE,
      sep = ";",
      skip = currPos,
      nrows = READ_COUNT,
      col.names = colnames,
      colClasses = c(rep("factor", 2), rep("character", 7)))
    filteredChunk <- chunk[chunk$Date %in% electricPowerConsumption.filter,]
    # if there is at least one row we want to extract
    if (nrow(filteredChunk) > 0) {
      powerConsumption <- rbind(powerConsumption, filteredChunk)
    }
    currPos <- currPos + READ_COUNT
    # if there is no more rows
    if (nrow(chunk) == 0) {
      # We parsing all values only here as we do not need them for filtered chunks.
      setnames(powerConsumption, colnames)
      powerConsumption[, GlobalActivePower := as.numeric(GlobalActivePower)]
      powerConsumption[, GlobalReactivePower := as.numeric(GlobalReactivePower)]
      powerConsumption[, Voltage := as.numeric(Voltage)]
      powerConsumption[, GlobalIntensivity := as.numeric(GlobalIntensivity)]
      powerConsumption[, SubMetering1 := as.numeric(SubMetering1)]
      powerConsumption[, SubMetering2 := as.numeric(SubMetering2)]
      powerConsumption[, SubMetering3 := as.numeric(SubMetering3)]
      powerConsumption[, Timestamp := as.POSIXct(strptime(paste(as.character(Date),
                                                                as.character(Time)), "%d/%m/%Y %H:%M:%S"))]
     
      return(powerConsumption)
    }
  }
}