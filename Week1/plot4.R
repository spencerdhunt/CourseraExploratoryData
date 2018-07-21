setwd("~/Documents/DataScienceCourse/Course4/Week1")

powerDF <- read.table("./data/household_power_consumption.txt",sep = ";", header = T, na.strings = "?")
# filter for data from 2007-02-01 and 2007-02-02 ("D/M/YYYY" format)
powerDF <- powerDF[powerDF$Date == "2/2/2007" | powerDF$Date == "1/2/2007",]
newDF <- powerDF
newDF$Time <- strptime(paste(powerDF$Date,powerDF$Time), format = "%d/%m/%Y %H:%M:%S")
newDF$Date <- as.Date(powerDF$Date,format = "%d/%m/%Y")


#Make third plot
png("./plots/plot4.png")
par(mfcol = c(2,2))
with(newDF,{
    #make first plot (plot2.R)
    plot(Time,Global_active_power, type = "l",
         ylab = "Global Active Power (kilowatts)",
         main = "",
         xlab = ""
    )
    #make second plot (plot3.R)
    plot(Time,Global_active_power, type = "n",
         ylab = "Sub metering energy",
         main = "",
         xlab = "",
         ylim = c(0,38)
    )
    lines(Time,Sub_metering_1,col = "black")
    lines(Time,Sub_metering_2, col = "red")
    lines(Time,Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("black","red","blue"),
           lty = c(1,1,1))
    #make third plot 
    plot(Time, Voltage, type = "l",
         main = "", 
         xlab = "datetime",
         ylab = "Voltage")
    #make fourth plot
    plot(Time, Global_reactive_power, type = "l",
         main = "",
         xlab = "datetime",
         ylab = "Global_reactive_power"
    )
    
})
dev.off()
