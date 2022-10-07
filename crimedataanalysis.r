rm(list = ls())
# type ctrl + r

setwd("D:/BASoftwares/CrimeData")
mvt = read.csv("crimeData.csv")
# How many rows of data (observations) are in this dataset?
length(mvt)
length(mvt$ID)

# summary of data

str(mvt)
summary(mvt)
mvt$LocationDescription = as.factor(mvt$LocationDescription)
summary(mvt)
max(mvt$ID)
min(mvt$ID)
mean(mvt$ID)
var(mvt$ID)
sd(mvt$ID)
summary(mvt$LocationDescription)
table(mvt$LocationDescription)
s = table(mvt$LocationDescription)
s
View(s)

LocationDescription = table(mvt$LocationDescription)
View(LocationDescription)

# 20221007 date

mvt$Date = as.character(mvt$Date)
DateConvert = as.Date(strptime(mvt$Date,format = "%m/%d/%y/%H:%M"))
DateConvert = as.Date(strptime(mvt$Date, format = "%m/%d/%y %H:%M"))
# Check the summary

summary(DateConvert)

mvt$Month = months(DateConvert)
mvt$Month = as.factor(mvt$Month)

mvt$Day = format(as.Date(DateConvert,format="%Y-%m-%d"), format = "%d")
mvt$Day = as.factor(mvt$Day)

mvt$Weekday = weekdays(DateConvert)
mvt$Weekday = as.factor(mvt$Weekday)

mvt$Date = DateConvert


summary(mvt$Weekday)
summary(mvt$Day)
summary(mvt$Month)
View(mvt)
monthsdata =table(mvt$Month)
View(monthsdata)
arrestmonth = table(mvt$Arrest,mvt$Month)
View(arrestmonth)
hist(mvt$Date, breaks = 100)
boxplot(mvt$Date ~ mvt$Arrest)
table(mvt$Arrest,mvt$Year)
2152/18517
sortedlocations = sort(table(mvt$LocationDescription))
View(sortedlocations)
sortedlocations = sort(table(mvt$LocationDescription), decreasing = TRUE)
View(sortedlocations)
toplocations = c("STREET","PARKING LOT/GARAGE(NON.RESID.)")
TOP2 = subset(mvt, LocationDescription %in% toplocations)
TOP2$LocationDescription = factor(TOP2$LocationDescription)
table(TOP2$LocationDescription, TOP2$Arrest)
table(TOP2$LocationDescription, TOP2$Weekday)      
TOP2arrests = table(TOP2$LocationDescription, TOP2$Arrest)
View(TOP2arrests)
TOP2arrests = as.data.frame(table(TOP2$LocationDescription, TOP2$Arrest))
View(TOP2arrests)


# Create new analysis from the existing tables.
# Like percentage arrests per month, or percentage arrests per location
TOP2arrests = as.data.frame(table(TOP2$LocationDescription, TOP2$Arrest))
View(TOP2arrests)
TOP2arrests = as.data.frame.matrix(table(TOP2$LocationDescription, TOP2$Arrest))
View(TOP2arrests)
# Give names to your columns (compulsory)
colnames(TOP2arrests) <- c("notArrested","Arrested")
# Give names to your rows (optional)
rownames(TOP2arrests) <- c("ParkingLot","Street")
TOP2arrests$pctArrests  = TOP2arrests$Arrested/(TOP2arrests$notArrested + TOP2arrests$notArrested)
View(TOP2arrests)