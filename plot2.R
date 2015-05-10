initial <- read.table("hp.txt", header = T, sep = ";", na.strings="?", nrows = 100)
classes <- sapply(initial, class)
hp <- read.table("hp.txt", header = T, sep = ";", na.strings="?",colClasses = classes)
date <- as.Date(as.character(hp$Date), "%d/%m/%Y")
newhp <- cbind(hp, date)
subnewhp <- subset(subset(newhp, date >= "2007-2-1"), date<="2007-2-2")

ts.hp <- ts(subnewhp$Global_active_power, freq=7)
plot(ts.hp, axes = F, ann = F)
axis(1, at=c(0,200,400), lab=c("Thu","Fri","Sat"))
axis(2, las = 1, at=2*(0:3))
box()
title(ylab = "Global Active Power (kilowatts)")

