
fluidPage(
  useShinyjs(),
  br(),br(),br(),
  selectInput("frontCityName", 
              label = NULL, 
              choices = c("Amsterdam", "Berlin", "Vienna")), 
  navbarPage("iDash", position = "fixed-top", theme = shinytheme("united"),
             tabPanel("Find your place", source("ui/searchUI.R")$value),
             tabPanel("Overview", source("ui/overviewUI.R")$value),
             tabPanel("Live data", source("ui/liveUI.R")$value)
  )
)
