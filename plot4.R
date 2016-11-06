data <- read.table("household_power_consumption.txt", sep = ";")
x <- data      

# In the next few lines we give the columns proper names

v <- x[1,]
 x <- data
 v <- x[1,]
 v <- as.matrix(v)
 colnames(x) <- v
x <- x[-1,]


  x[,1] <- as.Date(x[,1], format = "%d/%m/%Y") # Note that 
  # we have to specify the format, otherwise 
  # we get rubbish
  
 
  
  #Now we extract the relevant data
 
   x1 <- x[which(x$Date == "2007-02-01" ),]
   x2 <- x[which(x$Date == "2007-02-02" ),]
    x <- rbind(x1,x2)  
    
    # Now we convert the second column to the time class.
    
    t <- as.character(x[,2])
    tt <- paste(x[,1],t)
    tt <- strptime(tt, format = "%Y-%m-%d %H:%M:%S")
    
    for (i in 3:9) #convert to numeric
    x[,i] <- as.numeric(as.character(x[,i]))
    end  
    
   
    
    Sys.setlocale("LC_TIME", "English") #getting weekdays in English;
                                          #otherwise they are in German
    
    # We use png function to save our image
    
    png("plot4.png",  width = 1200, height = 1200, units = "px") 
    par(mfrow = c(2,2), oma=c(0,2,0,0), mar =c(4.5,5,2.1,2.1))
     plot(tt, x[,3], type = "l", ylab = "Global average power", xlab = '',
          cex.lab=2, lwd = 2, cex.axis = 2)
     plot(tt, x$Voltage, type = "l", ylab = "Voltage", xlab = '',
          cex.lab=2, lwd = 2, cex.axis = 2)
     plot(tt, x[,7], type = "l", ylab = "Energy sub metering", xlab = '',
          cex.lab=2, lwd = 2, cex.axis = 2)
     lines(tt, x[,8], type = "l", col = "red", xlab = '', lwd = 2)
     lines(tt, x[,9], type = "l", col = "blue", xlab = '', lwd = 2)
     legend("topright", lty = 1, col = c("black", "red", "blue"), # adds legend
            lwd = 2, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(tt, x$Global_reactive_power, type = "l", cex.lab=2,
          xlab = '', ylab = "Global_reactive_power", lwd = 2, cex.axis = 2)
      dev.off()
    
    