library(ISLR2)
View(Hitters)
names(Hitters)

Hitters <- na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

library(leaps)
regfit.full <- regsubsets(Salary ~ ., Hitters)
summary(regfit.full)

regfit.full <- regsubsets(Salary ~ ., data = Hitters, nvmax=19)
reg.summary <- summary(regfit.full)

names(reg.summary)

reg.summary$rsq

par(mfrow = c(2, 2))
plot(reg.summary$rss, xlab="Number of Variables", ylab="RSS", type="l")
plot(reg.summary$adjr2, xlab="Number of Variables", ylab="Adjusted RSq", type="l")

which.max(reg.summary$adjr2)
points(11, reg.summary$adjr2[11], col="red", cex=2, pch=20)

plot(reg.summary$cp, xlab="Number of Variables", ylab = "Cp", type="l")
which.min(reg.summary$cp)
points(10, reg.summary$cp[10], col="red", cex=2, pch=20)

which.min(reg.summary$bic)
plot(reg.summary$bic, xlab="Number of Variables", ylab="BIC", type="l")
points(6, reg.summary$bic[6], col="red", cex=2, pch=20)

plot(regfit.full, scale="r2")
plot(regfit.full, scale="adjr2")

coef(regfit.full, 6)

# forward and backward stepwise

regfit.fwd <- regsubsets(Salary ~ ., data=Hitters, nvmax=19, method="forward")
summary(regfit.fwd)

regfit.bwd <- regsubsets(Salary ~ ., data=Hitters, nvmax=19, method="backward")

coef(regfit.full, 7)
coef(regfit.fwd, 7)
coef(regfit.bwd, 7)

# Validation-Set
set.seed(1)
train <- sample(c(TRUE, FALSE), nrow(Hitters), replace=TRUE)
test <- (!train)
sum(test)
length(train)

regfit.best <- regsubsets(Salary ~ ., data=Hitters[train,], nvmax=19)
test.mat <- model.matrix(Salary ~ ., data=Hitters[test, ])

val.errors <- rep(NA, 19)
for (i in 1:19) {
    coefi <- coef(regfit.best, id=i)
    pred <- test.mat[, names(coefi)] %*% coefi
    val.errors[i] <- mean((Hitters$Salary[test] - pred)^2)
}

predict.regsubsets <- function(object, newdata, id, ...) {
    form <- as.formula(object$call[[2]])
    mat <- model.matrix(form, newdata)
    coefi <- coef(object, id=id)
    xvars <- names(coefi)
    mat[, xvars] %*% coefi
}

regfit.best <- regsubsets(Salary ~ ., data=Hitters, nvmax=19)
coef(regfit.best, 7)

k <- 10
n <- nrow(Hitters)
set.seed(1)
folds <- sample(rep(1:k, length=n))
cv.errors <- matrix(NA, k, 19, dimnames=list(NULL, paste(1:19)))

for (j in 1:k) {
    best.fit <- regsubsets(Salary ~ ., data=Hitters[folds != j, ], nvmax=19)
    for (i in 1:19) {
        pred <- predict(best.fit, Hitters[folds == j, ], id=i)
        cv.errors[j, i] <- mean((Hitters$Salary[folds == j] - pred) ^ 2)
    }
}
cv.errors

mean.cv.errors <- apply(cv.errors, 2, mean)
mean.cv.errors
 par(mfrow = c(1,1))
plot(mean.cv.errors, type="b")

reg.best <- regsubsets(Salary ~ ., data=Hitters, nvmax=19)
coef(reg.best, 10)

# Ridge regression
x <- model.matrix(Salary ~ ., Hitters)[, -1]
y <- Hitters$Salary
library(glmnet)
grid <- 10^seq(10, -2, length=100)
ridge.mod <- glmnet(x, y, alpha=0, lambda=grid)

dim(coef(ridge.mod))
ridge.mod$lambda[50]
coef(ridge.mod)[, 50]
sqrt(sum(coef(ridge.mod)[-1, 50]^2))

ridge.mod$lambda[60]
coef(ridge.mod)[, 60]
sqrt(sum(coef(ridge.mod)[-1, 60]^2))

predict(ridge.mod, s=50, type="coefficients")[1:20,]

set.seed(1)
train <- sample(1:nrow(x), nrow(x)/2)
test <- (-train)
y.test <- y[test]

ridge.mod <- glmnet(x[train,], y[train], alpha=0, lambda=grid, thresh=1e-12)
ridge.pred <- predict(ridge.mod, s=4, newx=x[test, ])
mean((ridge.pred - y.test)^2)

mean((mean(y[train]) - y.test)^2)

ridge.pred <- predict(ridge.mod, s=0, newx=x[test, ], exact=T, x=x[train,], y=y[train])
mean((ridge.pred - y.test)^2)

lm(y ~ x, subset=train)
predict(ridge.mod, s=0, exact=T, type="coefficients", x=x[train,], y=y[train])[1:20,]

set.seed(1)
cv.out <- cv.glmnet(x[train,], y[train], alpha=0)
plot(cv.out)
bestlam <- cv.out$lambda.min
bestlam

ridge.pred <- predict(ridge.mod, s=bestlam, newx=x[test,])
mean((ridge.pred - y.test)^2)

out <- glmnet(x,y,alpha=0)
predict(out, type="coefficients", s=bestlam)[1:20,]

# Lasso
lasso.mod <- glmnet(x[train, ], y[train], alpha=1, lambda=grid)
print(lasso.mod)

set.seed(1)
cv.out <- cv.glmnet(x[train,], y[train], alpha=1)
plot(cv.out)

bestlam <- cv.out$lambda.min
lasso.pred <- predict(lasso.mod, s=bestlam, newx=x[test,])
mean((lasso.pred - y.test)^2)

out <- glmnet(x, y, alpha=1, lambda=grid)
lasso.coef <- predict(out, type="coefficients", s=bestlam)[1:20,]
lasso.coef


# PCR
library(pls)
set.seed(2)
pcr.fit <- pcr(Salary ~ ., data=Hitters, scale=TRUE, validation="CV")

summary(pcr.fit)
validationplot(pcr.fit, val.type="MSEP")

set.seed(1)
pcr.fit <- pcr(Salary ~ ., data=Hitters, subset=train, scale=TRUE, validation="CV")
validationplot(pcr.fit, val.type="MSEP")
pcr.pred <- predict(pcr.fit, x[test,], ncomp=5)
mean((pcr.pred - y.test)^2)

pcr.fit <- pcr(y ~ x, scale=TRUE, ncomp=5)
summary(pcr.fit)

# PLS
set.seed(1)
pls.fit <- plsr(Salary ~ ., data=Hitters, subset=train, scale=TRUE, validation="CV")
summary(pls.fit)
validationplot(pls.fit, val.type="MSEP")

pls.pred <- predict(pls.fit, x[test,], ncomp=1)
mean((pls.pred - y.test)^2)

pls.fit <- plsr(Salary ~ ., data=Hitters, scale=TRUE, ncomp=1)
summary(pls.fit)
