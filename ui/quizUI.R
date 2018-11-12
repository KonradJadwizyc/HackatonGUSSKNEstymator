sidebarLayout(
  sidebarPanel (width = 4,
                wellPanel(
                  h3("Difficult lvl:"),
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
    
    img(src = "wykres_interaktywny_fejsbuk.png", height = '300px', width = '98%'), 
    div(textOutput("question"), style="text-align: center;"),
    br(),
    actionButton("answer_1", "France", width = "49%"),
    actionButton("answer_2", "Germany", width = "49%"),
    br(),
    br(),
    actionButton("answer_3", "Poland", width = "49%"),
    actionButton("answer_4", "USA", width = "49%"),
    br(),
    br(),
    br(),
    div(textOutput("answer"), style="text-align: center;"),
    div(textOutput("count_test"), style="text-align: center;"),
    div(textOutput("answer_xp"), style="text-align: center;"),
    div(textOutput("hint"), style="text-align: center;")
    
  )
  
)