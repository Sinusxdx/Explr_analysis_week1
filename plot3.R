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
    
    for (i in 7:9) #convert to numeric
    x[,i] <- as.numeric(as.character(x[,i]))
    end  
    
    
    
    Sys.setlocale("LC_TIME", "English") #getting weekdays in English;
                                          #otherwise they are in German
    
    # We use png function to save our image
    
    png("plot3.png",  width = 480, height = 480, units = "px") 
    plot(tt, x[,7], type = "l", ylab = "Energy sub metering", xlab = '')
     lines(tt, x[,8], type = "l", col = "red", xlab = '')
     lines(tt, x[,9], type = "l", col = "blue", xlab = '')
     legend("topright", lty = 1, col = c("black", "red", "blue"), # adds legend
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #note lty for lines
    dev.off()
    
    
    