# Residual Sum of Squares
$ RSS = e_1^2 + e_2^2 + ... + e^2 $
$ RSS = (y_1 - \hat{\Beta}_0 - \hat{\Beta}_1 x_1)^2 + ... + (y_n - \hat{\Beta}_0 - \hat{\Beta}_1 x_n)^2 $

# Residual Standard Error 
- estimation of standard deviation
$ RSE = \sqrt{RSS/(n-2)} $

# Confidence Interval
95% confidence interval definition
$ \hat{\Beta}_1 \pm 2 * SE(\hat{\Beta}_1) $

# t-statistic
Number of standard deviations away from 0
$  t = \frac{\hat{\Beta}_1 - 0}{SE(\hat{\Beta_1})} $

# p-value
Probability of observing any number equal to |t| or larger assuming $\Beta_1 = 0$
- If value is small, reject null hypothesis and declare a relationship exists between X and Y

# R^2 Statistic
Proportion of variance explained
$R^2 = \frac{TSS - RSS}{TSS} = 1 - \frac{RSS}{TSS} $
$ TSS = \sum (y_i - \bar{y})^2 $

TSS = Total sum of squares


# Correlation

$ Cor(X,Y) = \frac{ \sum (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum (x_i -\bar{x})} \sqrt{\sum (y_i - \bar{y})}} $

# F-statistic
Null hypothesis test for multi variant for p predictors
- Values much larger than 1 provide evidence to rejecting the null hypothesis

$ F = \frac{(TSS - RSS)/p}{RSS/(n - p - 1)} $

# Model selection

Forward selection
- begin with null model and add variables that provide lowest RSS

Backward selection
- start with all variables and remove the largest p-value

Mixed selection
- Start with no variables and add variables with best fit
- If any p-values rise above threshold, remove corresponding variable

# Problems in linear regression

- Non-linearity of response-predictor relatinships
- Correlation of error terms
- Non-constant variance of error terms
- Outliers
- High-leverage points
- Collinearity


