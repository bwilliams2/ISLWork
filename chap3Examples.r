library(MASS)
library(ISLR2)
head(Boston)
?Boston

lm.fit <- lm(medv ~ lstat, data=Boston)
attach(Boston)
lm.fit <- lm(medv ~ lstat)
lm.fit
summary(lm.fit)

confint(lm.fit)

predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")

predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

plot(lstat, medv)
abline(lm.fit, lwd=3)

par(mfrow=c(2,2))
plot(lm.fit)

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))

lm.fit <- lm(medv ~ lstat + age, data=Boston)
summary(lm.fit)

lm.fit <- lm(medv ~ ., data=Boston)
summary(lm.fit)

summary(lm(medv ~ lstat * age, data=Boston))

lm.fit2 <- lm(medv ~ lstat + I(lstat ^ 2))
summary(lm.fit2)

anova(lm.fit, lm.fit2)

lm.fit5 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit5)

lm.fit6 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit6)


head(Carseats)
lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age, data=Carseats)
summary(lm.fit)

attach(Carseats)
contrasts(ShelveLoc)

LoadLibraries <- function() {
    library(ISLR2)
    library(MASS)
    print("The libraries have been loaded.")
}