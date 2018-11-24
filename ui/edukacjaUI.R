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
          inputId = "data_panel",
          
          label = "Choose data you want to see!",
          
          choices = (c("No poverty", "Zero hunger", "Good health and well-being",  
                       'Quality education', 'Gender equality', 
                       'Clean water and sanitation', 'Affordable and clean energy', 
                       'Decent work and economic growth', 
                       'Industry, innovation and infrastructure', 'Reduced inequality', 
                       'Sustainable cities and communities', 
                       'Responsible consumption and production', 'Climate action', 
                       'Life below water', 'Life on land',  
                       'Peace,  justice and strong institutions', 
                       'Partnership for the goals'))
          #selected = "Gender equality"
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
        )),
    
    
    actionButton("add_my_page", 
                 "Add this plot to your page"),
    
    br(),
    br(),
    
    actionButton("add_to_quiz", 
                 "Add this chart to quiz")
    
    
    
  ),
  
  
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