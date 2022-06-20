setwd("C:/Users/marie/Desktop/MSBX 5415/")
bondtrain<-read.csv("bondtrain.csv")
bondtest<-read.csv("bondtest.csv")
str(bondtrain)
bondtrain2<-read.csv("bondtrain2.csv")

str(bondtrain2)

bondtrain2$LATEST.ADMISSION.DATE<-as.Date(bondtrain2$LATEST.ADMISSION.DATE)
bondtest2$LATEST.ADMISSION.DATE<-as.Date(bondtest2$LATEST.ADMISSION.DATE)
bondtrain2$OFFENSENEW<- NA
bondtest$OFFENSENEW<- NA
## Hidden code is defining misdemeanor or felonies
{Misdemeanor<- c("HARASSMENT  2ND DEGREE                CM","OBSCENITY                             BM","RECKLESS DRIVING                       M","NEGLIGENT HOMICIDE W/ MOTOR VEHICLE   BM","UNLAWFUL DISCHARGE OF FIREARMS         M","CRIMINALLY NEGLIGENT HOMICIDE         AM","FALSE STATEMENT  2ND DEGREE           AM","VIO MOTOR VEH RACING REQS             BM","CONTEMPT OF COURT                      M","CRIMINAL MISCHIEF  FOURTH DEGREE      CM","CUSTODIAL INTERFERENCE  2ND DEGREE    AM","DRINKING WHILE OPERATING MOTOR VEHICL CM","FRAUDULENT USE OF ATM                 CM","OPERATE UNDER INFLU OF LIQ OR DRUGS    M","ILLEGAL GAIN FROM CREDIT CARD         AM","CRIMINAL VIOL. PROTECTION ORDER       AM","WILLFUL INJURY TO PROPERTY             M","CRIMINAL POSS BODY ARMOR              AM","ADULTERY                              AM","PISTOL AND REVOLVER PERMITS            M","USE OF HIGHWAY BY PEDESTRIAN           M","FALSE STATEMENT TO PROCURE CREDT CARD AM","FAILURE TO CARRY MIN INSURANCE         M","SPEEDING                               M","DISPERSION OF RIOTOUS ASSEMBLY         M","OUI MV W/CHILD PSNGR                  AM","PRACTICE OF LAW BY NON-ATTORNEYS       M","UNLAWFUL ASSEMBLY                     BM","SOLIC OR ACCPT BENEFIT FOR RIGGING    AM","REFUSAL TO DISPERSE                    M","TRAVELING UNREASONABLY FAST            M","DIVERT FR STATE BENE LBR EMPLOYEES    AM","FORGERY OF SYMBOLS                    AM","UNLAWFUL RESTRAINT  SECOND DEGREE     AM","FAILURE TO PAY OR PLEAD                M","OPERATING UNDER SUSPENDED LIC OR REG.  M","VIOLATE COND OF RELEASE-2ND DEG       AM","STALKING  2ND DEGREE                  AM","CRIMINAL IMPERSONATION                BM","INTERFERING WITH AN EMERGENCY CALL    AM","FALSELY REPORTING AN INCIDENT 2ND     AM","ILL OP MV WO IGNITION DEVICE          CM","IMPROPER USE OF MARKER  LICENSE  REG   M","EVADING RESPONSIBILITY                 M","CRIMINAL MISCHIEF  SECOND DEGREE      AM","COUNTERFEITING MARKER PLATES           M","FALSE ENTRY BY OFFICER OR PUB AGENT   AM","MISAPPLICATION OF PROPERTY            AM","CRIMINAL TROVER  2ND DEGREE           AM","LOITERING ON SCHOOL GROUNDS           CM","STALKING  3RD DEGREE                  BM","CRIMINAL TRESPASS  THIRD DEGREE       CM","INTIMIDATE DUE TO BIAS 3RD DEG        AM","FORGERY  THIRD DEGREE                 BM","FAILURE TO APPEAR  SECOND DEGREE      AM","ILLEGAL POSSES OF SHOP LIFTING DEVICE AM","ASSAULT  THIRD DEGREE                 AM","LARCENY  SIXTH DEGREE                 CM","THREATENING                           AM","CRIM VIOL RES ORDER                   AM","PROSTITUTION                          AM","INTERFERING WITH AN OFFICER           AM","CRIM VIOL OF PROTECTIVE ORDER         AM","RECKLESS ENDANGERMENT  SECOND DEGREE  BM","BREACH OF PEACE                       BM","DISORDERLY CONDUCT                    CM","CRIMINAL TRESPASS  SECOND DEGREE      BM","MANUF OR POSSESSION OF BURGLAR TOOLS  AM","ASSAULT 3RD DEGREE  VICTIM OVER 59    AM","CRIMINAL MISCHIEF  THIRD DEGREE       BM","RECKLESS ENDANGERMENT  FIRST DEGREE   AM","LARCENY  FOURTH DEGREE                AM","CRIMINAL TRESPASS  FIRST DEGREE       AM","LARCENY  FIFTH DEGREE                 BM","PUBLIC INDECENCY                      BM","SEXUAL ASSAULT  FOURTH DEGREE         AM")
Felonies<-c("ABUSE OF PERSONS-2ND DEGREE           DF","MISREP AGE TO ENTICE A MINOR          CF","CONVEY UNAUTHZD ITEMS INTO INST       DF","CRIMINAL USE OF A FIREARM             DF","INTIMIDATION BSD BIGOTRY/BIAS  1ST    CF","RAPE  SECOND DEGREE                   CF","USE OF MACHINE GUN IN A CRIME  DELETED F","FALSE RPT INCIDNT CONCER INJ OR DEATH DF","BRIBERY                               DF","TELEPHONE FRAUD  1ST DEGREE           BF","CRIMINAL MISREPRESENTATION            CF","OBSCENITY AS TO MINORS                 F","EAVESDROPPING                         DF","CUSTODIAL INTERFERENCE  FIRST DEGREE  DF","FELONY MURDER                         AF","PROMOTING PROSTITUTION  FIRST DEGREE  BF","CRIM DAMAGE PROPERTY 1ST DEG          DF","ASSAULT TERMINATING PREGNANCY         AF","PROMOTING PROSTITUTION  THIRD DEGREE  DF","MONEY LAUNDERING FIRST DEGREE         BF","INCEST                                 F","HINDER PROSECUTION DEFINED             F","THEFT OF UTILITY SERVICE FOR PROFIT   DF","INTENT TO INJURE WITH EXPLOSIVES       F","SEXUAL ASSAULT  3RD DEG W/ FIREARM    CF","INDECENT ASSAULT                       F","RAPE  FIRST DEGREE                    BF","HINDERING PROSECUTION 3RD DEG         DF","INCITING INJURY TO PERSONS OR PROPTY  CF","ASSAULT 2ND WITH MV WHILE INTOXICATED DF","AGGAVTD SEX ASSLT-VCTM < 13YR         AF","RECKLESS BURNING                      DF","IDENTITY THEFT 2ND DEGREE             CF","THREATENING 1ST DEGREE                DF","MANSLAUGHTER  SECOND DEGREE           CF","ARSON  THIRD DEGREE                   CF","ALTERING OR REMOVING IDENT NUMBER      F","HARASSMENT 1ST DEGREE                 DF","BURGLARY  SECOND DEGREE WITH FIREARM  CF","FORGERY  FIRST DEGREE                 CF","MISCONDUCT WITH A MOTOR VEHICLE       DF","MURDER                                AF","POSS WEAPON ON SCHOOL GROUNDS         DF","ESCAPE  FIRST DEGREE                  CF","POSS OF WEAPON IN A CCI               BF","POSSESS OF HALLUC OR 4+ OZ MARIJUANA   F","MANSLAUGHTER  FIRST DEGREE  FIREARM   BF","BREACH OF PEACE 1ST DEG               DF","BURGLARY  FIRST DEGREE: 53A101A(2)    BF","PROMOTING MINOR IN OBSCENE PERFORMNCE BF","ILL POSSESS CHILD PORN 2ND DEG         F","DAMAGE RAILROAD PROPERTY 1 DEG        DF","CRIMINAL TROVER  1ST DEGREE            F","POSSESSION OF SHOTGUN OR SILENCER     DF","SEX ASLT  SPOUSE/COHAB RELATIONSHIP   BF","ILL POSSESS CHILD PORN 3RD DEG        DF","PERJURY                               DF","TRAFFICKING IN PERSONS                BF","INTIMIDATION BSD BIGOTRY/BIAS         DF","IMPORTING CHILD PORNOGRAPHY            F","IL TRAFFIC IN PERSONAL ID INFO        DF","HINDER PROSECUTION  FIRST DEGREE      DF","SALE/POSS/TRAFF OF WEAPON              F","PROMOTING PROSTITUTION  SECOND DEGREE CF","MONEY LAUNDERING 2ND DEGREE           CF","EMPLOYING MINOR IN OBSCENE PERFORMNCE AF","REG PERSON WHO COMM OFF AGAINST MINOR DF","IMPERSONATION OF POLICE OFFICER       DF","BURGLARY  THIRD DEGREE WITH FIREARM   DF","MISREP OF SUB AS CONTROLLED SUB       DF","MANSLAUGHTER 2ND  W/FIREARM           CF","KIDNAPPING 2ND DEG W/ FIREARM         BF","ASSAULT  ON DOC EMPLOYEE              BF","NEGLG STORAGE OF A FIREARM            DF","FALSE RPT INCIDNT RESULT INJ OR DEATH DF","USING MACHINE GUN IN CRIME             F","ASSAULT 2ND  VICTIM 60+  WITH FIREARM DF","UNLAWFUL REPRODUCTION OF CREDIT CARD  DF","LARCENY  SECOND DEGREE                CF","ASSAULT  FIRST DEGREE                 BF","FORGERY  SECOND DEGREE                DF","CRIM VIOL ST CRIM RESTR ORDER         DF","FAILURE TO APPEAR  FIRST DEGREE       DF","KIDNAPPING  2ND DEGREE                BF","ROBBERY  FIRST DEGREE                 BF","CRIM VIOL OF PROTECTIVE ORDER         DF","INJURY OR RISK OF INJURY TO MINOR      F","ASSAULT  1ST VICTIM 60 OR OVER        BF","SALE OF NARC/AMPHET BY NON-DEPENDENT   F","CRIMINAL POSSESSION OF A PISTOL       DF","BURGLARY  FIRST DEGREE                BF")
Felonies2<-c("SEXUAL ASSAULT 1ST DEGREE-AGGRVTD      F","LARCENY  FIRST DEGREE                 BF","ARSON  FIRST DEGREE                   AF","BURGLARY  THIRD DEGREE                DF","STEALING A FIREARM                    DF","CRIMINAL MISCHIEF  FIRST DEGREE       DF","SEXUAL ASSAULT  FIRST DEGREE           F","ASSAULT ON POLICE OR FIRE OFFICER     CF","ROBBERY  THIRD DEGREE                 DF","LARCENY  THIRD DEGREE                 DF","HOME INVASION                         AF","STRANGULATION 2ND DEGREE              DF","ASSAULT  SECOND DEGREE                DF","BURGLARY  SECOND DEGREE               CF","KIDNAPPING 1ST DEG W/ FIREARM         AF","CRIMINAL POSS OF PISTOL/REVOLVER      DF","ASSAULT  SECOND DEGREE                 F","ORGANIZED RETAIL THEFT                 F","SALE OF HALLUCIGEN/NARCOTIC SUBSTANCE  F","LEAV CHILD UNSUPERV IN PUBL/MOT VEH    C","INTIMIDATING A WITNESS                CF","ROBBERY  FIRST DEGREE                BF","IDENTITY THEFT 1ST DEGREE             BF","DISSEMINATING VOYEURISTIC MATERIAL    DF","ROBBERY  SECOND DEGREE                CF","TAMPERING WITH OR FABRICATING EVIDNC  DF","CRIM VIOL CIVIL PROTECTION ORDER      DF","SEXUAL ASSAULT  SECOND DEGREE          F","FLR KEEP NARC IN ORG CONTAINER         F","COMMIT SEXUAL OFF IN ANOTHER JURIS    DF","MANSLAUGHTER  FIRST DEGREE            BF","IL POS LRG CAP MAG OBT AF 4/13        DF","VIO DEADLY WEAPON REGIST REQS         DF","UNLAWFUL RESTRAINT  FIRST DEGREE      DF","POSSESSING CHILD PORNOGRAPH            F","MANSLAUGHTER 2ND WITH MV (INTOX)      CF","ASSAULT 2ND  VICTIM 60 OR OVER        DF","SALE OF CONTROLLED SUBSTANCE           F","CARRYING WEAPON IN A MOTOR VEHICLE     F","STRANGULATION 1ST DEGREE              CF","REG PERSON WHO COMM SEX VIOL OFF      DF","MANUFACTURE OF BOMBS                  BF","TAMPERING WITH WITNESS                DF","ARSON  SECOND DEGREE                  BF","CARRYING WEAPONS WITHOUT A PERMIT      F","INJURY/RISK OF INJURY TO MINOR- SEXUAL C","STALKING  1ST DEGREE                  DF","DRUG PARAPHERNALIA IN DRUG FACTORY     F","KIDNAPPING  FIRST DEGREE              AF","SEXUAL ASSAULT  THIRD DEGREE          DF","IDENTITY THEFT 3RD DEGREE             DF","BRIBERY OF WITNESS                    DF","ASSAULT 2ND DEGREE WITH A FIREARM     DF","SELLING WEAPONS TO ALIENS PROHIBITED   F")}
#Code below used to remove commas from offense field so we can sort them
for (i in 1:length(bondtest$OFFENSE)) {
  bondtest$OFFENSE[i]<-sub(',' , ' ',bondtest$OFFENSE[i])
}
#Code below used to assign offense types to offense
for (i in 1:length(bondtest$OFFENSE)) {
  if (bondtest$OFFENSE[i] %in% Misdemeanor) 
  {bondtest$OFFENSENEW[i]<- 'M'}
  else if (bondtest$OFFENSE[i] %in% Felonies ||bondtest$OFFENSE[i] %in% Felonies2 ) {
    bondtest$OFFENSENEW[i]<- 'F'
  }
  else {bondtest$OFFENSENEW[i]<- 'Other'}
}
set.seed(210)
smp_size <- floor(0.50 * nrow(bondtest))
trainindex<-  sample(seq_len(nrow(bondtest)), size = smp_size,replace = FALSE)
bondtest<-bondtest[trainindex,]
set.seed(210)
smp_size <- floor(0.50 * nrow(bondtrain))
trainindex<-  sample(seq_len(nrow(bondtrain)), size = smp_size,replace = FALSE)
bondtrain2<-bondtrain[trainindex,]
psych:: describe(df$BOND.AMOUNT)
# Code below used for extract CSV/XLSX files
bondoffenses<-as.data.frame(unique(bondtrain$OFFENSE))
install.packages('writexl')
write.csv(bondtest, "C:/Users/marie/Downloads/bondtest.csv")


df = subset(bondtrain2, select = -c(X, BOND.BUCKET,OFFENSE,FACILITY) )
bondtest2 = subset(bondtest, select = -c(X, BOND.BUCKET,OFFENSE, FACILITY) )

boxplot(bondtrain2$BOND.AMOUNT)
unique(bondtrain2$FACILITY)
lmfitbond<- lm(BOND.AMOUNT~.+RACE *OFFENSENEW , data = df)
ms<-summary(lmfitbond)
unique(df$DETAINER)
summary(lm(BOND.AMOUNT ~.+RACE * DETAINER, data = df))

summary(lm(BOND.AMOUNT ~RACE * GENDER, data = df))
cor(df)

MSE1 <- mean(ms$residuals^2)
sqrt(MSE1)
mean((bondtest2$BOND.AMOUNT -bondtest2$pred)^2)
sqrt(mean(bondtest2$SE))
bondtest2$pred <- predict(lmfitbond, bondtest2)

ms



##SUBSETTING BY RACE

B.bonddata<- subset(bondtrain2, bondtrain2$RACE =="BLACK")
W.bonddata<- subset(bondtrain2, bondtrain2$RACE=='WHITE')
A.bonddata<- subset(bondtrain2,bondtrain2$RACE=='ASIAN')
H.bonddata<- subset(bondtrain2,bondtrain2$RACE == 'HISPANIC')

library(psych)
BF.bonddata<-subset(B.bonddata, B.bonddata$OFFENSENEW =="F")
psych::describe(BF.bonddata$BOND.AMOUNT)
BM.bonddata<-subset(B.bonddata, B.bonddata$OFFENSENEW =="M")
psych::describe(BM.bonddata$BOND.AMOUNT)
BO.bonddata<-subset(B.bonddata, B.bonddata$OFFENSENEW =="Other")
psych::describe(BO.bonddata$BOND.AMOUNT)

hist(BM.bonddata$BOND.AMOUNT)

WF.bonddata<-subset(W.bonddata, W.bonddata$OFFENSENEW =="F")
psych:: describe(WF.bonddata$BOND.AMOUNT)
WM.bonddata<-subset(W.bonddata, W.bonddata$OFFENSENEW =="M")
psych::describe(WM.bonddata$BOND.AMOUNT)
WO.bonddata<-subset(W.bonddata, W.bonddata$OFFENSENEW =="Other")
psych::describe(WO.bonddata$BOND.AMOUNT)
hist(WM.bonddata$BOND.AMOUNT)

HF.bonddata<-subset(H.bonddata, H.bonddata$OFFENSENEW =="F")
psych:: describe(HF.bonddata$BOND.AMOUNT)
HM.bonddata<-subset(H.bonddata, H.bonddata$OFFENSENEW =="M")
psych::describe(HM.bonddata$BOND.AMOUNT)
HO.bonddata<-subset(H.bonddata, H.bonddata$OFFENSENEW =="Other")
psych::describe(HO.bonddata$BOND.AMOUNT)

AF.bonddata<-subset(A.bonddata, A.bonddata$OFFENSENEW =="F")
psych:: describe(AF.bonddata$BOND.AMOUNT)
AM.bonddata<-subset(A.bonddata, A.bonddata$OFFENSENEW =="M")
psych::describe(AM.bonddata$BOND.AMOUNT)
AO.bonddata<-subset(A.bonddata, A.bonddata$OFFENSENEW =="Other")
psych::describe(AO.bonddata$BOND.AMOUNT)


table(H.bonddata$DETAINER)
table(B.bonddata$DETAINER)
table(W.bonddata$DETAINER)
table(A.bonddata$DETAINER)

table(H.bonddata$OFFENSENEW)
table(B.bonddata$OFFENSENEW)
table(W.bonddata$OFFENSENEW)
table(A.bonddata$OFFENSENEW)

mean(B.bonddata$BOND.AMOUNT)
mean(W.bonddata$BOND.AMOUNT)
mean(H.bonddata$BOND.AMOUNT)
mean(A.bonddata$BOND.AMOUNT)



summary(lm(BOND.AMOUNT~+OFFENSENEW,data = B.bonddata))

summary(lm(BOND.AMOUNT~+OFFENSENEW,data= W.bonddata))

summary(lm(BOND.AMOUNT~+OFFENSENEW,data= H.bonddata))

summary(lm(BOND.AMOUNT~+OFFENSENEW,data= A.bonddata))
