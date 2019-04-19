library(shiny)

breastcancer <- read.csv("~/Rstudio/SPK-Deteksi Kanker Payudara/breast-cancer-wisconsin.csv")

shinyUI(fluidPage(
  headerPanel(title=h2("Sistem Pendeteksi Kanker Payudara", align="center")),
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
      radioButtons("Kelas", "Kelas :",
                   c("Jinak" = "Jinak",
                     "Ganas" = "Ganas")),
      submitButton("Result")
      ),
    mainPanel(
      ("Informasi Tentang Pasien"),
      p(strong("Tingkat Persentase Kanker Payudara"),
        " Kondisi kesehatan secara umum dapat memengaruhi tingkat kesuburan. 
        Tes kesuburan sering kali diawali dengan tes fisik secara keseluruhan. 
        Kemudian akan dilanjutkan dengan tes-tes khusus pada bagian reproduksi.."),
      
      textOutput("namauser"),
      textOutput("Nomor_id"),
      textOutput("Rumpun_Tebal"),
      textOutput("Keseragaman_Ukuran_Sel"),
      textOutput("Keseragaman_Bentuk_Sel"),
      textOutput("Adhesi_Marginal"),
      textOutput("Satu_Sel_Epitel_Ukuran"),
      textOutput("Bare_Nuclei"),
      textOutput("Bland_Kromatin"),
      textOutput("Normal_Nukleolus"),
      textOutput("Mitosis"),
      textOutput("Kelas")
    )
  )
)
)