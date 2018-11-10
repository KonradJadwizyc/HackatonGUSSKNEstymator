data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
glod <- read.csv("data (2).csv")
sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        selectInput(
<<<<<<< HEAD
          inputId = "Choose_SDG",
          label = "Choose SDG",
          choices = (c("Zero Hunger",
                       "Gender Equality",
                       "No Poverty",
                       "Climate Action",
                       "",
                       "",
                       "",
                       "",
                       "")),
          selected = "Zero Hunger"
        ),
        dateRangeInput(
          inputId = "searchDateRange",
          label = "Arrivial / Departure",
          start = today(),
          end = today() + 1
=======
          inputId = "gender",
          label = "Choose gender",
          choices = (c("woman", "man"))
>>>>>>> 100e288666dc426cc9516920be4e2866da9a048e
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
            inputId = "Choose_topics",
            label = "Choose an interesting theme:",
<<<<<<< HEAD
            choices = "ome",
=======
            choices = c("% of women in managarial positions", "% of women in government", "% of women in"),
>>>>>>> 100e288666dc426cc9516920be4e2866da9a048e
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