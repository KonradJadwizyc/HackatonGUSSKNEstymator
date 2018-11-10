sidebarLayout(
  sidebarPanel (width = 3,
                
                checkboxInput(inputId = "easy",
                              label = "Easy",
                              value = TRUE),
                
                checkboxInput(inputId = "medium",
                              label = "Medium",
                              value = FALSE),
                
                checkboxInput(inputId = "hard",
                              label = "Hard",
                              value = FALSE),
                
                checkboxInput(inputId = "exp_gain",
                              label = "Show exp gain",
                              value = FALSE)
                
  ), 
  
  
  
  mainPanel(
    
    plotOutput("question_plot1", height = "300px"),
    div(textOutput("ile jasiu ma kremowek"), style="text-align: center;"),
    br(),
    actionButton("answer_5", "10", width = "49%"),
    actionButton("answer_6", "25", width = "49%"),
    br(),
    br(),
    actionButton("answer_7", "GUSU", width = "49%"),
    actionButton("answer_8", "duzo", width = "49%"),
    br(),
    br(),
    br(),
    div(textOutput("answer1"), style="text-align: center;"),
    div(textOutput("count_test1"), style="text-align: center;")
    
  )
  
)
