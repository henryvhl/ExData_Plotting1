plot3 <- function() {
    ## Read power consumption data
    file <- "./household_power_consumption.txt"
    table <- read.csv2(file, nrows=70000, colClasses = "character")
    table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]
    
    date.time <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")
    sub1 <- as.numeric(table$Sub_metering_1)
    sub2 <- as.numeric(table$Sub_metering_2)
    sub3 <- as.numeric(table$Sub_metering_3) 
     
    Sys.setlocale("LC_TIME", "C")
    
    ## Open a PNG file
    png(file = "plot3.png")
    
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
    
    dev.off()
    
    Sys.setlocale("LC_TIME", lct)
}