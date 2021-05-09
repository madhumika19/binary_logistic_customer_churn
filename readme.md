# Binary Logistic Regression

# Objective
To identify if a customer is churned or not using binary logistic regression

# Customer Churn
`Customer churn`, also known as `customer attrition`, in its most basic form, is when a customer chooses to stop using your products or services.

With each customer who churns, there are usually early indicators that could have been uncovered with churn analysis. Looking at both operational insights (e.g. declining repeat purchases, reduced purchase amounts) as well as experience insights along the customer journey is foundational to predicting churn

# Why does Churn Happen?
You can’t make ALL of your customers happy – churn will always be a constant in a SaaS business’ life. 

Here are a few of the most common reasons why customers cancel their subscriptions:
1) Budgeting / finance issues
2) Their needs changed
3) They fail to see the value proposition of your product long term
4) Your SaaS fails to meet or exceed their expectations
5) Poor customer service or response rates
6) They switched to a competitor.

Some of these reasons are within your control, and some depend on external factors. `That’s why a 0% churn rate is impossible to attain`. However, what you can do is aim to lower your churn rate as much as possible.

# Customer Churn Rate Calculation

In the simplest form, customer churn rate is the number of customers you have lost divided by the total number of customers.  To have an estimate you can segment your customers on the basis of the frequency of their purchase

`Customer Churn Rate` = `No. of Customers lost` / `Total no. of customers (Period) x 100`

The application of this formula for one iteration is simple, however, it is more complicated when you have to calculate customer churn over multiple time periods

# Customer Churn Analysis

There are many ways to track and analyze churn:

1) `Cohort Report`: A cohort report analyzes units of your customers and their churn rate over the time. A cohort is a unit or a segment of customers who purchased from your brand in a certain time frame. A common cohort that can be used is customers who made purchases in a particular month, for example, your January 2018 cohort will be the customers who closed that month.

2)  `Churn by behavior`: In addition to analyzing churn by the cohort report, you can also analyze churn by observing the customer behavior. What this means is you need to observe a certain customer behavior pattern of using certain features or complete a certain purchase action and determine its impact on the churn

# Multicollinearity 
`Multicollinearity` occurs when independent variables in a regression model are correlated. This correlation is a problem because independent variables should be independent. If the degree of correlation between variables is high enough, it can cause problems when you fit the model and interpret the results

# Binary Logistic Regression

`Logistic regression` is the appropriate regression analysis to conduct when the dependent variable is dichotomous (binary).  Like all regression analyses, the logistic regression is a predictive analysis.  

Logistic regression is used to describe data and to explain the relationship between one dependent binary variable and one or more nominal, ordinal, interval or ratio-level independent variables. In simple words, Logistic Regression is a classification algorithm which is used when we want to predict a categorical variable (Yes/No, Pass/Fail) based on a set of independent variable(s).

In the Logistic Regression model, the log of odds of the dependent variable is modeled as a linear combination of the independent variables.

**Assumptions of (Binary) Logistic Regression**

1) Logistic regression does not assume a linear relationship between the dependent and independent variables.
Logistic regression assumes linearity of independent variables and log odds of dependent variable.
2) The independent variables need not be interval, nor normally distributed, nor linearly related, nor of equal variance within each group
3) Homoscedasticity is not required. The error terms (residuals) do not need to be normally distributed.
4) The dependent variable in logistic regression is not measured on an interval or ratio scale.
5) The dependent variable must be a dichotomous ( 2 categories) for the binary logistic regression.
6) The categories (groups) as a dependent variable must be mutually exclusive and exhaustive; a case can only be in one group and every case must be a member of one of the groups.
7) Larger samples are needed than for linear regression because maximum coefficients using a ML method are large sample estimates. A minimum of 50 cases per predictor is recommended

# Equation

P = {exp(a + b<sub>1</sub>x<sub>1</sub> + b<sub>2</sub>x<sub>2</sub> + b<sub>3</sub>x<sub>3</sub> + ...)}  /  {1 + exp(a + b<sub>1</sub>x<sub>1</sub> + b<sub>2</sub>x<sub>2</sub> + b<sub>3</sub>x<sub>3</sub> + ...)}

where：

1) P = the probability that a case is in a particular category,
2) exp = the exponential function (approx. 2.72),
3) a = the constant (or intercept) of the equation and,
4) b = the coefficient (or slope) of the predictor variables

# Hypothesis test

In logistic regression, hypotheses are of interest:
1) `The null hypothesis`: which is when all the coefficients in the regression equation take the value zero.
2) `the alternate hypothesis`: that the model currently under consideration is accurate and differs significantly from the null of zero, i.e. gives significantly better than the chance or random prediction level of the null hypothesis.

# Dataset
  
Attached in repository

# Libraries

`Rose` `caret` `car` `lmtest` `InformationValue` `gmodels` `ROCR` 

# References

1) https://www.qualtrics.com/au/experience-management/customer/customer-churn/
2) https://www.custify.com/blog/customer-churn-guide/
3) https://www.questionpro.com/blog/customer-churn/
4) https://statisticsbyjim.com/regression/multicollinearity-in-regression-analysis/
5) https://www.statisticssolutions.com/what-is-logistic-regression/
6) https://towardsdatascience.com/implementing-binary-logistic-regression-in-r-7d802a9d98fe
7) https://bookdown.org/chua/ber642_advanced_regression/binary-logistic-regression.html#the-purpose-of-binary-logistic-regression


anova

