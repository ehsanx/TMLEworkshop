# load the dataset
ObsData <- read.csv("https://hbiostat.org/data/repo/rhc.csv", header = TRUE)
saveRDS(ObsData, file = "data/rhc.RDS")
# add column for outcome Y: length of stay 
# Y = date of discharge - study admission date
# Y = date of death - study admission date if date of discharge not available
ObsData$Y <- ObsData$dschdte - ObsData$sadmdte
ObsData$Y[is.na(ObsData$Y)] <- ObsData$dthdte[is.na(ObsData$Y)] - 
  ObsData$sadmdte[is.na(ObsData$Y)]
# remove outcomes we are not examining in this example
death <- ObsData$death
ObsData <- dplyr::select(ObsData, 
                         !c(dthdte, lstctdte, dschdte, death, t3d30, dth30, surv2md1))
# remove unnecessary and problematic variables 
ObsData <- dplyr::select(ObsData, 
                         !c(sadmdte, ptid, X, adld3p, urin1, cat2))

# convert all categorical variables to factors 
factors <- c("cat1", "ca", "cardiohx", "chfhx", "dementhx", "psychhx", 
             "chrpulhx", "renalhx", "liverhx", "gibledhx", "malighx", 
             "immunhx", "transhx", "amihx", "sex", "dnr1", "ninsclas", 
             "resp", "card", "neuro", "gastr", "renal", "meta", "hema", 
             "seps", "trauma", "ortho", "race", "income")
ObsData[factors] <- lapply(ObsData[factors], as.factor)
# convert our treatment A (RHC vs. No RHC) to a binary variable
ObsData$A <- ifelse(ObsData$swang1 == "RHC", 1, 0)
ObsData <- dplyr::select(ObsData, !swang1)
# Categorize the variables to match with the original paper
ObsData$age <- cut(ObsData$age,breaks=c(-Inf, 50, 60, 70, 80, Inf),right=FALSE)
ObsData$race <- factor(ObsData$race, levels=c("white","black","other"))
ObsData$sex <- as.factor(ObsData$sex)
ObsData$sex <- relevel(ObsData$sex, ref = "Male")
ObsData$cat1 <- as.factor(ObsData$cat1)
levels(ObsData$cat1) <- c("ARF","CHF","Other","Other","Other",
                          "Other","Other","MOSF","MOSF")
ObsData$ca <- as.factor(ObsData$ca)
levels(ObsData$ca) <- c("Metastatic","None","Localized (Yes)")
ObsData$ca <- factor(ObsData$ca, levels=c("None",
                                          "Localized (Yes)","Metastatic"))
# Rename variables
names(ObsData) <- c("Disease.category", "Cancer", "Cardiovascular", 
                    "Congestive.HF", "Dementia", "Psychiatric", "Pulmonary", 
                    "Renal", "Hepatic", "GI.Bleed", "Tumor", 
                    "Immunosupperssion", "Transfer.hx", "MI", "age", "sex", 
                    "edu", "DASIndex", "APACHE.score", "Glasgow.Coma.Score", 
                    "blood.pressure", "WBC", "Heart.rate", "Respiratory.rate", 
                    "Temperature", "PaO2vs.FIO2", "Albumin", "Hematocrit", 
                    "Bilirubin", "Creatinine", "Sodium", "Potassium", "PaCo2", 
                    "PH", "Weight", "DNR.status", "Medical.insurance", 
                    "Respiratory.Diag", "Cardiovascular.Diag", 
                    "Neurological.Diag", "Gastrointestinal.Diag", "Renal.Diag",
                    "Metabolic.Diag", "Hematologic.Diag", "Sepsis.Diag", 
                    "Trauma.Diag", "Orthopedic.Diag", "race", "income", 
                    "Y", "A")
saveRDS(ObsData, file = "data/rhcAnalytic.RDS")
saveRDS(death, file = "data/rhcdeath.RDS")
