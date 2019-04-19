breastcancer <- read.csv("~/Rstudio/SPK-Deteksi Kanker Payudara/breast-cancer-wisconsin-atr.csv")
data<-breastcancer
str(data)
data$Hasil<-factor(data$Kelas)

set.seed(300)
pd<-sample(2,nrow(data),replace=TRUE, prob = c(0.8,0.2))
train<-data[pd==1,]
validate<-data[pd==2,]
  
library(party)
tree <- ctree(Hasil~Nomor_id+Rumpun_Tebal+Keseragaman_Ukuran_Sel+Keseragaman_Bentuk_Sel+Adhesi_Marginal+
                Satu_Sel_Epitel_Ukuran+Bare_Nuclei+Bland_Kromatin+Normal_Nukleolus+Mitosis,data = train)
tree
plot(tree,type='simple')

