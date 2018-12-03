sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        style="text-align: center;",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        style="text-align: center;",
        selectInput("goal", 
                    # wybieranie celu zrównoważonego rozwoju
                    label = i18n$t("Choose goal you want to see"),
                    # wczytanie danych po kliknieciu na kafelek z celem
                    choices = c("No poverty" = 1,
                                "Zero hunger" = 2,
                                "Good health and well-being" = 3,
                                "Quality education" = 4,
                                "Gender equality" = 5,
                                "Clean water and sanitation" = 6,
                                "Affordable and clean energy" = 7,
                                "Decent work and economic growth" = 8,
                                "Industry, innovation and infrastructure" = 9,
                                "Reduced inequality" = 10,
                                "Sustainable cities and communities" = 11,
                                "Responsible consumption and production" = 12,
                                "Climate action" = 13,
                                "Life below water" = 14,
                                "Life on land" = 15,
                                "Peace, justice and strong institutions" = 16,
                                "Partnership for the goals" = 17),
                    # dzięki true można dodawac kolejne graje
                    multiple = TRUE,
                    selected = 1),
        
        # wyświetlanie opisu
        uiOutput("description"),
        # wyswietlenie kraju
        uiOutput("countries"),
        
        radioButtons(
          # przyciski do wyboru wykresu
          inputId = "chartType",
          label = i18n$t("Choose chart type!"),
          choices = c("line","bar","scatter"),
          selected = "line"
          
        )),
    # wyswietlenie informacji o zapisie wykresu
    actionButton("add_my_page", 
                 i18n$t("Add this plot to your page")),
    br(),
    br(),
    # przycisk zapisu wykresu na zwenętrzny serwer potrzebna zewnętrzna baza danych
    actionButton("add_to_quiz", 
                 i18n$t("Add this chart to quiz"))
  ),    
  
  
  
  
  mainPanel(
    # miejsce wyświetlenia wyboru wykresu 
    conditionalPanel(
      condition = "input.chartType == 'line'",
      plotlyOutput("plot_inter")
    ),
    conditionalPanel(
      condition = "input.chartType == 'bar'",
      plotlyOutput("plot_bar_inter")
    ),
    conditionalPanel(
      condition = "input.chartType == 'scatter'",
      plotlyOutput("plot_scatter_inter")
    )
    
    
  )
)
