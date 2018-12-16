#Stworzenie 3 licznikow - zbieraczy danych, przechowuja zle odp, dobre odp i poziom expa
bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)
user_xp <- reactiveValues(countervalue = 0)

#obserwator sprawdzajacy czy uzytkownik decyduje sie na pokazanie expa 
observe({
  toggle(id = "count_test_xp", condition = input$exp_gain)
  toggle(id = "answer_xp", condition = input$exp_gain)
})

#Stworzenie reaktywnej tabeli z pytaniami wylosowanymi w global (baza pobrana w globalu z pliku excel)
pyt_rea <- reactiveValues(dfWorking = pyt_selected, 
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
  img(src = pyt_rea$wylosowane$img_src[1], width="100%", height="300px")
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

#Co sie stanie po kliknieciu przysiku z odpowiedzia 
observeEvent(input$answer, {
  #Sprawdzenie czy jeszcze pozostaly jakies pytania 
  if(nrow(pyt_rea$nr) > 0){
    #Jezeli uzytkownik zaznaczyl zle, to pokaz mu ze zaznaczyl zle i dodaj zla odpowiedz
    if(!isTRUE(as.logical(input$radiopyt))) {
      output$answer <- renderText ({"Twoja odpowiedz byla zla"})
      #Usuniecie informacji o poprawnosci odp po 1,5 sek od klikniecia przycisku
      delay(1500 ,output$answer <- NULL)
      bad_ans$countervalue <- bad_ans$countervalue + 1
      #Testowa wartosc, ktora pozwala zobaczyc, ze licznik zlych odp dziala
      output$count_test <- renderText ({bad_ans$countervalue})
      # Czysci info o otrzymanym expie i sumie expa (wartosc testowa) po kliknieciu na zla odp 
      output$answer_xp <- NULL
      output$count_test_xp <- NULL
      
    } else {
      
      #Wyswietlenie informacji o poprawnosci odpowiedzi. Zbior poprawnych odpowiedzi rosnie po kazdej poprawnej, co mozna sprawdzic w wersji testowej
      output$answer <- renderText ({"Twoja odpowiedz byla poprawna"})
      #Usuniecie informacji o poprawnosci odp po 1,5 sek od klikniecia przycisku
      delay(1500 ,output$answer <- NULL)
      #Zwiekszenie wartosci poprawnych odp (tzn implementacja licznika odp)
      good_ans$countervalue <- good_ans$countervalue + 1
        #Dostosowanie przyrostu expa do poziomu trudnosci pytania, im pytanie trudniejsze tym wiecej expa. 
        if (input$question_lvl == 1) {
          user_xp$countervalue <- user_xp$countervalue + 50
        } else if (input$question_lvl == 2) {
          user_xp$countervalue <- user_xp$countervalue + 100  
        } else {
          user_xp$countervalue <- user_xp$countervalue + 150  
        }
      #Testowa wartosc, ktora pozwala zobaczyc, ze licznik dobrych odp dziala (zakomentowac w normalnej wersji api)
      output$count_test <- renderText ({good_ans$countervalue})
        #Jezeli ktos chce by byl pokazywany exp to wyswietli sie informacja 
      if (input$exp_gain) {
        #Dostosowanie informacji wyswietlanej uzytkownikowi o ilosci expa w stosunku do wybranego poziomu  
        if (input$question_lvl == 1) {
          output$answer_xp <- renderText ({"Dostales 50xp"})
        } else if (input$question_lvl == 2) {
          output$answer_xp <- renderText ({"Dostales 100xp"})  
        } else {
          output$answer_xp <- renderText ({"Dostales 150xp"}) 
      }
        #Testowa wartosc, ktora pozwala zobaczyc, ze licznik sumy expa dziala (zakomentowac w normalnej wersji api)
        output$count_test_xp <- renderText ({user_xp$countervalue})
      }
    }
    #jezeli uzytonwik dokonal wyboru odpowiedzi to pytanie sie usuwa (niezaleznie od tego czy dobrze czy zle)
    usuwanie()
    #Po usunieciu pytania dokonaj ponownego losowanie i wyswietl nowe pytanie na zasadzie poprzedniego
    if(nrow(pyt_rea$nr) > 0){
      #Uzycie funkcji losujacej pytanie
      losowanie()
      #Uzupelnienie pytania, dziala na zasadzie zaktualizowania radio buttona
      updateRadioButtons(session = session,
                         input = "radiopyt",
                         label =  pyt_rea$wylosowane$pytanie[1], 
                         choiceNames = pyt_rea$wylosowane$odp,
                         choiceValues = pyt_rea$wylosowane$praw)
    }
    #Warunek wspomagajacy, pozwala po jednym kliknieciu na ostatnie pytanie wyswietlic informacje o koncu pytan, dodatkowo pytanie zmienia sie w informacje (jak i odpowiedzi). Klikanie na answer nic nie zmienia
    if(nrow(pyt_rea$nr) == 0){
      showModal(modalDialog(i18n$t("Wszystkie pytania z tej kategorii zostaly uzyte. Gratulacje!")))
      updateRadioButtons(session = session,
                         input = "radiopyt",
                         label =  i18n$t("Wszystkie pytania uzyte"),
                         choices = c(i18n$t("Wybierz inny poziom"))
      )
      
      
      if(input$question_lvl == 1) {
        #disable(selector = "[type=radio][value=1]")
        runjs("document.querySelector('[name=question_lvl][value=1]').disabled = true")
        runjs("$('[name=question_lvl][value=1]').parent().parent().addClass('disabled').css('opacity', 0.4)")
      } else if (input$question_lvl == 2) {
        
        runjs("$('[name=question_lvl][value=2]').parent().parent().addClass('disabled').css('opacity', 0.4)")
      } else {
        
        runjs("$('[name=question_lvl][value=3]').parent().parent().addClass('disabled').css('opacity', 0.4)")
      }
    }
  } else {
    #ten else jest potrzebny by po kazym kliknieciu na answer pokazywalo sie okno dialogowe
    showModal(modalDialog(i18n$t("Wszystkie pytania z tej kategorii zostaly uzyte. Gratulacje!")))
    updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  i18n$t("Wszystkie pytania uzyte"),
                       choices = c(i18n$t("Wybierz inny poziom"))
    )
    disable(selector ='input[name="question_lvl"]')
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
  #Warunek, ktory pozwala aktywowac zakonczenie quizu w momencie klikniecia na wybrane pytanie. Jest zalezny od poziomu, ktory uzytkwnik ma aktualnie wybrany.
  if(input$question_lvl == 3) {
    values$disable <- (nrow(pyt_rea$dfWorking) == 8)
  }else if(input$question_lvl == 2) {
    values$disable <- (nrow(pyt_rea$dfWorking) == 6) 
  }else if(input$question_lvl == 1) {
    values$disable <- (nrow(pyt_rea$dfWorking) == 4)  
  }
  
  
})

#
observeEvent(input$answer, {
  #Zablokowanie wyboru poziomow i odpowiadanie po skonczeniu quizu 
  toggleState(id = "question_lvl", !values$disable)
  toggleState(id = "answer", !values$disable)
  
  #tworzymy 3 elementy(w postaci listy), ktore przechowuja wartosci zdobytego expa, zlych i dobrych odp. Pozbywamy sie "reaktywnosci" by moc je zapisac do pliku
  exp_sc <- reactiveValuesToList(user_xp)
  bad_ans_sc <- reactiveValuesToList(bad_ans)
  good_ans_sc <- reactiveValuesToList(good_ans)
  #Zmiana formatu z listy na vectory, by ulatwic proces wyswietlania. 
  exp_sc_vect <- unlist(exp_sc)
  bad_ans_sc_vec <- unlist(bad_ans_sc)
  good_ans_sc_vec <- unlist(good_ans_sc)
  
  #Stworzenie zmiennej pokazujacej wynik poprawnych odp w procentach 
  good_ans_perc <- percent(good_ans_sc_vec/length(unique(pyt_selected$nr)))
  
  # Pokaz okno dialogowe (z wynikiem pkt dobrych odp) i zmien radio buttony na koniec quizu 
    if (values$disable) {
      
      showModal(modalDialog(paste("Quiz zakonczony! Udzielono:", good_ans_sc_vec, " poprawnych odpowiedzi, sposrod ", length(unique(pyt_selected$nr)) ," pytan. Jest to: ", good_ans_perc ,". Gratulacje!")))
      updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  i18n$t("Wszystkie pytania uzyte"),
                       choices = c("Gratulacje!")
    )
    }
  
  ##Ponizej kod odpowiedzialny za zapisywanie danych z danej sesji ##
  
  #Tworzymy jedna duza liste z 3 stworzonych wczesniej elementow
  score_list <- c(exp_sc, good_ans_sc, bad_ans_sc)

  #Lista jest przeksztalcona do Data Frame, nadane zostaja rowniez odpowiednie nazwy kolumn, ulatwiajace okreslenie co jest czym
  exp_df <- as.data.frame(score_list)
  colnames(exp_df) <- c("Exp","Dobre_odp","Zle_odp")
  
  #Zapisanie stworzonego Data Frame'a w pliku z formatem RDS (przyspiesza odczyt dla R)
  saveRDS(exp_df, file="user_score.RDS")
  

  
})

#Funkcja, ktora odpalamy z poziomu kodu w celu przetestowania czy nasze zapisywanie dziala
#test_1 <- readRDS("user_score.RDS")


