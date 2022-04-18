# Chapter 4

## Why not linear regression
Coding variables assumes additive or subtractive relationship between categories.
This doesn't work for all categorical problems.

## Logistic Function
![](../code/ISLWork/images/2022-03-25-23-26-02.png)

## Likelihood Function
![](../code/ISLWork/images/2022-03-25-23-27-42.png)

## Softmax
Formula for logistic multinomial regression
![](images/2022-03-27-12-28-31.png)


## Bayes Theorem
![](images/2022-04-05-20-39-27.png)

## Linear Discriminant analysis
![](images/2022-04-11-22-13-48.png)

![](images/2022-04-11-22-14-56.png)

![](images/2022-04-11-22-15-07.png)

### Predictors > 1 
![](images/2022-04-11-22-22-50.png)

## Null classifier
Trivial selection of a constant classifier that provides a reasonable error rate (i.e., assume negative COVID test when percent positive is low like ~2.5%)

## Sensitivity and Specificity
sensitivity - percentage of true positives identified
specificity - percentage of true negatives identified (1 - false positive rate)

## Default Dataset
Threshold for decision boundary can be shifted through domain knowledge and tune the error rates as desired for model.
Here 0.5 threshold has low overall error rate but has poor sensitivity for defaulters.
![](images/2022-04-11-22-53-47.png)

## ROC Curve
Receiver operating curve
ROC curve shows errors for all possible thresholds.
![](images/2022-04-11-22-55-00.png)

AUC (area under the curve) - large AUC better the classifer (0.95 here)

## Terminology
![](images/2022-04-11-22-58-51.png)

### FPR and TPR
True positive rate and false positive rate

$TPR = \frac{TP}{TP + FN}$
$FPR = \frac{FP}{FP + TN}$

## Quadratic Discriminant analysis
Similar to LDA but assumes that each class has its own covariance matrix 
![](images/2022-04-11-23-11-13.png)

This can lead to a very large number of parameters based on the number of predictors which limits QDA application to large training datasets.
![](images/2022-04-11-23-12-43.png)

## Naive Bayes
Assume that that all predictors are independent, all covariances = 0.
- Eliminates any association between the predictors
- Introduces bias but reduces variance

## Poisson Regression

### Poisson Distribution
![](images/2022-04-16-12-50-18.png)
- Used to model *counts*
