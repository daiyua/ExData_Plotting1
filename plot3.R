initial <- read.table("hp.txt", header = T, sep = ";", na.strings="?", nrows = 100)
classes <- sapply(initial, class)
hp <- read.table("hp.txt", header = T, sep = ";", na.strings="?",colClasses = classes)
date <- as.Date(as.character(hp$Date), "%d/%m/%Y")
newhp <- cbind(hp, date)
subnewhp <- subset(subset(newhp, date >= "2007-2-1"), date<="2007-2-2")

ts.sub1 <- ts(subnewhp$Sub_metering_1, freq = 7)
ts.sub2 <- ts(subnewhp$Sub_metering_2, freq = 7)
ts.sub3 <- ts(subnewhp$Sub_metering_3, freq = 7)
plot(ts.sub1, col = "black", axes = F, ann = F)
lines(ts.sub2, col = "red")
lines(ts.sub3, col = "blue")
axis(1, at = c(0, 200, 400), lab = c("Thu","Fri","Sat"), font.axis=1)
axis(2, las =1, at = 10 * (0:3))
box()
title(ylab = "Energy sub metering")
legend("topright", "(x,y)" ,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, col=c("black", "red", "blue"), lwd = 2, lty=1, text.font = 2);

