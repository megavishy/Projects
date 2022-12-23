#read data
emission = read.csv("C:/Users/mviswa/Downloads/gt_full.csv",header=TRUE, fileEncoding="UTF-8-BOM")
head(emission,5)
plot(emission)
#exploratory analysis
#finding the correlation between the data
cor(emission)
#create scatter plots
par(mfrow=c(2,3))
for (i in c(3: 10))
{
  col_name = names(emission[i])
  plot(emission[,i], emission$CO, xlab= col_name, ylab = "CO")
}
#Fit a Poisson's regression model using CO  as the response variable with all the other variables as the predictor and Poisson as the link function.
model1 <- glm(CO~AT+AP+AH+AFDP+GTEP+TIT+TAT+TEY+CDP, data = emission)
summary(model1)
#Fit a Poisson's regression model using NOX  as the response variable with all the other variables as the predictor and Poisson as the link function.
model2 <- glm(NOX~AT+AP+AH+AFDP+GTEP+TIT+TAT+TEY+CDP, data = emission)
summary(model2)
#Using model1, finding a 90% confidence interval with all the coefficients
confint(model1, level = 0.90)
#to check if the model is significant overall
1-pchisq((model1$null.dev-model1$deviance),(model1$df.null-model1$df.residual))
#to check if the model is  significantly nonzero at the 0.01 significance level
coefficients(summary(model1))[,4]
# Test for GOF: Using deviance residuals
c(deviance(model1), 1-pchisq(deviance(model1), length(coef(model1))-1))
round(c(deviance(model1), 1-pchisq(deviance(model1), length(coef(model1))-1)),2)
# Test for GOF: Using Pearson residuals
pearson.res <- residuals(model1, type="pearson")
pearson.tvalue = sum(pearson.res^2)
c(pearson.tvalue, 1-pchisq(pearson.tvalue,length(coef(model1))-1))
round(c(pearson.tvalue, 1-pchisq(pearson.tvalue,length(coef(model1))-1)),2)
# Chi-square test
1-pchisq((model1$null.deviance-model1$deviance), 
         (model1$df.null-model1$df.residual))
# Deviance residual
1-pchisq(model1$deviance,model1$df.residual)
# Pearson residuals
1-pchisq(sum(residuals(model1, type = "pearson")^2),model1$df.residual)
#
res =resid(model1, type="deviance")
par(mfrow=c(2,2))
plot(model1)
plot (CO~,res, ylab="standard residual", main="Scatterplot of standard residual vs fitted values", col=c("blue","green"),lwd=3)
abline(h=0,col="red")
library("car")
qqPlot(res, main ="")
abline(h=0,col="red")
qqnorm(res, ylab="Std residuals")
abline(h=0,col="red")
qqline(res,col="blue",lwd=2)
hist (res,10,xlab="Std residuals",main="")

#split data into train,test and validate
row.cnt=nrow(emission)
test_emission=emission[(row.cnt-7346):row.cnt,]
train_emission=emission[1:(row.cnt-14693),]
valid_emission=emission[(row.cnt-7346):row.cnt,]

model1 <- glm(CO ~ ., data=train_emission) 
summary(model1)

#head(emission,1) 
#head(emission[,-c(10)],1) 
library(leaps)
out = leaps(emission[,-c(10)], emission$logBCF,nbest=1, method = "Cp") 
cbind(as.matrix(out$which),out$Cp)

#question 2(b)
best.model = which(out$Cp==min(out$Cp))
cbind(as.matrix(out$which), out$Cp)[best.model,]
head(trainData)
model3 <- lm(logBCF ~ nHM + piPC09 + MLOGP + ON1V + B02.C.N.+  F04.C.O., data=trainData) 
summary(model3)

#Question 3(a)
# Backward Stepwise Regression
full = glm(logBCF ~ ., data=trainData) #model1
minimum = lm(logBCF ~ 1, data=trainData)
model4 = step(full, scope=list(lower=minimum, upper=full), direction="backward")
summary(model4)

#Question 3(c)
full = glm(logBCF ~ ., data=trainData) #model1
minimum = glm(logBCF ~ nHM, data=trainData)
model5 = step(minimum, scope=list(lower=minimum, upper=full), direction="forward")
summary
library(glmnet)
x.train <- model.matrix(CO ~ ., data=train_emission)[,-1]
y.train <- train_emission$CO
lambda = seq(0, 100, by=0.25)
cv.ridge <- cv.glmnet(x.train, y.train, alpha = 0, nfolds=10)
cv.ridge$lambda.min

