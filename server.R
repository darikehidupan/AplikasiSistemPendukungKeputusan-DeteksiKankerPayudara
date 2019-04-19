library(shiny)

shinyServer(
  
  function(input, output) {
    Data = reactive({
      
      
      #rulesnya
      if(input$Bare_Nuclei>2&&input$Keseragaman_Bentuk_Sel>2){
        Hasil<-"Kanker Payudara Ganas"
      }
      else if(input$Bare_Nuclei<=2&&input$Keseragaman_Ukuran_Sel>3){
        Hasil<-"Kanker Payudara Ganas"
      }
      else if(input$Bare_Nuclei>2&&input$Keseragaman_Bentuk_Sel<=2&&input$Rumpun_Tebal<=3){
        Hasil<-"Kanker Payudara Jinak"
      }
      else if(input$Bare_Nuclei>2&&input$Keseragaman_Bentuk_Sel<=2&&input$Rumpun_Tebal>3){
        Hasil<-"Kanker Payudara Jinak"
      }
      else if(input$Bare_Nuclei<=2&&input$Keseragaman_Ukuran_Sel<=3&&input$Normal_Nukleolus<=2){
        Hasil<-"Kanker Payudara Jinak"
      }
      else if(input$Bare_Nuclei<=2&&input$Keseragaman_Ukuran_Sel<=3&&input$Normal_Nukleolus>2){
        Hasil<-"Kanker Payudara Jinak"
      }
      
      
      
      
      if (input$submit > 0) {
        df <- isolate(data.frame(Nama=input$namauser,
                                 NIP=input$Nomor_id,
                                 Rumpun=input$Rumpun_Tebal,
                                 KUkr=input$Keseragaman_Ukuran_Sel,
                                 KBtk=input$Keseragaman_Bentuk_Sel,
                                 AMar=input$Adhesi_Marginal,
                                 SEUk=input$Satu_Sel_Epitel_Ukuran,
                                 BNuc=input$Bare_Nuclei,
                                 BlKr=input$Bland_Kromatin,
                                 NormNuk=input$Normal_Nukleolus,
                                 Mitosis=input$Mitosis,
                                 Hasil_Diagnosa=Hasil
                                 ))
        return(list(df=df))
        
      }
    })
    
    output$table <- renderTable({
      if (is.null(Data())) {return()}
      print(Data()$df)
    }, 'include.rownames' = TRUE
    , 'include.colnames' = TRUE
    , 'sanitize.text.function' = function(x){x}
    )
    
    
    output$sum <- renderText({
      
    })
    
    output$data <- renderTable({
    breastcancer <- read.csv("~/Rstudio/SPK-Deteksi Kanker Payudara/breast-cancer-wisconsin-atr.csv")
    })
    
    output$plot <- renderPlot({
      source("narik_data2.R")
        
    })
    
    output$plot2 <- renderPlot({
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
      
    })
    
  }
)