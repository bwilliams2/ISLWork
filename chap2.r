# 7
X1 <- c(0, 2, 0, 0, -1, 1)
X2 <- c(3, 0, 1, 1, 0, 1)
X3 <- c(0, 0, 3, 2, 1, 1)
Y <- c("Red", "Red", "Red", "Green", "Green", "Red")

dis = sqrt(X1 ** 2 + X2 ** 2 + X3**2)
data.frame(dis, Y)

# b - Green, closest to 0,0,0 is Green point
# c - Red, 2 of 3 closest to 0 are Red
# d. Small, Large K values trend towards linear boundaries

# 8
library(ISLR)
View(College)
summary(College)
pairs(College[,1:10])
boxplot(College$Outstate, College$Private)

#iv
Elite <- rep("No", nrow(College))
Elite[College$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(College, Elite)
summary(college)
boxplot(college$Outstate, college$Elite)

#9
View(Auto)
summary(Auto)
quantCols <- names(Auto)[names(Auto) != "name"]
sapply(Auto[quantCols], range)

sapply(Auto[quantCols], mean)

sapply(Auto[quantCols], sd)

#d
newAuto <- Auto[-(10:85),]
sapply(newAuto[quantCols], range)

sapply(newAuto[quantCols], mean)

sapply(newAuto[quantCols], sd)
