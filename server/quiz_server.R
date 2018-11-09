library(learnr)



Pytanie_1 <- question("Jaka jest pierwsz litera alfabetu?",
         answer("A", correct = TRUE),
         answer("C"),
         answer("V"),
         answer("G"),
         incorrect = "Wybrałeś złą odpowiedź",
         correct = "Brawo! Wybrales poprawną odpowiedz. + 100XP",
         allow_retry = F,
         random_answer_order = TRUE)

Pytanie_2 <- question("Która liczba jest najmniejsza?",
                      answer("13", correct = TRUE),
                      answer("17",),
                      answer("25",),
                      answer("50"),
                      incorrect = "Wybrałeś złą odpowiedź",
                      correct = "Brawo! Wybrales poprawną odpowiedz. + 50XP",
                      allow_retry = F,
                      random_answer_order = TRUE)

Lista_pytan <- list(Pytanie_1, Pytanie_2)
Lista_odp <-list()

sample (Lista_pytan, 1)

if () {
  
  Lista_odp <- Lista_pytan[1]
  Lista_pytan <- Lista_pytan[-1]
  
}




