
output$question <- renderText ({
   "Test question number one."
 })

 # output$answer <- renderText ({
 #   "Your answer is wrong."
 # })

bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)

hideTab("navbar", "Quiz2")

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
  output$answer <- renderText ({"Your answer is correct! +50 XP."})
  good_ans$countervalue <- good_ans$countervalue + 1
  output$count_test <- renderText ({good_ans$countervalue})
  updateTabsetPanel(session,"navbar",selected = "Quiz2")
})








