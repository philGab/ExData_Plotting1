D <- read.csv("household_power_consumption.txt", sep = ";")
D[D == "?"] <- NA
D <- D[which(D$Date %in% c("1/2/2007", "2/2/2007")),]
for(i in 3:9){
    D[, i] <- as.numeric(as.character(D[, i]))
}
D[,1] <- as.Date(D[,1],format='%d/%m/%Y')
y <- strptime(paste(D[,1], D[,2]), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", units = "px", bg = "white")
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), cex=0.9)
plot(y, D[,3], xaxt=NULL, xlab = "",
     ylab = "Global Active Power", type="n")
lines(y, D[,3], type="S")

plot(y, D[,5], xaxt=NULL, xlab = "",
     ylab = "Voltage", type="n")
lines(y, D[,5], type="S")


plot(y, D[,7], xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(y, D[,7], col = "Black", type = "S")
lines(y, D[,8], col = "Red", type = "S")
lines(y, D[,9], col = "Blue", type = "S")
legend("topright", bty = "n", lty = c(1, 1), 
       lwd = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(y, D[,4], xaxt=NULL, xlab = "datetime", 
     ylab = "Global_reactive_power", type="n")
lines(y, D[,4], type="S")
dev.off()