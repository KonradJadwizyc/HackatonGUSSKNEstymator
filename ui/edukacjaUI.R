data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        selectInput(
          inputId = "gender",
          label = "Choose data you want to see!",
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
        
        radioButtons(
          inputId = "Choose_topic",
          label = "Choose topics interesting for you:",
          choices = c("% of women in managarial positions", "% of women in government"),
          selected = NULL
        ),
        radioButtons(
          inputId = "chartType",
          label = "Choose chart type!",
          choices = c("bar", "line", "pie"),
          selected = "line"
        ))),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Other countries",
        conditionalPanel(
          condition = "input.chartType == 'line'",
        plotlyOutput("plot_inter")
        ),
        conditionalPanel(
          condition = "input.chartType == 'bar'",
          plotlyOutput("plot_inter_bar")
        ),
        conditionalPanel(
          condition = "input.chartType == 'pie'",
          plotlyOutput("plot_inter_pie")
        )
      ),
      tabPanel(
        "Poland",
        plotlyOutput("plot_poland")
      )
      
    )
  )
)