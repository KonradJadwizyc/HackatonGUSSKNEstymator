


fluidPage(
  
  useShinyjs(),
  br(),br(),br(),
<<<<<<< HEAD
  navbarPage("SDG", id= "Nav", position = "fixed-top", theme = shinytheme("united"),
             tabPanel("Start", source("ui/startUI.R")$value),
=======

  
  navbarPage("SGD", id = "navbar", position = "fixed-top", theme = shinytheme("united"),
             #tabPanel("Start", source("ui/startUI.R")$value),
>>>>>>> 1055e92566c920b1a931ccfb6e558578af82c90e
             tabPanel("Education", source("ui/edukacjaUI.R")$value),
             tabPanel("Quiz", source("ui/quizUI.R")$value),
             tabPanel("Question2", source("ui/quiz2UI.R")$value)
  )
)

