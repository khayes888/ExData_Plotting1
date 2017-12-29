######################################## Read in file and deal with formatting  #############################
#SetWD to location of your choosing
setwd("./Coursera/Power")
require

#Read in file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "Power.zip")

#See list of files, create list of filenames
unzipped <- unzip("Power.zip", list=TRUE)
file_ls <- as.character(unzipped$Name)

#Read file in 
power <- read.table(unz("Power.zip", file_ls[1]), sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
head(power)
str(power)

#Filter to dates we're interested in
powerfilt <- subset(power, Date %in% c("2/1/2007","2/2/2007"))
str(powerfilt)

#Convert Date/Time to Date format
comb <- paste(powerfilt$Date,powerfilt$Time)
powerfilt$Datetime <- strptime(comb, format= "%m/%d/%Y %H:%M:%S")

######################################## Create Graph 1 #####################################################

hist(powerfilt$Global_active_power, col = "red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")


######################################## Copy to PNG ######################################################
dev.copy(png, "plot1.png")
dev.off()
