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
