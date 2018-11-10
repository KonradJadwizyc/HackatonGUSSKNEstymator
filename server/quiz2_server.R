

output$question2 <- renderText ({
  "Ile Jasiu ma kremowek?"
})

br()

# output$answer <- renderText ({
#   "Your answer is wrong."
# })

# bad_ans <- reactiveValues(countervalue = 0)
# good_ans <- reactiveValues(countervalue = 0)

reac <- reactive ({input$answer_2_2})

answer_rea <- observeEvent(input$answer_2_1, {
  output$answer2 <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
})


answer_rea1 <- observeEvent(input$answer_2_2, {
  output$answer2 <- renderText ({"Your answer is correct!"})
  if (input$exp_gain == T) {output$answer_xp_2 <- renderText ({"You gained 100xp!"}) }
  user_xp$countervalue <- user_xp$countervalue + 100
  output$xp_test2 <- renderText ({user_xp$countervalue})
  good_ans$countervalue <- good_ans$countervalue + 1
  output$count_test2 <- renderText ({good_ans$countervalue})
  # delay(1200,updateTabsetPanel(session,"navbar",selected = "Question2"))
  # delay(1200,showTab("navbar", "Question2"))
  # delay(1200,hideTab("navbar", "Quiz"))
})


answer_rea2 <- observeEvent(input$answer_2_3, {
  output$answer2 <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
  output$count_test2 <- renderText ({bad_ans$countervalue})
})


answer_rea3 <- observeEvent(input$answer_2_4, {
  output$answer2 <- renderText ({"Your answer is wrong."})
  bad_ans$countervalue <- bad_ans$countervalue + 1
})


