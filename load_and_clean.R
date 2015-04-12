load_and_clean <- function() {
        # Download and unzip the data set
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', method = 'curl', destfile = 'electric_power_consumption.zip')
        unzip('electric_power_consumption.zip')
        
        # Read the raw data
        data <- read.table(file = 'household_power_consumption.txt', na.strings = '?', header = T, sep = ';')
        
        # Transform Date and Time variables to Date/Time classes
        data[, 1] <- as.POSIXct(as.character(data[ ,1]), format = '%d/%m/%Y')
        data[, 2] <- as.POSIXct(as.character(data[ ,2]), format = '%H:%M:%S')
        
        # Subset data
        data <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
        
        # Assing data to Global Environment
        assign('data', data, envir = .GlobalEnv)
}
