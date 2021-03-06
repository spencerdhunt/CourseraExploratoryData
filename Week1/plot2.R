setwd("~/Documents/DataScienceCourse/Course4/Week1")

powerDF <- read.table("./data/household_power_consumption.txt",sep = ";", header = T, na.strings = "?")
# filter for data from 2007-02-01 and 2007-02-02 ("D/M/YYYY" format)
powerDF <- powerDF[powerDF$Date == "2/2/2007" | powerDF$Date == "1/2/2007",]
newDF <- powerDF
newDF$Time <- strptime(paste(powerDF$Date,powerDF$Time), format = "%d/%m/%Y %H:%M:%S")
newDF$Date <- as.Date(powerDF$Date,format = "%d/%m/%Y")


#Make second plot
png("./plots/plot2.png")
with(newDF,{
    plot(Time,Global_active_power, type = "l",
         ylab = "Global Active Power (kilowatts)",
         main = "",
         xlab = ""
         )
})
dev.off()
