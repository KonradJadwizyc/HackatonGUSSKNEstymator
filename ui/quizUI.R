
#added left menu on quiz tabpanel. Width was changed.
sidebarLayout(
  sidebarPanel (width = 4,
                 #Added frame that separet 2 elements which user see (chosing question lvl and showin exp gain)
                wellPanel(
                  #Adding radio buttons, which held the difficult lvl, with changed width.
                  h3(("Difficult lvl:")),
                  radioButtons(inputId = 'question_lvl', 
                               label =  NULL, 
                               choiceNames = c("easy","medium","hard"),
                               choiceValues = c(1,2,3),
                               width = "50%")
                ),
                #Adding input that enables to show exp lvl. Clicking it is optional for user.
                wellPanel(
                  checkboxInput(inputId = "exp_gain",
                                label = ("Show exp gain"),
                                value = FALSE)
                )
  ), 
  
  #Main page section
  mainPanel(
    
    #Field for img
    div(htmlOutput(outputId = "obrazek"), style="text-align: center;"),
    #Field for question (basicly for radion buttons)
    div(htmlOutput(outputId = "pytanie"), style="text-align: center;"),
    #Add action button, that commits answers
    div(actionButton(inputId = "answer", label = ("ANSWER"), width = "50%"), style="text-align: center;"),
    #Showin info about picking correct answer
    div(textOutput("answer"), style="text-align: center;"),
    #For testing that counting good and bad answer works. Comment it in official version, but it;s usefull for working on app (if you wanna upgrade it)
    div(textOutput("count_test"), style="text-align: center;"),
    #showing exp for certain answer.
    div(textOutput("answer_xp"), style="text-align: center;"),
    # Testing amount of exp that user held. 
    div(textOutput("count_test_xp"), style="text-align: center;")
  )
)