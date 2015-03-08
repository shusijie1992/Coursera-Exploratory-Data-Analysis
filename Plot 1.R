hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
hpc <- hpc_full[hpc_full$Date == "1/2/2007" | hpc_full$Date == "2/2/2007",]
gap <- as.numeric(hpc$Global_active_power)
png(file = "plot1.png", width = 480, height = 480, bg = "white")
hist(gap, xlab = "Global Active Power(killowatts)", main = "Global Active Power", col = "red2")
dev.off()
