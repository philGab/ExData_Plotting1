D <- read.csv("household_power_consumption.txt", sep = ";")
D[D == "?"] <- NA
D <- D[which(D$Date %in% c("1/2/2007", "2/2/2007")),]
for(i in 3:9){
    D[, i] <- as.numeric(as.character(D[, i]))
}
D[,1] <- as.Date(D[,1],format='%d/%m/%Y')
y <- strptime(paste(D[,1], D[,2]), format = "%Y-%m-%d %H:%M:%S")
hist(D[,3], col = "Red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

