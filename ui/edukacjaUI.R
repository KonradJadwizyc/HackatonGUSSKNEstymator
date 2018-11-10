data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
sidebarLayout(
  sidebarPanel(
    hidden(htmlOutput("new_panel")),
    div(id = "upper_panel",
        selectInput(
          inputId = "gender",
          label = "Choose gender",
          choices = (c("woman", "man"))
        ),
        dateRangeInput(
          inputId = "searchDateRange",
          label = "Arrivial / Departure",
          start = today(),
          end = today() + 1
        )),
    
      div(id = 'hidden_part',
          #uiOutput("searchPriceUI"),
          selectizeInput(
            inputId = "searchCountry",
            label = "Choose countries to compare:",
            choices = c(as.character(unique(data_manager$GeoAreaName))),
            multiple = TRUE,
            options = list(maxItems = 5,
                           placeholder = "Choose countries (max. 5)")
          ),
          
          radioButtons(
            inputId = "Choose interesting topics",
            label = "Choose an interesting theme:",
            choices = c("% of women in ", "% of women in", "% of women in"),
            selected = NULL
          ))),
    
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Poland",
        plotlyOutput("plot_poland")
      ),
      tabPanel(
        "Other countries",
        plotlyOutput("plot_inter")
      )
    )
  )
)