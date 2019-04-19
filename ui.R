library(shiny)

breastcancer <- read.csv("~/Rstudio/SPK-Deteksi Kanker Payudara/breast-cancer-wisconsin.csv")

shinyUI(fluidPage(
  headerPanel(title="Sistem Pendeteksi Kanker Payudara"),
  sidebarLayout(
    sidebarPanel(
      ("Masukan Data Pasien"),
      textInput("namauser", "Nama pasien :", "",placeholder = "Masukan nama pasien anda"),
      textInput("Nomor_id", "Nomor id pasien : ", "",placeholder = "Masukan nomor id pasien anda"),
      numericInput("Rumpun_Tebal", "Rumpun ketebalan :", 1,
                   min = 1,max = 10),
      numericInput("Keseragaman_Ukuran_Sel", "Keseragaman Ukuran Sel :", 1,
                   min = 1,max = 10),
      numericInput("Keseragaman_Bentuk_Sel", "Keseragaman Bentuk Sel :", 1,
                   min = 1,max = 10),
      numericInput("Adhesi_Marginal", "Adhesi Marginal:", 1,
                   min = 1,max = 10),
      numericInput("Satu_Sel_Epitel_Ukuran", "Satu Sel Epitel Ukuran :", 1,
                   min = 1,max = 10),
      numericInput("Bare_Nuclei", "Bare Nuclei :", 1,
                   min = 1,max = 10),
      numericInput("Bland_Kromatin", "Bland Kromatin :", 1,
                   min = 1,max = 10),
      numericInput("Normal_Nukleolus", "Nukleolus  Normal :", 1,
                   min = 1,max = 10),
      numericInput("Mitosis", "Mitosis  :", 1,
                   min = 1,max = 10),
      actionButton("submit","Submit")
      ),
    mainPanel(
      ("Informasi Tentang Pasien"),
      p(strong("Tingkat Persentase Kanker Payudara"),
        "Sistem pendukung keputusan deteksi kanker payudara dengan menggunakan algoritma
        C 4.5 (Decision Tree) untuk mengambil 'rule' dari dataset yang sudah valid,setelah
        itu 'rule' tersebut di terapkan pada kuesioner pasien"),
      
      tabsetPanel(type="tab",
                  tabPanel("Input User",tableOutput("table")),
                  tabPanel("Decision Tree Menggunakan library Party", plotOutput(
                    outputId = "plot", 
                    height = "550px",
                    width = "750px")),
                  tabPanel("Decision Tree Menggunakan library Cpart", plotOutput(
                    outputId = "plot2", 
                    height = "550px",
                    width = "750px")),
                  tabPanel("Data", tableOutput(
                    outputId = "data"
                  ))
                 ),
      br(),br()
      )
    )
)
)
