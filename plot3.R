hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
hpc <- hpc_full[hpc_full$Date == "1/2/2007" | hpc_full$Date == "2/2/2007",]
sm1 <- as.numeric(as.vector(hpc$Sub_metering_1))
sm2 <- as.numeric(as.vector(hpc$Sub_metering_2))
sm3 <- as.numeric(as.vector(hpc$Sub_metering_3))
png(file="plot3.png", width = 480, height = 480, bg = "white")

plot(1:length(sm1), sm1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))

lines(sm2, col = "orangered3")
lines(sm3, col = "mediumblue")

legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","orangered3","mediumblue"))

dev.off()