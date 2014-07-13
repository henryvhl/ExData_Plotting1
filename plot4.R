plot4 <- function() {
    ## Read power consumption data
    file <- "./household_power_consumption.txt"
    table <- read.csv2(file, nrows=70000, colClasses = "character")
    table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]
    
    date.time <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")
    sub1 <- as.numeric(table$Sub_metering_1)
    sub2 <- as.numeric(table$Sub_metering_2)
    sub3 <- as.numeric(table$Sub_metering_3)
    
    act.pow <- as.numeric(table$Global_active_power)
    volt <- as.numeric(table$Voltage)
    react.pow <- as.numeric(table$Global_reactive_power)
    
    Sys.setlocale("LC_TIME", "C")
    
    ## Open a PNG file
    png(file = "plot4.png")   
    par(mfrow=c(2,2))  ## all 4 positions
    
    name <- "Global Active Power" 
    plot(date.time, act.pow, main="", xlab="", ylab=name, type="n")
    lines(date.time, act.pow)
    
    name <- "Voltage"
    plot(date.time, volt, main="", xlab="datetime", ylab=name, type="n")
    lines(date.time, volt)
    
    name <- "Energy sub metering"
    plot(date.time, sub1, main="", xlab="", ylab=name, type="n")
    lines(date.time, sub1, col="black")
    lines(date.time, sub2, col="red")
    lines(date.time, sub3, col="blue")
    legend("topright", 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1,1),
           lwd=c(1,1,1),
           col = c("black","red","blue")
    )
    
    name <- "Global_reactive_power"
    plot(date.time, react.pow, main="", xlab="datetime", ylab=name, type="n")
    lines(date.time, react.pow)
    
    dev.off()
}