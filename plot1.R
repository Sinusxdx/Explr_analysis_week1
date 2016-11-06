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
    
    x[,3] <- as.numeric(as.character(x[,3]))  #convert to numeric
    
    # We use png function to save our image
    
    png("plot1.png",  width = 480, height = 480, units = "px") 
    hist(x$Global_active_power, col = "red", 
         xlab = "Global active power (kilowatts)", 
         main = "Global active power", breaks = 16)
    dev.off()
    
    