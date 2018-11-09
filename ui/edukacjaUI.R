
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
            choices = NULL,
            multiple = TRUE,
            options = list(maxItems = 5,
                           placeholder = "Choose countries (max. 5)")
          ),
          
          awesomeCheckboxGroup(
            inputId = "Choose topics",
            label = "Choose a cancellation policy:",
            choices = c("głód", "bieda", "równość"),
            selected = NULL, 
            status = "danger"
          ))),
    
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Poland"#,
        #leafletOutput("map")
      ),
      tabPanel(
        "Other countries"#,
        #dataTableOutput("searchTable")
      )
    )
  )
)