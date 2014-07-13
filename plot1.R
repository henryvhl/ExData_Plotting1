plot1 <- function() {    
    ## Read power consumption data
    file <- "./household_power_consumption.txt"
    table <- read.csv2(file, nrows=70000, colClasses = "character")
    table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",
                   c("Date", "Global_active_power")]
    powers <- as.numeric(table$Global_active_power)
    
    ## Draw histogram
    png(file = "plot1.png")
    name <- "Global Active Power" 
    hist(powers, main=name, xlab=paste(name, "(kilowatts)"), col="red")
    dev.off()
    ## close the PNG file
            
}