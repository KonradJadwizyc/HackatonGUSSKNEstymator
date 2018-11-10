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
<<<<<<< HEAD
          label = "Choose gender",
          choices = (c("woman", "man"))
>>>>>>> 100e288666dc426cc9516920be4e2866da9a048e
=======
          label = "Choose SDG",
          choices = (c("Zero hunger", "Gender equality")),
          selected = "Gender equality"
>>>>>>> 2f77fad220f854e5f33096a861171055872ccff3
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
            inputId = "Choose_topics",
            label = "Choose an interesting theme:",
<<<<<<< HEAD
<<<<<<< HEAD
            choices = "ome",
=======
            choices = c("% of women in managarial positions", "% of women in government", "% of women in"),
>>>>>>> 100e288666dc426cc9516920be4e2866da9a048e
=======
            choices = c("% of women in managarial positions", "% of women in government"),
>>>>>>> 2f77fad220f854e5f33096a861171055872ccff3
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