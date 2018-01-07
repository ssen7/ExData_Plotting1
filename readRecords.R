library(R.utils)
readRecords <- function(pathname = "./data/household_power_consumption.txt") {
        
        ## read only the date column
        dataIndex <- readTableIndex(pathname , indexColumn = 1, colClass = "character"
                                    , sep = ";", header = TRUE, na.strings = "?" )
        
        ## subset the data to find records of the relevant dates
        for (i in length(dataIndex)) {
                rows <- which(dataIndex == "1/2/2007" | dataIndex == "2/2/2007")
                df <- readTable(pathname, rows = rows, colClasses = c("character", "character",rep("numeric", 7))
                                , sep = ";", header = TRUE, na.strings = "?")
        }
        
        df
        
}