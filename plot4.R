initial <- read.table("hp.txt", header = T, sep = ";", na.strings="?", nrows = 100)
classes <- sapply(initial, class)
hp <- read.table("hp.txt", header = T, sep = ";", na.strings="?",colClasses = classes)
date <- as.Date(as.character(hp$Date), "%d/%m/%Y")
newhp <- cbind(hp, date)
subnewhp <- subset(subset(newhp, date >= "2007-2-1"), date<="2007-2-2")


par(mfrow=c(2,2))

ts.hp <- ts(subnewhp$Global_active_power, freq=7)
plot(ts.hp, axes = F, ann = F)
axis(1, at = c(0, 200, 400), lab = c("Thu","Fri","Sat"))
axis(2, las = 1, at = 2 * (0:3))
box()
title(ylab = "Global Active Power")

ts.vol <- ts(subnewhp$Voltage, freq = 7)
plot(ts.vol, axes = F, ann = F)
axis(1, at = c(0, 200, 400), lab = c("Thu", "Fri", "Sat"))
axis(2, las = 1, at = c(234,236, 238, 240, 242, 244, 246))
box()
title(xlab = "datetime")
title(ylab = "Voltage")

ts.sub1 <- ts(subnewhp$Sub_metering_1, freq = 7)
ts.sub2 <- ts(subnewhp$Sub_metering_2, freq = 7)
ts.sub3 <- ts(subnewhp$Sub_metering_3, freq = 7)
plot(ts.sub1, col = "black", axes = F, ann = F)
lines(ts.sub2, col = "red")
lines(ts.sub3, col = "blue")
axis(1, at = c(0, 200, 400), lab = c("Thu","Fri","Sat"))
axis(2, las =1, at = 10 * (0:3))
box()
title(ylab = "Energy sub metering")
legend(-3,0.9 ,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty = "n");


ts.rea <- ts(subnewhp$Global_reactive_power, freq = 7)
plot(ts.rea, axes = F, ann = F)
axis(1, at = c(0, 200, 400), lab = c("Thu", "Fri", "Sat"))
axis(2, las = 1, at=0.1 * (0:5) )
box()
title(xlab = "datetime")
title(ylab = "Global_reactive_power")
