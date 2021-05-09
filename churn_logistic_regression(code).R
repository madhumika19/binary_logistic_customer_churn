data=WA_Fn.UseC_.Telco.Customer.Churn
head(data)
str(data)
dim(data)

sum(which(data$MonthlyCharges>data$TotalCharges))#inconsistencies not present

summary(data)
#11 missing values in total charges
#%missing values :
11/7043
#which is very low.hence we discard the missing values.

data1=data[-which(is.na(data$TotalCharges)),]
View(data1)
summary(data1)

par(mfrow=c(1,3))
boxplot(data1$TotalCharges,main="Total charges")

boxplot(data1$MonthlyCharges,main="Monthly charges")

boxplot(data1$tenure,main="tenure")
#no outliers detected

par(mfrow=c(1,1))
#discarding columns leading to multicollinearity
data2=data1[,c(-1,-19,-8,-21,-10,-11,-12,-13,-14,-15)]

View(data2)
str(data2)
data2$gender=as.factor(data2$gender)
data2$SeniorCitizen=as.factor(data2$SeniorCitizen)
data2$Partner=as.factor(data2$Partner)

data2$Dependents=as.factor(data2$Dependents)
data2$PhoneService=as.factor(data2$PhoneService)

data2$InternetService =as.factor(data2$InternetService )


data2$Contract  =as.factor(data2$Contract)

data2$PaperlessBilling=as.factor(data2$PaperlessBilling)
data2$PaymentMethod  =as.factor(data2$PaymentMethod)


data2$Churn_int=as.factor(data2$Churn_int)

summary(data2)

(table(data2$Churn_int))
#imbalanced clases
install.packages("ROSE")
library(ROSE)

data3=ovun.sample(Churn_int~.,data = data2,method="over")$data

table(data3$Churn_int)

library(caret)

set.seed(123)
index=createDataPartition(data3$Churn_int,p=0.7,list=FALSE)
tr=data3[index,] #Training set

te=data3[-index,] #Test Data
(table(tr$Churn_int))



model=glm(Churn_int~.,family = binomial,data=tr)

library(car)
vif(model)
#no multicolinearity

summary(model)
#gender ,partner,dependents insignificant
install.packages("lmtest")
library(lmtest)
lrtest(model)


model1=glm(Churn_int~gender+SeniorCitizen+Partner+Dependents+tenure+PhoneService+InternetService+Contract+PaperlessBilling+TotalCharges,data =tr,family = binomial)


anova(model,model1,test="LRT") #Pvalue <0.05 include paymentmethod in the model

model2=glm(Churn_int~SeniorCitizen+tenure+PhoneService+InternetService+Contract+PaperlessBilling+TotalCharges+PaymentMethod,data =tr,family = binomial)
lrtest(model2)
tr$predprob=predict(model2,tr,type = "response")
#tr$predprob=round(fitted(model1),2)

library(InformationValue)
optimalCutoff(tr$Churn_int,tr$predprob) #0.45

tr$pred=ifelse(tr$predprob<0.45,0,1)

library(gmodels)
confusionMatrix(tr$Churn_int,tr$pred)
accuracytr=(2436+3091)/(2436+3091+547+1179)
#accuracy=(2581+ 2931)/(2581+ 689+1034+ 2931)
sensitivitytr=(3091/(3091+547))
specificitytr=(2436/(2436+1179))
misclassification_ratetr=( 547+1179)/(2436+3091+547+1179)
#We are mis-identifying approx 23.79%


library(ROCR)
p=prediction(tr$predprob,tr$Churn_int)

perf=performance(p,"tpr","fpr")
plot(perf); abline(0,1)
auc=performance(p,"auc")
auc@y.values #84.16%


#Checking on test data
te$predprob=predict(model2,te,type="response")
te$pred=ifelse(te$predprob<0.45,0,1)
confusionMatrix(te$Churn_int,te$pred)

accuracy_te=(1079+1290)/(469+261+1079+1290)
sensitivity_te=(1290)/(1290+261 )
specificity_te=1079/(1079+469)
misclassification_rate_te=(261+469)/(469+261+1079+1290)

