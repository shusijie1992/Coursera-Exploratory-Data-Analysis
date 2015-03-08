hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
hpc <- hpc_full[hpc_full$Date == "1/2/2007" | hpc_full$Date == "2/2/2007",]

gap <- as.numeric(as.vector(hpc$Global_active_power))
grp <- as.numeric(as.vector(hpc$Global_reactive_power))
volt <- as.numeric(as.vector(hpc$Voltage))

sm1 <- as.numeric(as.vector(hpc$Sub_metering_1))
sm2 <- as.numeric(as.vector(hpc$Sub_metering_2))
sm3 <- as.numeric(as.vector(hpc$Sub_metering_3))


png(file="plot4.png", width = 480, height = 480, bg = "white")

par(mfrow = c(2,2))

# First plot

plot(1:length(gap), gap, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))

# Second plot

plot(1:length(volt), volt, type="l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))


# Third plot

plot(1:length(sm1), sm1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))

lines(sm2, col = "orangered3")
lines(sm3, col = "mediumblue")

legend("topright", lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","orangered3","mediumblue"))

# Fourth plot

plot(1:length(grp), grp, type="l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at = c(0,1441,2880), labels = c("Thu","Fri","Sat"))

dev.off()