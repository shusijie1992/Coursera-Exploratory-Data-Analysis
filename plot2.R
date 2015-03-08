hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
hpc <- hpc_full[hpc_full$Date == "1/2/2007" | hpc_full$Date == "2/2/2007",]
gap <- as.numeric(hpc$Global_active_power)
datetime <- paste(as.Date(hpc$Date),hpc$time)
hpc$datetime <- as.POSIXct(datetime)
png(file = "plot2.png", width = 480, height = 480)
plot(1:length(gap), gap, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))
dev.off()