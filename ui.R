
fluidPage(
  useShinyjs(),
  br(),br(),br(),
  
  navbarPage("SGD", position = "fixed-top", theme = shinytheme("united"),
             tabPanel("Start", source("ui/startUI.R")$value),
             tabPanel("Education", source("ui/edukacjaUI.R")$value),
             tabPanel("Quiz", source("ui/quizUI.R")$value)
  )
)
