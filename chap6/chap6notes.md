# Subset selection

## Best subset selection
![](images/2022-04-21-17-40-33.png)
- Increasing features causes RSS to decrease and R$^2$ to increasing so care must be taken in comparing models
- Cross validation and using test error rate for selection
![](images/2022-04-21-17-44-19.png)

## Forward stepwise selection
![](images/2022-04-21-17-48-37.png)

## Backward stepwise selection
![](images/2022-04-24-23-02-03.png)

## Model selection

### Cp
![](images/2022-04-24-23-05-11.png)

### Akaike information criterion
Simplifies to Cp for least squares

### Bayesian information criterion
![](images/2022-04-25-18-48-00.png)
- Compared to Cp, BIC penalizes large models more

### Adjusted R^2
![](images/2022-04-25-18-49-43.png)
- Adjusts R$^2$ to add penalty for unnecessary variables

# Shrinkage Methods
- Computationally feasible alternatives to best subset selection

## Ridge Regression
![](images/2022-04-25-22-45-31.png)
- Adds shrinkage penalty to least squares which forces minimization of the parameters
- Predictors should be standardized prior to fitting
![](images/2022-04-28-18-54-42.png)
- Final models include all predictors

## Lasso Regression
![](images/2022-04-30-13-48-15.png)
- Can force coefficients to zero which allows for variable selection during fitting

## Zero coefficient in Lasso
![](images/2022-04-30-14-01-20.png)

- Corners in coefficient search space of Lasso regression leads to solutions where coefficients = 0 often
- Smooth space of Ridge regression makes this solution unlikely (but possible)

# Dimension reduction Methods
- Transform variables and fit model

![](images/2022-04-30-14-21-19.png)
![](images/2022-04-30-14-22-34.png)

## Partial Least Squares
- Similar to Principal Compontent Regression (PCA + Regression), but uses response variable Y to help choose features.
    - Features are explain variance and are related to the response (rather than just variance in PCA)

![](images/2022-04-30-15-11-33.png)
![](images/2022-04-30-15-11-50.png)

# High Dimensions
- More features than observations

## Regression
- Shrinkage methods work well for high dimension data

## Model Evaluation
- SSE, p-values, R$^2$ and other traditional measures of fit should not be used in high dimensional data models