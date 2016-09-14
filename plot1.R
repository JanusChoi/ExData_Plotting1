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

hist(sampledata$Global_active_power,
     main = "Global Active Power",
     ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     breaks = 13,
     ylim = c(0, 1200),
     xlim = c(0, 6),
     xaxp = c(0, 6, 3))

#copy the plot to png file
if(!file.exists("./figure")){dir.create("./figure")}

dev.copy(png, file="./figure/plot1.png")

dev.off()