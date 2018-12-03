shinyServer(function(input, output, session) {
  
 
  #   hideTab(inputId = "navbar", target = "Education", session = session)
  # 
  # if(input$img_1 == T) {
  #   showTab(inputId = "navbar", target = "Education", session = session)
  # }
  #   
  for (file in list.files("server")) {
    source(file.path("server", file), local = TRUE)
  }
})
