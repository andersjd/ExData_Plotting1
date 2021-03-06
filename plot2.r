## Function: plot2
##
## Description: 
##   Uses a subset of data from the "household_power_consumption" source
##   (See Readme) to product a line plot of Global Active Power against
##   Date and time. The goal is to exactly reproduce the plot defined in
##   the assignment as a 480 x 480 PNG file.
##
##   The subset covers only a 2 day period of 2007-02-01 through 2007-02-02.
##   Since the data in the source file is pre-sorted by Date, this is
##   done through simple "skip" / "nrows" logic. 
##
## Parameters: 
##    SourceDataFile     Path and name of the source file
##    ResultingFileName  Path and name of the resulting PNG File
##

plot2 <- function(SourceDataFile="./data/household_power_consumption.txt",ResultFileName="plot2.png"){

## Read and format data
##    Skip and nrows are used to select only records in the date range (source is sorted by Date/Time)
##    Column Names are read from the first line of the file
##    A combined Datetime field is added from the separate Date and Time columns

household <- read.table(SourceDataFile,sep=";",skip=66637,na.string="?",nrows=2880)
fieldnames <- read.table(SourceDataFile,sep=";",nrows=1)
colnames(household) <- as.vector(t(fieldnames))
household$datetime <- strptime(paste(household$Date,household$Time),"%d/%m/%Y %H:%M:%S")

## Open a PNG Graphic Device to save the Plot
##    Resolution is 480x480 px

png(filename=ResultFileName, width=480, height=480, units="px")

## Create line chart setting labels accordingly

with(household,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

## Close the PNG Graphic Device

dev.off()

}

## EOF


