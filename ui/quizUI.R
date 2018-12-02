#i18n$t

sidebarLayout(
  sidebarPanel (width = 4,
                wellPanel(
                  h3((i18n$t("Difficult lvl:"))),
                  radioButtons(inputId = 'question_lvl', 
                               label =  NULL, 
                               choiceNames = c(i18n$t("easy"),i18n$t("medium"),i18n$t("hard")),
                               choiceValues = c(1,2,3),
                               width = "50%")
                ),
                wellPanel(
                  checkboxInput(inputId = i18n$t("exp_gain"),
                                label = i18n$t(("Show exp gain")),
                                value = FALSE)
                )
  ), 
  
  mainPanel(
    
    htmlOutput(outputId = "obrazek"),
    htmlOutput(outputId = "pytanie"),
    actionButton(inputId = "answer", label = (i18n$t("ANSWER")), width = "50%"),
    div(textOutput("answer"), style="text-align: center;"),
    div(textOutput("count_test"), style="text-align: center;"),
    div(textOutput("answer_xp"), style="text-align: center;"),
    div(textOutput("count_test_xp"), style="text-align: center;"),
    htmlOutput(outputId = "usuwanie")
  )
)