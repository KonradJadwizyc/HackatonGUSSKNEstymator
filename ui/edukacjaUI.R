data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        selectInput(
          inputId = "gender",
          label = "Choose SDG",
          choices = (c("Zero hunger", "Gender equality")),
          selected = "Gender equality"
        )),
    
    div(id = 'hidden_part',
        #uiOutput("searchPriceUI"),
        selectizeInput(
          inputId = "searchCountry",
          label = "Choose countries to compare:",
          choices = c(as.character(unique(data_manager$GeoAreaName))),
          multiple = TRUE,
          selected = "Poland",
          options = list(maxItems = 5,
                         placeholder = "Choose countries (max. 5)")
        ),
        selectizeInput(
          inputId = "",
          label = "Choose chart",
          multiple = TRUE,
          selected = "line char",
          options = list(maxItems = 5,
                         placeholder = "Choose countries (max. 5)")
        ),
        radioButtons(
          inputId = "Choose interesting topics",
          label = "Choose an interesting theme:",
          choices = c("% of women in managarial positions", "% of women in government"),
          selected = NULL
        ))),
  
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Other countries",
        plotlyOutput("plot_inter")
      ),
      tabPanel(
        "Poland",
        plotlyOutput("plot_poland")
      )
      
    )
  )
)