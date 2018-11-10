


output$question <- renderText ({
   "Test question number one."
 })

 # output$answer <- renderText ({
 #   "Your answer is wrong."
 # })

bad_ans <- reactiveValues(countervalue = 0)
good_ans <- reactiveValues(countervalue = 0)


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
})


# VBA <-question("Jaka jest pierwsz litera alfabetu?",
#                answer("A", correct = TRUE),
#                answer("C"),
#                answer("V"),
#                answer("G"),
#                incorrect = "Your answer is wrong :( ",
#                correct = "Great! You picked correc answer and erned ... XP",
#                allow_retry = F,
#                random_answer_order = TRUE)
# Pytanie_2 <- question("Która liczba jest najmniejsza?",
#                       answer("13", correct = TRUE),
#                       answer("17",),
#                       answer("25",),
#                       answer("50"),
#                       incorrect = "Your answer is wrong :( ",
#                       correct = "Great! You picked correc answer and erned ... XP",
#                       allow_retry = F,
#                       random_answer_order = TRUE)
# 
# Lista_pytan <- list(Pytanie_1, Pytanie_2)
# Lista_odp_dobrych <-list()
# Lista_odp_zlych <- list()
# 
# sample (Lista_pytan, 1)







