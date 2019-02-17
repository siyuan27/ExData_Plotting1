# Exploratory Data Analysis. Course project 1
# Preparation
    setwd("/Users/dsy/cousera")    # change the working directory(Mac)
    data.hpc <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
    data.hpc$Date <- as.Date(data.hpc$Date, format = "%d/%m/%Y")
    subsetdata.hpc <- subset(data.hpc,Date == "2007-02-01" | Date =="2007-02-02")
    
# Plot1: Histogram &. plot1.png
    hist(subsetdata.hpc$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequncy", 
         main = "Global Active Power", col = "red")
    dev.copy(png, file = "plot1.png", height = 480, width = 480)
    dev.off()
