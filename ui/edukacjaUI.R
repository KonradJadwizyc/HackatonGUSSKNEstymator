data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        style="text-align: center;",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        style="text-align: center;",
        selectInput(
          inputId = "gender",
          label = "Pick YOUR data",
          choices = (c("Zero hunger", "Gender equality")),
          selected = "Gender equality"
        )),
    
    div(id = 'hidden_part',
        style="text-align: center;",
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
        ),
        
        actionButton("add_my_page", 
                     "Add this plot to your page"),
        
        br(),
        br(),
        
        actionButton("add_to_quiz", 
                     "Add this chart to quiz")
        
        
        
        
      )
    
),
  
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