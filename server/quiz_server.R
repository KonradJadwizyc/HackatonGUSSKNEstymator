#Creating 3 counters - collecting datas - bad answers, good answers and exp lvl 
bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)
user_xp <- reactiveValues(countervalue = 0)

# Observ that checks if user wants to show exp to him
observe({
  toggle(id = "count_test_xp", condition = input$exp_gain)
  toggle(id = "answer_xp", condition = input$exp_gain)
})

#Creating reactive table with datas downloaded from file with questions (downloaded in global from excel file)
pyt_rea <- reactiveValues(dfWorking = pyt_selected, 
                          wylosowane = NULL, 
                          nr = NULL, 
                          poziomy = c(4,2,1))

#Function that draws question 
losowanie <- reactive({
  #Condition that checks if it's something to draw in data frame
  if(nrow(pyt_rea$dfWorking) > 0){
    #Filtering with picked difficulto lvl 
    pyt_nr <- pyt_rea$dfWorking %>% 
              filter(poz_trud == as.numeric(input$question_lvl)) 
    # Checks if drawing is possible
    if(nrow(pyt_nr) > 0){
      #Draw one number of question from list
      pyt_nr <- pyt_nr %>%
                sample_n(1) %>%
                select(nr)
      
      #Filter picked question based on question nr (from frame of all question), then save it to variable
      pyt_fil <- pyt_rea$dfWorking %>%
                 filter(nr == pyt_nr$nr)
      
      #Adding draw question to created reactive table
      pyt_rea$wylosowane <- pyt_fil
    }
    #adding actual number of question - important for removing questions from data base
    pyt_rea$nr <- pyt_nr
  } 
})

# Render img, that is connected with question in data base
output$obrazek <- renderUI ({
  img(src = pyt_rea$wylosowane$img_src[1], width="100%", height="300px")
})

#Render field that shows radio buttons
output$pytanie <- renderUI ({
  #Using function for drawing (created earlier)
  losowanie()
   #Creating radio buttons, title of radio button is question, anserwer that are showed to user are string, but values are logical arguments 
  div(radioButtons(inputId = 'radiopyt', 
               label =  pyt_rea$wylosowane$pytanie[1], 
               choiceNames = pyt_rea$wylosowane$odp,
               choiceValues = pyt_rea$wylosowane$praw,
               width = "100%"), style="text-align: center;")
})


#What happens after clicling on answer action button
observeEvent(input$answer, {
  #Checks if any questions are left.
  if(nrow(pyt_rea$nr) > 0){
    #If useres picked wrong answer it shows him that is's bad, and adds answer to counter
    if(!isTRUE(as.logical(input$radiopyt))) {
      output$answer <- renderText ({"Your answer was wrong."})
      delay(1500 ,output$answer <- NULL)
      bad_ans$countervalue <- bad_ans$countervalue + 1
      #Test value, it shows that counter of bad answers is working. Comment it after finishing tests.
      output$count_test <- renderText ({bad_ans$countervalue})
      # Clear the counter of xp (test value) and info about xp gain after picking bad answer
      output$answer_xp <- NULL
      output$count_test_xp <- NULL
      
    } else {
      
      # #Showing info about picking good answer. Counter of good answers grows same as exp.
      output$answer <- renderText ({"Your answer was correct!"})
      delay(1500 ,output$answer <- NULL)
      #After picking correct answer the counter go up by 1. 
      good_ans$countervalue <- good_ans$countervalue + 1
      #Connecting exp with difficult lvl of questions. The higher is the lvl of question, the more exp user gets.
      if (input$question_lvl == 1) {
        user_xp$countervalue <- user_xp$countervalue + 50
      } else if (input$question_lvl == 2) {
        user_xp$countervalue <- user_xp$countervalue + 100  
      } else {
        user_xp$countervalue <- user_xp$countervalue + 150  
      }
      #Test value, it shows that counter of good answers is working. Comment it after finishing tests.
      output$count_test <- renderText ({good_ans$countervalue})
      #Condition for showing exp gain for user
      if (input$exp_gain) {
        #This "if" controls the information about exp gain that users gets when picking correct answer depending on the difficult lvl they have chosen.  
        if (input$question_lvl == 1) {
          output$answer_xp <- renderText ({"Dostales 50xp"})
        } else if (input$question_lvl == 2) {
          output$answer_xp <- renderText ({"Dostales 100xp"})  
        } else {
          output$answer_xp <- renderText ({"Dostales 150xp"}) 
        }
        #Test value, it shows that counter of good answers is working. Comment it after finishing tests.
        output$count_test_xp <- renderText ({user_xp$countervalue})
      }
    }
    #If user picked answer delete question from from data base
    usuwanie()
    #Drawing new question and adding it to radio buttons (update radio buttons)
    if(nrow(pyt_rea$nr) > 0){
      #Function that draw questions
      losowanie()
      #Showing new question, updating radio buttons
      updateRadioButtons(session = session,
                         input = "radiopyt",
                         label =  pyt_rea$wylosowane$pytanie[1], 
                         choiceNames = pyt_rea$wylosowane$odp,
                         choiceValues = pyt_rea$wylosowane$praw)
    }
    #Show modal dialog after first click at last question of category
    if(nrow(pyt_rea$nr) == 0){
      showModal(modalDialog("All questions from this category were used. Congratulations!"))
      updateRadioButtons(session = session,
                         input = "radiopyt",
                         label =  ("Wszystkie pytania uzyte"),
                         choices = c("Wybierz inny poziom")
      )
    }
    } else {
    #This else statment is used for showing info about finishing this lvl of questions after 2 click on answer button (bug protection option)
    showModal(modalDialog("All questions from this category were used. Congratulations!"))
    updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  "All questions used",
                       choices = c("Pick another lvl")
                       )
    }
})

#Function that removes question from created reactive data base. Based on question nr
usuwanie <- reactive({
  pyt_rea$dfWorking <- pyt_rea$dfWorking[!(pyt_rea$dfWorking$nr == pyt_rea$nr$nr),]
})

#Shows new radio buttons after good answer 
observeEvent(input$answer, {
  if(isTRUE(as.logical(input$radiopyt))) {
  }
})

#Creating reactive value that let us connect to elements inside radio buttons group 
values <- reactiveValues(disable = FALSE)

#changing variable 
observe({
  #Condition that let finishes the quiz after last question is answered. It depends on choosen difficult  lvl. 
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
  #Blocing possibility of picking difficult lvl, and clicing answer button
  toggleState(id = "question_lvl", !values$disable)
  toggleState(id = "answer", !values$disable)
  
  
  #Create 3 lists, which hold exp value, good answers and bad answers. We're "getting rid of reactivity" so we can save values to file or print them to user.
  exp_sc <- reactiveValuesToList(user_xp)
  bad_ans_sc <- reactiveValuesToList(bad_ans)
  good_ans_sc <- reactiveValuesToList(good_ans)
  
  #Change format from list to vectors (unlisting) so it'll be easier to show information to the user.
  exp_sc_vect <- unlist(exp_sc)
  bad_ans_sc_vec <- unlist(bad_ans_sc)
  good_ans_sc_vec <- unlist(good_ans_sc)
  
  #Creating variable that shows good answer score in percents
  good_ans_perc <- percent(good_ans_sc_vec/length(unique(pyt_selected$nr)))
  
  # Showing modal dialog at the end, and chagin radio buttons 
  if (values$disable) {
    showModal(modalDialog(paste("You finished Quiz! You Gave:", good_ans_sc_vec, " good answers, from ", length(unique(pyt_selected$nr)) ," question. It is: ", good_ans_perc ,". Congratulations!")))
    updateRadioButtons(session = session,
                       input = "radiopyt",
                       label =  "All questions used",
                       choices = c("support us")
    )
  }
  
  ##This code is responsible for saving data from current session ##
  
  #Combine 3 lists to 1 list.
  score_list <- c(exp_sc, good_ans_sc, bad_ans_sc)
  
  #Create data frame form 1 list. Giving column names.
  exp_df <- as.data.frame(score_list)
  colnames(exp_df) <- c("Exp","Good_ans","Bad_ans")
  
  #Saving data frame in to RDS file (typical file for R)
  saveRDS(exp_df, file="user_score.RDS")
  
})

#testing that saving files is working fine. This should be comented if we wanna app to work ;) 
#test_1 <- readRDS("user_score.RDS")
