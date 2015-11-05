setwd("C:\\Users\\Crash_OverRide\\Documents\\Data Science\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\ExData_Plotting1")

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   stringsAsFactors = FALSE, dec=".")

data_subset <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

date_and_time <- strptime(with(data_subset,paste(Date,Time,sep=" ")),
                          format="%d/%m/%Y %H:%M:%S")

GlobalActivePower <- with(data_subset,as.numeric(Global_active_power))
Voltage <- with(data_subset,as.numeric(Voltage))
GlobalReactivePower <- with(data_subset,as.numeric(Global_reactive_power))


png("plot4.png",width=480,height=480)

par(mfcol=c(2,2), mar=c(4,4,1,1))

#plot 1
plot(date_and_time,GlobalActivePower,type="l",
     ylab="Global Active Power",
     xlab="")

#plot 2
plot(date_and_time,data_subset$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",type="l")
lines(date_and_time,data_subset$Sub_metering_2,type="l",col="red")
lines(date_and_time,data_subset$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"), cex=0.6)

#plot 3
plot(date_and_time,Voltage,
     ylab="Voltage",
     xlab="datetime",type="l")

#plot 4
plot(date_and_time,GlobalReactivePower,
     ylab="Global Reactive Power",
     xlab="datetime",type="l")

dev.off()
