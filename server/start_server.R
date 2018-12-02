observeEvent(input$img_1_pl, {
  progress1 <- shiny::Progress$new()
  on.exit(progress1$close())
  progress1$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 1) 
    progress1$inc(1/n, detail = "zerrro", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_2_pl, {
  progress2 <- shiny::Progress$new()
  on.exit(progress2$close())
  progress2$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 2) 
    
    progress2$inc(1/n, detail = "cos tammmm", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_3_pl, {
  progress3 <- shiny::Progress$new()
  on.exit(progress3$close())
  progress3$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 3) 
    
    progress3$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_4_pl, {
  progress4 <- shiny::Progress$new()
  on.exit(progress4$close())
  progress4$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 4) 
    progress4$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_5_pl, {
  progress5 <- shiny::Progress$new()
  on.exit(progress5$close())
  progress5$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 5) 
    progress5$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_6_pl, {
  progress6 <- shiny::Progress$new()
  on.exit(progress6$close())
  progress6$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 6) 
    
    progress6$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_7_pl, {
  progress7 <- shiny::Progress$new()
  on.exit(progress7$close())
  progress7$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 7) 
    
    progress7$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_8_pl, {
  progress8 <- shiny::Progress$new()
  on.exit(progress8$close())
  progress8$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 8) 
    
    progress8$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_9_pl, {
  progress9 <- shiny::Progress$new()
  on.exit(progress9$close())
  progress9$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 9) 
    
    progress9$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_10_pl, {
  progress10 <- shiny::Progress$new()
  on.exit(progress10$close())
  progress10$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 10) 
    
    progress10$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_11_pl, {
  progress11 <- shiny::Progress$new()
  on.exit(progress11$close())
  progress11$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 11) 
    
    progress11$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_12_pl, {
  progress12 <- shiny::Progress$new()
  on.exit(progress12$close())
  progress12$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 12) 
    progress12$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_13_pl, {
  progress13 <- shiny::Progress$new()
  on.exit(progress13$close())
  progress13$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 13) 
    progress13$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_14_pl, {
  progress14 <- shiny::Progress$new()
  on.exit(progress14$close())
  progress14$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 14) 
    progress14$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_15_pl, {
  progress15 <- shiny::Progress$new()
  on.exit(progress15$close())
  progress15$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 15) 
    progress15$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_16_pl, {
  progress16 <- shiny::Progress$new()
  on.exit(progress16$close())
  progress16$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 16) 
    progress16$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_17_pl, {
  progress17 <- shiny::Progress$new()
  on.exit(progress17$close())
  progress17$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Edukacja")
    updateSelectInput(session = session, "goal", selected = 17) 
    progress17$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})