setwd("C:\\Users\\Crash_OverRide\\Documents\\Data Science\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\ExData_Plotting1")

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   stringsAsFactors = FALSE, dec=".")

data_subset <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
GlobalActivePower <- with(data_subset,as.numeric(Global_active_power))

png("plot1.png",width=480,height=480)
hist(GlobalActivePower,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
