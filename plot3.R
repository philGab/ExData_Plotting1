D <- read.csv("household_power_consumption.txt", sep = ";")
D[D == "?"] <- NA
D <- D[which(D$Date %in% c("1/2/2007", "2/2/2007")),]
for(i in 3:9){
    D[, i] <- as.numeric(as.character(D[, i]))
}
D[,1] <- as.Date(D[,1],format='%d/%m/%Y')
y <- strptime(paste(D[,1], D[,2]), format = "%Y-%m-%d %H:%M:%S")
plot(y, D[,7], xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(y, D[,7], col = "Black", type = "S")
lines(y, D[,8], col = "Red", type = "S")
lines(y, D[,9], col = "Blue", type = "S")
legend("topright", lty = c(1, 1), 
       lwd = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()