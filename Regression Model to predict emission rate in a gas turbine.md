### Designed a Regression Model to predict emission rate in a gas turbine
Lack of understanding and awareness about carbon and flue gas emissions leads to a negative impact on the environment.  In this age of globalization, an important source of harmful pollutants (NOx and CO) is released into the atmosphere in the combustion process in the power industry Therefore, there is a special concern about reducing the emissions from power plants. These emissions are restricted within certain limits by rigid environmental rules in different parts of the world.

In this work, we present analytical results obtained by the Predictive Emission Monitoring System (PEMS) dataset. The data collection recorded 13 different variables from a Gas Turbine, two of which are response-NOx and CO and others are control parameters of the turbine. The objective of this study is to fit two different Multiple Linear Regression (MLR) models predicting two different response variables from the data- NOx and CO content form other 11 predictors.

The reasons for the choice of the dataset are three-fold. Firstly, it is suspected that some parameters might be collinear. For instance, Turbine Inlet temperature and Outlet temperature can be explained by already developed thermodynamic models. Detecting collinearity among variables helps in saving resources for the future design of experiments, builds a simpler model, and provides a good opportunity to apply variable selection techniques.  Secondly, the data has over 36,000 rows, which allows for a good test train split and then optimizing it using Cross-Validation. Thirdly, having two different Response variables imply that two different models need to be fit. The two models can then be compared on the basis of R-squared and visual analytics to draw insights on which response the data explains well.

InTo begin with, we compiled a  publicly available exhaust gas emission dataset, performed exploratory analysis on it. We first gave a statistical summary and correlation analysis of the variables, and then partitioned the model into train, validate and test in the  ratio of 6:2:2. We defined the train(60%)  partition with generalization procedure to avoid overfitting and regularized with Ridge, Lasso and Elastic technique to check for multicollinearity and variable selection. and determined the MSPE of the model with the validate(20%) part  under both the regressors.

Further we combined the train and validate component (80%) and ran the  similar generalization and regularization analysis on it and further tested the model with the remaining 20% to determine the MSPE value for both the regressors.

In addition to that, we also performed the goodness of fit test with deviance and Pearson residual under the generalized linear model and determined the prediction error of the model under both the regressors.

To allow comparability of the data, we compiled the ANOVA test with our initial model and the (80-20) partitioned model. Our results show that feature selection based on linear projection is identical to the initial chosen model as no variables were dismissed. The partitioned model  markedly improves prediction performance on the test set. 

 This is partly because of the data distribution (CO emission concentration is accumulated near zero, and partly because the features used to characterize the process have stronger correlations with CO. Hence to conclude, on performing this regression analysis conjectures that  all the variables are significant  and the  data has good dimensionality for variable selection and Cross-Validation and fits two different models utilizing a good application of classroom learning.
 
To conclude, the data has good dimensionality for variable selection and Cross-Validation and fits two different models utilizing a good application of classroom learning.
 


