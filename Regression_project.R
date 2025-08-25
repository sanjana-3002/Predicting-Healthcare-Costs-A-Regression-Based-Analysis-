'''Regression Project'''

#Loading the Dataset
library(readxl)
insurance <- read.csv("Downloads/insurance.csv")
View(insurance)
attach(insurance)

#Print the few rows of the data frame with fitted values and residuals
head(insurance)

'''Objective 1: Our objective is to predict the charges and what factors are strongly associated with the individual medical costs billed by health insurance'''
y <- insurance$charges
x1 <- insurance$age
x2 <- insurance$bmi
x3 <- ifelse(insurance$smoker=='yes',1,0)
View(x3)

model <- lm(y~x1+x2+x3, data = insurance)
summary(model) 
#The model's p-value is extremely low and is less than the level of significance which in our
#case is 0.05 in turn rejecting the null hypothesis and stating that atleast one of the
#predictors significantly explains the variation in the response variable i.e.,
#atleast one of the variables - age, smoker, bmi explains the variation in the charges
#variable.

##Statistical Significance and Interpretation of each regressor
#If we look at the individual p-values, we can see that they are extremely low and less than the 
#value of alpha, in turn rejecting the null hypothesis stating that these predictors are
#individually statistically significant. 
#Intercept - Here, we have an intercept of -11676.83 which is basically stating that this is a baseline
#value when the values for age,bmi and smoker variables are zero.
#Age - We have a coefficient value of 259.55 indicating that with each additional year of  
#age, there is an expected increase of about 259.55 units, holding bmi and smoker constant.
#BMI - We have a coefficient value of 322.62 indicating that with each one unit increase of BMI,
#there is an increase of about 322.62 units, holding age and smoker constant.
#Smoker - The coefficient value for smoker is 23823.68. This means that smokers are expected to
#nincur $23,823.68 more in charges than non-smokers. Therefore, this signifies that there is a 
#strong association between smoking and higher healthcare costs.

##THe R^2 value is 0.7475 which signifies that 75% of variation in charges is explained by 
#age, bmi and smoker variable. This shows it a strong fit for the data.
#The adjusted R^2 value being similar tp the R^2 value, it signifies that all the variables
#are adding meaningful vlue to the model and doesn't include any unnecessary variables.

#Exploring the plots
par(mfrow = c(2, 2))  # This will show all four plots in one window
plot(model)

confint(model)
