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
with(sampledata, plot(weekname, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#copy the plot to png file
if(!file.exists("./figure")){dir.create("./figure")}

dev.copy(png, file="./figure/plot2.png")

dev.off()