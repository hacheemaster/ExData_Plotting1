setwd("C:\\Users\\Crash_OverRide\\Documents\\Data Science\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\ExData_Plotting1")

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   stringsAsFactors = FALSE, dec=".")

data_subset <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

date_and_time <- strptime(with(data_subset,paste(Date,Time,sep=" ")),
                          format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- with(data_subset,as.numeric(Global_active_power))

png("plot2.png",width=480,height=480)
plot(date_and_time,GlobalActivePower,type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
