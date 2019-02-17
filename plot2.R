# Exploratory Data Analysis. Course project 1
# Preparation
    setwd("/Users/dsy/cousera")    # change the working directory(Mac)
    data.hpc <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
    data.hpc$Date <- as.Date(data.hpc$Date, format = "%d/%m/%Y")
    subsetdata.hpc <- subset(data.hpc,Date == "2007-02-01" | Date =="2007-02-02")

# Plot2 &. plot2.png
    subsetdata.hpc$datetime <- strptime(paste(subsetdata.hpc$Date,subsetdata.hpc$Time),
                               "%Y-%m-%d %H:%M:%S")
    subsetdata.hpc$datetime <- as.POSIXct(subsetdata.hpc$datetime)
    plot(subsetdata.hpc$Global_active_power ~ subsetdata.hpc$datetime, type = "l",xlab = "",
         ylab = "Global Active Power (kilowatts)")
    dev.copy(png, file = "plot2.png", height = 480, width = 480)
    dev.off()
                             
    
