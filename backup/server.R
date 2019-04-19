library(shiny)

shinyServer(
  
  function(input, output) {
    
    
    output$namauser <- renderText({
      paste("Nama pasien : ",input$namauser)
    })
    output$Nomor_id <- renderText({
      paste("Nomor id pasien :",input$Nomor_id)
    })
    output$Rumpun_Tebal <- renderText({
      paste("Rumpun ketebalan pasien : ",input$Rumpun_Tebal)
    })
    output$Keseragaman_Ukuran_Sel <- renderText({
      paste("Keseragaman Ukuran Sel : ",input$Keseragaman_Ukuran_Sel)
    })
    output$Keseragaman_Bentuk_Sel <- renderText({
      paste("Keseragaman Bentuk Sel : ",input$Keseragaman_Bentuk_Sel)
    })
    output$Adhesi_Marginal <- renderText({
      paste("Adhesi Marginal : ",input$Adhesi_Marginal)
    })
    output$Satu_Sel_Epitel_Ukuran<- renderText({
      paste("Satu Sel Epitel Ukuran ",input$Satu_Sel_Epitel_Ukuran)
    })
    output$Bare_Nuclei <- renderText({
      paste("Bare Nuclei : ",input$Bare_Nuclei)
    })
    output$Bland_Kromatin<- renderText({
      paste("Bland_Kromatin : ",input$Bland_Kromatin)
    })
    output$Normal_Nukleolus <- renderText({
      paste("Normal Nukleolus : ",input$Normal_Nukleolus)
    })
    output$Mitosis <- renderText({
      paste("Mitosis : ",input$Mitosis)
    })
    output$Kelas <- renderText({
      paste("Kelas : ",input$Kelas)
    })
    
    
  }
)