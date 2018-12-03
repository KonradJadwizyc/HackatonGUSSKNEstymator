#i18n$t

sidebarLayout(
  sidebarPanel (width = 4,
                wellPanel(
                  h3(("Difficult lvl:")),
                  radioButtons(inputId = 'question_lvl', 
                               label =  NULL, 
                               choiceNames = c("easy","medium","hard"),
                               choiceValues = c(1,2,3),
                               width = "50%")
                ),
                wellPanel(
                  checkboxInput(inputId = "exp_gain",
                                label = ("Show exp gain"),
                                value = FALSE)
                )
  ), 
  
  mainPanel(
    
    div(htmlOutput(outputId = "obrazek"), style="text-align: center;"),
    div(htmlOutput(outputId = "pytanie"), style="text-align: center;"),
    div(actionButton(inputId = "answer", label = ("ANSWER"), width = "50%"), style="text-align: center;"),
    div(textOutput("answer"), style="text-align: center;"),
    div(textOutput("count_test"), style="text-align: center;"),
    div(textOutput("answer_xp"), style="text-align: center;"),
    div(textOutput("count_test_xp"), style="text-align: center;"),
    htmlOutput(outputId = "usuwanie")
  )
)