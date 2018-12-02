bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)
user_xp <- reactiveValues(countervalue = 0)

observe({
  toggle(id = "count_test_xp", condition = input$exp_gain)
  toggle(id = "answer_xp", condition = input$exp_gain)
})

pyt_rea <- reactiveValues(dfWorking = pyt, wylosowane = NULL, nr = NULL)

losowanie <- reactive({
  if(nrow(pyt_rea$dfWorking) > 0){
    pyt_nr <- pyt_rea$dfWorking %>%
      filter(poz_trud == as.numeric(input$question_lvl)) 
    if(nrow(pyt_nr) > 0){
      pyt_nr <- pyt_nr %>%
        sample_n(1) %>%
        select(nr)
      
      pyt_fil <- pyt_rea$dfWorking %>%
        filter(nr == pyt_nr$nr)
      
      pyt_rea$wylosowane <- pyt_fil
    }
    pyt_rea$nr <- pyt_nr
  } 
})

output$obrazek <- renderUI ({
  img(src = pyt_rea$wylosowane$img_src[1], width="400px", height="247px")
})


output$pytanie <- renderUI ({
  losowanie()
  radioButtons(inputId = 'radiopyt', 
               label =  pyt_rea$wylosowane$pytanie[1], 
               choiceNames = pyt_rea$wylosowane$odp,
               choiceValues = pyt_rea$wylosowane$praw,
               width = "50%")
})

observeEvent(input$answer, {
  cat(nrow(pyt_rea$nr))
  if(nrow(pyt_rea$nr) > 0){
    if(!isTRUE(as.logical(input$radiopyt))) {
      output$answer <- renderText ({"Your answer is wrong."})
      bad_ans$countervalue <- bad_ans$countervalue + 1
      output$count_test <- renderText ({bad_ans$countervalue})
    } else {
      usuwanie()
      if(nrow(pyt_rea$nr) > 0){
        losowanie()
        updateRadioButtons(session = session,
                           input = "radiopyt",
                           label =  pyt_rea$wylosowane$pytanie[1], 
                           choiceNames = pyt_rea$wylosowane$odp,
                           choiceValues = pyt_rea$wylosowane$praw)
      }
      
      output$answer <- renderText ({"Your answer is correct!"})
      good_ans$countervalue <- good_ans$countervalue + 1
      user_xp$countervalue <- user_xp$countervalue + 50
      output$count_test <- renderText ({good_ans$countervalue})
      if (input$exp_gain) {
        output$answer_xp <- renderText ({"You gained 50xp!"})
        output$count_test_xp <- renderText ({user_xp$countervalue})
      }
    }
  } else {
    showModal(modalDialog("abc"))
  }
})

usuwanie <- reactive({
  pyt_rea$dfWorking <- pyt_rea$dfWorking[!(pyt_rea$dfWorking$nr == pyt_rea$nr$nr),]
})

observeEvent(input$answer, {
  if(isTRUE(as.logical(input$radiopyt))) {
  }
})