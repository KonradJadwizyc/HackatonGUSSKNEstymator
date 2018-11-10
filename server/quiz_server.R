
output$question <- renderText ({
   "Test question number one."
 })

 # output$answer <- renderText ({
 #   "Your answer is wrong."
 # })

bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)
user_xp <- reactiveValues(countervalue = 0)

reac <- reactive ({input$answer_4})

hideTab("navbar", "Question2")

answer_rea <- observeEvent(input$answer_1, {
  output$answer <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
})

answer_rea1 <- observeEvent(input$answer_2, {
  output$answer <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
})

answer_rea2 <- observeEvent(input$answer_3, {
  output$answer <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
  output$count_test <- renderText ({bad_ans$countervalue})
})


answer_rea3 <- observeEvent(input$answer_4, {
  output$answer <- renderText ({"Your answer is correct!"})
  if (input$exp_gain == T) {output$answer_xp <- renderText ({"You gained 50xp!"}) }
  user_xp$countervalue <- user_xp$countervalue + 50
  good_ans$countervalue <- good_ans$countervalue + 1
  output$count_test <- renderText ({good_ans$countervalue})
  delay(1200,updateTabsetPanel(session,"navbar",selected = "Question2"))
  delay(1200,showTab("navbar", "Question2"))
  delay(1200,hideTab("navbar", "Quiz"))
})







