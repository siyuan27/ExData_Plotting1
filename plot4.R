# Exploratory Data Analysis. Course project 1
# Preparation
    setwd("/Users/dsy/cousera")    # change the working directory(Mac)
    data.hpc <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
    data.hpc$Date <- as.Date(data.hpc$Date, format = "%d/%m/%Y")
    subsetdata.hpc <- subset(data.hpc,Date == "2007-02-01" | Date =="2007-02-02")

# Plot4 &. plot4.png
    subsetdata.hpc$datetime <- strptime(paste(subsetdata.hpc$Date,subsetdata.hpc$Time),
                                    "%Y-%m-%d %H:%M:%S")
    subsetdata.hpc$datetime <- as.POSIXct(subsetdata.hpc$datetime)
    par(mfrow = c(2,2)) 
    
    #pic1
    plot(subsetdata.hpc$Global_active_power ~ subsetdata.hpc$datetime, type = "l",xlab = "",
         ylab = "Global Active Power (kilowatts)") 
    #pic2
    plot(subsetdata.hpc$Voltage ~ subsetdata.hpc$datetime, type = "l",xlab = "datetime",
         ylab = "Voltage") 
    #pic3
    plot(subsetdata.hpc$Sub_metering_1 ~ subsetdata.hpc$datetime, type = "l",xlab = "",
         ylab = "Energy sub metering")
    lines(subsetdata.hpc$Sub_metering_2 ~ subsetdata.hpc$datetime, col = "red")
    lines(subsetdata.hpc$Sub_metering_3 ~ subsetdata.hpc$datetime, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #pic4
    plot(subsetdata.hpc$Global_reactive_power ~ subsetdata.hpc$datetime, type = "l",
         xlab = "datetime",ylab = "Global Reactive Power (kilowatts)") 

    dev.copy(png, file = "plot4.png", height = 480, width = 480)
    dev.off()