

fluidPage(
  
  useShinyjs(),
  br(),br(),br(),

  navbarPage("SDG", id = "navbar", position = "fixed-top", theme = shinytheme("united"),
             tabPanel("Start", source("ui/startUI.R")$value),
             tabPanel("Education", source("ui/edukacjaUI.R")$value),
             tabPanel("Quiz", source("ui/quizUI.R")$value),
             tabPanel("Question2", source("ui/quiz2UI.R")$value),
             tabPanel("Start!", source("ui/startUIpl.R")$value)
  )
)

