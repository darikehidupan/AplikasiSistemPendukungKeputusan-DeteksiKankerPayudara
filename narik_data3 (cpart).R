setwd("C:/Users/Oktavioso/Documents/Rstudio/SPK-Deteksi Kanker Payudara")
breastcancer <- read.csv("breast-cancer-wisconsin-atr.csv")
data("breastcancer", package = "mboost")
dim(breastcancer)
attributes(breastcancer)
breastcancer[1:5,]
set.seed(300)
ind <- sample(2, nrow(breastcancer), replace=TRUE, prob=c(0.8, 0.2))
breastcancer.train <- breastcancer[ind==1,]
breastcancer.test <- breastcancer[ind==2,]
library(rpart)
myFormula <- Nomor_id ~ Rumpun_Tebal + Keseragaman_Ukuran_Sel + Keseragaman_Bentuk_Sel + Adhesi_Marginal + Satu_Sel_Epitel_Ukuran + 
Bare_Nuclei + Bland_Kromatin + Normal_Nukleolus + Mitosis + Kelas
breastcancer_rpart <- rpart(myFormula, data = breastcancer.train, control = rpart.control(minsplit = 10))
attributes(breastcancer_rpart)
print(breastcancer_rpart$cptable)
print(breastcancer_rpart)
plot(breastcancer_rpart)
text(breastcancer_rpart,use.n=T)