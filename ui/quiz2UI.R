sidebarLayout(
  sidebarPanel (width = 3,
                
                wellPanel(
                  checkboxInput(inputId = "easy",
                                label = "Easy",
                                value = TRUE),
                  
                  checkboxInput(inputId = "medium",
                                label = "Medium",
                                value = FALSE),
                  
                  checkboxInput(inputId = "hard",
                                label = "Hard",
                                value = FALSE)
                ),
                wellPanel(
                  checkboxInput(inputId = "exp_gain",
                                label = "Show exp gain",
                                value = FALSE)
                )
  ), 
  
  
  
  mainPanel(
    
    img(src = "flaga_onztu.png", height = '300px', width = '98%'), 
    div(textOutput("question2"), style="text-align: center;"),
    br(),
    actionButton("answer_2_1", "FBI", width = "49%"),
    actionButton("answer_2_2", "ONZ", width = "49%"),
    br(),
    br(),
    actionButton("answer_2_3", "GUSU", width = "49%"),
    actionButton("answer_2_4", "USA", width = "49%"),
    br(),
    br(),
    br(),
    div(textOutput("answer2"), style="text-align: center;"),
    div(textOutput("count_test2"), style="text-align: center;"),
    div(textOutput("answer_xp_2"), style="text-align: center;"),
    div(textOutput("xp_test2"), style="text-align: center;")
    
  )
  
)