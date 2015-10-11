electricPowerConsumption.URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

electricPowerConsumption.DataSetPath <- character()

# Downloads and unzips data pointed by electricPowerConsumption.URL
downloadAndUnzip <- function(dataDir = "./power_consumption") {
  dir.create(dataDir, showWarnings = FALSE)
  electricPowerConsumption.SyncTime <<- Sys.Date()
  
  electricPowerConsumption.ArchiveName <<- paste(
    dataDir,
    "/household_power_consumption_[", 
    as.character(electricPowerConsumption.SyncTime),
    "].zip",
    sep = "")
  download.file(electricPowerConsumption.URL, electricPowerConsumption.ArchiveName)
  
  electricPowerConsumption.DataSetPath <<- paste(
    dataDir,
    "/data_set[", 
    as.character(electricPowerConsumption.SyncTime),
    "]/",
    sep = "")

  unzip(electricPowerConsumption.ArchiveName, exdir = electricPowerConsumption.DataSetPath, setTimes = TRUE)
}