# step 0 download the data set
# download ZIP
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data/exdata.zip")){
        download.file(fileUrl,destfile="./data/exdata.zip")
        
        # unzip to directory
        unzip(zipfile="./data/exdata.zip",exdir="./data")
}

#read data
exdata <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#filter data
sampledata <- exdata[exdata$Date=="1/2/2007" | exdata$Date=="2/2/2007",]

#romove original data
rm(exdata)

#Get the weekname
sampledata$weekname <- strptime(paste(sampledata$Date, sampledata$Time), "%d/%m/%Y %H:%M:%S")

#plotting
with(sampledata, plot(weekname, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(sampledata, points(weekname, Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red"))
with(sampledata, points(weekname, Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue"))
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       box.col = "black")

#copy the plot to png file
if(!file.exists("./figure")){dir.create("./figure")}

dev.copy(png, file="./figure/plot3.png")

dev.off()