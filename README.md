### Designed a Regression Model to predict emission rate in a gas turbine
Lack of understanding and awareness about carbon and flue gas emissions leads to a negative impact on the environment.  In this age of globalization, an important source of harmful pollutants (NOx and CO) is released into the atmosphere in the combustion process in the power industry Therefore, there is a special concern about reducing the emissions from power plants. These emissions are restricted within certain limits by rigid environmental rules in different parts of the world.

In this work, we present analytical results obtained by the Predictive Emission Monitoring System (PEMS) dataset. The data collection recorded 13 different variables from a Gas Turbine, two of which are response-NOx and CO and others are control parameters of the turbine. The objective of this study is to fit two different Multiple Linear Regression (MLR) models predicting two different response variables from the data- NOx and CO content form other 11 predictors.

The reasons for the choice of the dataset are three-fold. Firstly, it is suspected that some parameters might be collinear. For instance, Turbine Inlet temperature and Outlet temperature can be explained by already developed thermodynamic models. Detecting collinearity among variables helps in saving resources for the future design of experiments, builds a simpler model, and provides a good opportunity to apply variable selection techniques.  Secondly, the data has over 36,000 rows, which allows for a good test train split and then optimizing it using Cross-Validation. Thirdly, having two different Response variables imply that two different models need to be fit. The two models can then be compared on the basis of R-squared and visual analytics to draw insights on which response the data explains well.

To conclude, the data has good dimensionality for variable selection and Cross-Validation and fits two different models utilizing a good application of classroom learning.
 


