

#dodanie lewego paska (menu na karcie quiz) i zmiana szerokości
sidebarLayout(
  sidebarPanel (width = 4,
                #Dodanie ramek oddzielających od siebie odpowiednie elementy widoczne przez uzytkownika
                wellPanel(
                  #Dodanie radio buttonow z wyborem poziomu trudnosci, zmiana jego szerokości.
                  h3(("Difficult lvl:")),
                  radioButtons(inputId = 'question_lvl', 
                               label =  NULL, 
                               choiceNames = c("easy","medium","hard"),
                               choiceValues = c(1,2,3),
                               width = "50%")
                ),
                #Dodanie w ramce inputu na pokazywanie poziomu expa, klikniecie go jest opcjonalne
                wellPanel(
                  checkboxInput(inputId = "exp_gain",
                                label = ("Show exp gain"),
                                value = FALSE)
                )
  ), 
  
  #sekcja mieszczaca sie na glownej stronie
  mainPanel(
    
    #Pole dla obrazu
    div(htmlOutput(outputId = "obrazek"), style="text-align: center;"),
    #Pole dla pytania
    div(htmlOutput(outputId = "pytanie"), style="text-align: center;"),
    #Dodanie action buttona, odpowiadajacego za odpowiedzi
    div(actionButton(inputId = "answer", label = ("ANSWER"), width = "50%"), style="text-align: center;"),
    #Wyswietlenie informacji o poprawnosci odpowiedzi 
    div(textOutput("answer"), style="text-align: center;"),
    #Tester, ktory pokazuje, ze zliczanie dziala - w wersji ostatecznej do wyrzucenia (zakomentowania - przyda sie przy testowaniu czy wszystko chodzi)
    div(textOutput("count_test"), style="text-align: center;"),
    #Pokazywanie ile xp daje dana odpowiedz
    div(textOutput("answer_xp"), style="text-align: center;"),
    # Tet pokazujacy, ze system zlicza expa zdobytego przez danego uzytkownika 
    div(textOutput("count_test_xp"), style="text-align: center;")
  )
)