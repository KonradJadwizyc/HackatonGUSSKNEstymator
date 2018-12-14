#i18n$t

sidebarLayout(
  sidebarPanel (width = 4,
                wellPanel(
                  div(h3((i18n$t("Difficult lvl:"))), style="text-align: center;"),
                  div(radioButtons(inputId = 'question_lvl', 
                               label =  NULL, 
                               choiceNames = c(i18n$t("easy"),i18n$t("medium"),i18n$t("hard")),
                               choiceValues = c(1,2,3),
                               width = "100%"), style="text-align: center;")
                ),
                wellPanel(
                  div(checkboxInput(inputId = i18n$t("exp_gain"),
                                label = i18n$t(("Show exp gain")),
                                value = FALSE), style="text-align: center;")
                )
  ), 
  
  mainPanel(
    
    div(htmlOutput(outputId = "obrazek"), style="text-align: center;"),
    htmlOutput(outputId = "pytanie"),
    div(actionButton(inputId = "answer", label = (i18n$t("ANSWER")), width = "50%"), style="text-align: center;"),
    div(textOutput("answer"), style="text-align: center;"),
    div(textOutput("count_test"), style="text-align: center;"),
    div(textOutput("answer_xp"), style="text-align: center;"),
    div(textOutput("count_test_xp"), style="text-align: center;"),
    htmlOutput(outputId = "usuwanie")
  )
)