pretrial <- read.csv('C:/Users/devan/Desktop/Advanced Data Analytics/Research Project/Accused_Pre-Trial_Inmates_in_Correctional_Facilities.csv')
head(pretrial)
str(pretrial)

table(pretrial$RACE)
table(pretrial$DETAINER)
max(pretrial$AGE)
min(pretrial$AGE)
max(pretrial$BOND.AMOUNT)
min(pretrial$BOND.AMOUNT)
table(pretrial$GENDER)

#remove outliers of the bond amount
quantile(pretrial$BOND.AMOUNT)
Q1<- 35000
Q3<- 251000
IQR<- Q3-Q1
(Q1-(1.5)*IQR)
(Q3+(1.5)*IQR)
pretrial<-pretrial[pretrial$BOND.AMOUNT<=575000,]
#Normalizing bond amount 
pretrial$BOND.AMOUNT<-sqrt(pretrial$BOND.AMOUNT)
hist(pretrial$BOND.AMOUNT)
head(pretrial)
#Removed the Download date and the Identifier from the dataset as it won't be used as a predictor or an outcome
pretrial<-subset(pretrial, select = c("LATEST.ADMISSION.DATE","RACE","GENDER","AGE","BOND.AMOUNT","OFFENSE","FACILITY","DETAINER"))
pretrial[pretrial$LATEST.ADMISSION.DATE=="10/24/1980",]
#Adjusting Latest Admission date to only include data from 2018 to 2021
#converted the format from string to date
pretrial$LATEST.ADMISSION.DATE<- as.Date(pretrial$LATEST.ADMISSION.DATE, format = "%m/%d/%Y")
pretrial<-pretrial[pretrial$LATEST.ADMISSION.DATE >= "2018-01-01",]
min(pretrial$LATEST.ADMISSION.DATE)
str(pretrial)  


#created a for loop to classify if the bond amount is considered high, moderate, or low
pretrial$BOND.BUCKET <-rep(NA, nrow(pretrial))

for( i in 1:length(pretrial$BOND.BUCKET)) {
  if (pretrial$BOND.AMOUNT[i] > 606.632) {
    pretrial$BOND.BUCKET[i] <- "Very High"}
  else if ((pretrial$BOND.AMOUNT[i] > 454.974) & (pretrial$BOND.AMOUNT[i] <= 606.632)) {
    pretrial$BOND.BUCKET[i] <- "High"}
  else if ((pretrial$BOND.AMOUNT[i] > 303.316) & (pretrial$BOND.AMOUNT[i] <= 454.974)) {
    pretrial$BOND.BUCKET[i] <- "Moderate"}
  else if ((pretrial$BOND.AMOUNT[i] > 151.658) & (pretrial$BOND.AMOUNT[i] <= 454.974)) {
    pretrial$BOND.BUCKET[i] <- "low"}
  else {pretrial$BOND.BUCKET[i] <- "Very Low"}
}

table(pretrial$BOND.BUCKET)
psych :: describe(pretrial$BOND.AMOUNT)

boxplot(pretrial$BOND.AMOUNT)


set.seed(210)
head(pretrial)
table(pretrial$BOND.BUCKET)
smp_size <- floor(0.75 * nrow(pretrial))
chuTrain<-  sample(seq_len(nrow(pretrial)), size = smp_size)
# We are using 75% of the original data to train on
# The remaining 25% will be our testing
bondTrain <- pretrial[chuTrain, ]
bondTest <- pretrial[-chuTrain, ]

#exporting to csv for training and testing sets
write.csv(pretrial,"C:/Users/devan/Desktop/Advanced Data Analytics/Research Project/Bond Full Set.csv", row.names = FALSE)
write.csv(bondTrain,"C:/Users/devan/Desktop/Advanced Data Analytics/Research Project/Bond Training Set.csv", row.names = FALSE)
write.csv(bondTest,"C:/Users/devan/Desktop/Advanced Data Analytics/Research Project/Bond Testing Set.csv", row.names = FALSE)

str(bondTrain)
str(bondTest)
