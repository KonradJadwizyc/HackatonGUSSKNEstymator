#Stworzenie 3 licznikow - zbieraczy danych, przechowuja zle odp, dobre odp i poziom expa
bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)
user_xp <- reactiveValues(countervalue = 0)

#obserwator sprawdzajacy czy uzytkownik decyduje sie na pokazanie expa 
observe({
  toggle(id = "count_test_xp", condition = input$exp_gain)
  toggle(id = "answer_xp", condition = input$exp_gain)
})

#Stworzenie reaktywnej tabeli z pobranymi z pliku pytaniami (pobrane w globalu z pliku excel)
pyt_rea <- reactiveValues(dfWorking = pyt, 
                          wylosowane = NULL, 
                          nr = NULL, 
                          poziomy = c(4,2,1))


#funckja odpowiedzialna za losowanie pytan ze zbioru 
losowanie <- reactive({
  #warunek sprawdzajacy czy w zbiorze jest jeszcze co losowac 
  if(nrow(pyt_rea$dfWorking) > 0){
    #Filtorwanie zgodnie z wybranym przez uzytkownika poziomem trudnosci
    pyt_nr <- pyt_rea$dfWorking %>% 
      filter(poz_trud == as.numeric(input$question_lvl)) 
    #Sprawdzenie czy jest mozliwe losowanie
    if(nrow(pyt_nr) > 0){
      #Wylosowanie jednego nr pytania na liscie 
      pyt_nr <- pyt_nr %>%
        sample_n(1) %>%
        select(nr)
      
      #Wyfiltorwanie wybranego nr pytania z listy wszystkich pytan i zapisanie w zmiennej
      pyt_fil <- pyt_rea$dfWorking %>%
        filter(nr == pyt_nr$nr)
      
      #dodane wysolowanego pytania do utworzonej wczesniej reaktywnej tabeli
      pyt_rea$wylosowane <- pyt_fil
    }
    #Przypisanie aktualnie posiadanego nr pytania
    pyt_rea$nr <- pyt_nr
  } 
})

#Renderowanie obrazka, ktory jest przypisany do pytania w bazie danych 
output$obrazek <- renderUI ({
  img(src = pyt_rea$wylosowane$img_src[1], width="400px", height="250px")
})

#Render pola, w ktorym wyswietla sie grupa buttonow z pytaniem.
output$pytanie <- renderUI ({
  #zastosowanie napisanej funkcji na losowanie
  losowanie()
  #Stworzenie buttonow. tytulem jest tres pytania, odpowiedzi wyswietlane uzytkownikowi to teksty, za to wartosci pod nimi to argumenty logiczne (falsze i jedna prawda)
  div(radioButtons(inputId = 'radiopyt', 
                   label =  pyt_rea$wylosowane$pytanie[1], 
                   choiceNames = pyt_rea$wylosowane$odp,
                   choiceValues = pyt_rea$wylosowane$praw,
                   width = "100%"), style="text-align: center;")
})

#Co sie stanie po kliknieciu przysiku z odpwoiedzia 
observeEvent(input$answer, {
  #Sprawdzenie czy jeszcze pozostaly jakies pytania 
  if(nrow(pyt_rea$nr) > 0){
    #Jezeli uzytkownik zaznaczyl zle, to pokaz mu ze zaznaczyl zle i dodaj zla odpowiedz
    if(!isTRUE(as.logical(input$radiopyt))) {
      output$answer <- renderText ({"Twoja odpowiedz jest zla"})
      bad_ans$countervalue <- bad_ans$countervalue + 1
      output$count_test <- renderText ({bad_ans$countervalue})
    } else {
      #jezeli uzytonwik zaznaczyl dobrze to usun pytanie
      usuwanie()
      #Po usunieciu pytania dokonaj ponownego losowanie i wyswietl nowe pytanie na zasadzie poprzedniego
      if(nrow(pyt_rea$nr) > 0){
        losowanie()
        updateRadioButtons(session = session,
                           input = "radiopyt",
                           label =  pyt_rea$wylosowane$pytanie[1], 
                           choiceNames = pyt_rea$wylosowane$odp,
                           choiceValues = pyt_rea$wylosowane$praw)
      }
      #Warunek wspomagajacy, pozwala po jednym kliknieciu na ostatnie pytanie wyswietlic informacje o koncu pytan, dodatkowo pytanie zmienia sie w informacje (jak i odpowiedzi). Klikanie na answer nic nie zmienia
      if(nrow(pyt_rea$nr) == 0){
        showModal(modalDialog(i18n$t("Wszystkie pytania z tej kategorii zostały uzyte. Gratulacje!")))
        updateRadioButtons(session = session,
                           input = "radiopyt",
                           label =  i18n$t("Wszystkie pytania uzyte"),
                           choices = c(i18n$t("Wybierz inny poziom"))
        )
        return
      }
      
      #Wyswietlenie informacji o poprawnosci odpowiedzi. Zbior poprawnych odpowiedzi rosnie po kazdej poprawnej, co mozna sprawdzic w wersji testowej
      output$answer <- renderText ({"Twoja odpowiedz jest poprawna"})
      good_ans$countervalue <- good_ans$countervalue + 1
      user_xp$countervalue <- user_xp$countervalue + 50
      output$count_test <- renderText ({good_ans$countervalue})
      #Jezeli ktos chce by byl pokazywany exp to wyswietli sie informacja 
      if (input$exp_gain) {
        output$answer_xp <- renderText ({"Dostales 50xp"})
        output$count_test_xp <- renderText ({user_xp$countervalue})
      }
    }
  } else {
    #ten else jest potrzebny by po kazym kliknieciu na answer pokazywalo sie okno dialogowe
    showModal(modalDialog(i18n$t("Wszystkie pytania z tej kategorii zostały uzyte. Gratulacje!")))
    updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  i18n$t("Wszystkie pytania uzyte"),
                       choices = c(i18n$t("Wybierz inny poziom"))
    )
  }
})

#funckja odpowiedzialna za usuwanie pytan z utworzonej reaktywnej bazy danych, zgodnie z nr pytania, ktory zostal wybrany
usuwanie <- reactive({
  pyt_rea$dfWorking <- pyt_rea$dfWorking[!(pyt_rea$dfWorking$nr == pyt_rea$nr$nr),]
})

#Wyswietl nowy zestaw radio buttonow po kliknieciu dobrej odpowiedzi. 
observeEvent(input$answer, {
  if(isTRUE(as.logical(input$radiopyt))) {
  }
})

#utworzenie zmiennej reaktywnej, ktora pozwoli nam dotrzec do elementow radio buttona
values <- reactiveValues(disable = FALSE)

#dynamiczne zmienianie zmiennej 
observe({
  values$disable <- (nrow(pyt_rea$dfWorking) == 0)
})

#
observeEvent(input$answer, {
  #Zablokowanie wyboru poziomow i odpowiadanie po skonczeniu quizu 
  toggleState(id = "question_lvl", !values$disable)
  toggleState(id = "answer", !values$disable)
  
  # Pokaz okno dialogowe i zmien radio buttony na koniec quizu 
  if (values$disable) {
    showModal(modalDialog(i18n$t("Zakonczyłeś Quiz! Gratulacje")))
    updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  i18n$t("Wszystkie pytania uzyte"),
                       choices = c("Gratulacje!")
    )
  }
  
})