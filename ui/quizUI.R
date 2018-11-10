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
                
                plotOutput("question_plot", height = "300px"),
                div(textOutput("question"), style="text-align: center;"),
                br(),
                actionButton("answer_1", "Odp1", width = "49%"),
                actionButton("answer_2", "Odp2", width = "49%"),
                br(),
                br(),
                actionButton("answer_3", "Odp3", width = "49%"),
                actionButton("answer_4", "Odp4", width = "49%"),
                br(),
                br(),
                br(),
                div(textOutput("answer"), style="text-align: center;"),
                div(textOutput("count_test"), style="text-align: center;")
                
              )
              
)
