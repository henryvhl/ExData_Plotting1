plot2 <- function() {
    ## Read power consumption data
    file <- "./household_power_consumption.txt"
    table <- read.csv2(file, nrows=70000, colClasses = "character")
    table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",
                   c("Date", "Time", "Global_active_power")]
    powers <- as.numeric(table$Global_active_power)
    date.time <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")
    
    Sys.setlocale("LC_TIME", "C")
    
    ## Open a PNG file
    png(file = "plot2.png")
    name <- "Global Active Power (kilowatts)" 
    plot(date.time, powers, main="", xlab="", ylab=name, type="n")
    lines(date.time, powers)
    dev.off()
}