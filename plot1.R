initial <- read.table("hp.txt", header = T, sep = ";", na.strings="?", nrows = 100)
classes <- sapply(initial, class)
hp <- read.table("hp.txt", header = T, sep = ";", na.strings="?",colClasses = classes)
date <- as.Date(as.character(hp$Date), "%d/%m/%Y")
newhp <- cbind(hp, date)
subnewhp <- subset(subset(newhp, date >= "2007-2-1"), date<="2007-2-2")

hist(subnewhp$Global_active_power, col="red", axes = F, ann = F)
axis(1, at = 2*(0:3), lab = 2 * (0:3))
axis(2, at = 200*(0:6), lab = 200 * (0:6))
title(main = "Global Active Power")
title(xlab = "Global Active Power (kilowatts)")

