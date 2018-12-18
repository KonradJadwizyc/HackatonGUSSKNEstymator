
observeEvent(input$img_1, {
  
  # loading waiting message loating tabpanel edukacja
  progress1 <- shiny::Progress$new()
  on.exit(progress1$close())
  # waiting message
  progress1$set(message = "waiting", value = 0)
  
  updateTabsetPanel(session, "navbar",
                    selected = "Education")
  # if you click IMAGE GOAL1 you go to education panel and loading data
  updateSelectInput(session = session, "goal", selected = 1) 
  
  # used in loading the progress
  n <- 5 
  for (i in 1:n) {
    # loading the progress 
    progress1$inc(1/n, detail = "loading", i)
    # system sleep 1 s
    Sys.sleep(0.1)
  }
})
# loading waiting message loating tabpanel edukacja
observeEvent(input$img_2, {

  progress2 <- shiny::Progress$new()
  on.exit(progress2$close())
  # waiting message
  progress2$set(message = "waiting", value = 0)
  
  # used in loading the progress
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    ## if you click IMAGE GOAL1 you go to education panel and loading data
    updateSelectInput(session = session, "goal", selected = 2) 
    
    # loading the progress 
    progress2$inc(1/n, detail = "loading", i)
    # system sleep 1 s
    Sys.sleep(0.1)
  }
})
# loading waiting message loating tabpanel edukacja
observeEvent(input$img_3, {
  # waiting message
  progress3 <- shiny::Progress$new()
  on.exit(progress3$close())
  # waiting message
  progress3$set(message = "waiting", value = 0)
  
  # loading the progress 
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    # if you click IMAGE GOAL1 you go to education panel and loading data
    updateSelectInput(session = session, "goal", selected = 3) 
    # loading the progress
    progress3$inc(1/n, detail = "loading", i)
    # system sleep 1 s
    Sys.sleep(0.1)
  }
})
# loading waiting message loating tabpanel edukacja
observeEvent(input$img_4, {
  # waiting message
  progress4 <- shiny::Progress$new()
  on.exit(progress4$close())
  # waiting message
  progress4$set(message = "waiting", value = 0)
  
  # loading the progress
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    # if you click IMAGE GOAL1 you go to education panel and loading data
    updateSelectInput(session = session, "goal", selected = 4) 
    # loading the progress
    progress4$inc(1/n, detail = "loading", i)
    # system sleep 1s 
    Sys.sleep(0.1)
  }
})
# loading waiting message loating tabpanel edukacja
observeEvent(input$img_5, {
  # waiting message
  progress5 <- shiny::Progress$new()
  on.exit(progress5$close())
  # waiting message
  progress5$set(message = "waiting", value = 0)
  
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    # if you click IMAGE GOAL1 you go to education panel and loading data
    updateSelectInput(session = session, "goal", selected = 5) 
    # loading the progress
    progress5$inc(1/n, detail = "loading", i)
    # system sleep 1 s
    Sys.sleep(0.1)
  }
})
# loading waiting message loating tabpanel edukacja
observeEvent(input$img_6, {
  # waiting message
  progress6 <- shiny::Progress$new()
  on.exit(progress6$close())
  # waiting message
  progress6$set(message = "waiting", value = 0)
  
 
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    # if you click IMAGE GOAL1 you go to education panel and loading data
    updateSelectInput(session = session, "goal", selected = 6) 
    # loading the progress
    progress6$inc(1/n, detail = "loading", i)
    # system sleep 1 s
    Sys.sleep(0.1)
  }
}) # analogously to those described above, the following calls operate
observeEvent(input$img_7, {
  progress7 <- shiny::Progress$new()
  on.exit(progress7$close())
  progress7$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 7) 
    
    progress7$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_8, {
  progress8 <- shiny::Progress$new()
  on.exit(progress8$close())
  progress8$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 8) 
    
    progress8$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_9, {
  progress9 <- shiny::Progress$new()
  on.exit(progress9$close())
  progress9$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 9) 
    
    progress9$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_10, {
  progress10 <- shiny::Progress$new()
  on.exit(progress10$close())
  progress10$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 10) 
    
    progress10$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_11, {
  progress11 <- shiny::Progress$new()
  on.exit(progress11$close())
  progress11$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 11) 
    
    progress11$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_12, {
  progress12 <- shiny::Progress$new()
  on.exit(progress12$close())
  progress12$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 12) 
    progress12$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_13, {
  progress13 <- shiny::Progress$new()
  on.exit(progress13$close())
  progress13$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 13) 
    progress13$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_14, {
  progress14 <- shiny::Progress$new()
  on.exit(progress14$close())
  progress14$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 14) 
    progress14$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_15, {
  progress15 <- shiny::Progress$new()
  on.exit(progress15$close())
  progress15$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 15) 
    progress15$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_16, {
  progress16 <- shiny::Progress$new()
  on.exit(progress16$close())
  progress16$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 16) 
    progress16$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})
observeEvent(input$img_17, {
  progress17 <- shiny::Progress$new()
  on.exit(progress17$close())
  progress17$set(message = "waiting", value = 0)
  
  n <- 5 
  for (i in 1:n) {
    updateTabsetPanel(session, "navbar",
                      selected = "Education")
    updateSelectInput(session = session, "goal", selected = 17) 
    progress17$inc(1/n, detail = "loading", i)
    Sys.sleep(0.1)
  }
})