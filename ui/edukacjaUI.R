sidebarLayout(
  sidebarPanel(
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    div(id = "panel",
        style="text-align: center;",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        style="text-align: center;",
        selectInput("goal", 
                    label = "Choose goal",
                    # choices goal if you tap goal img
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
                    selected = 1,
                    # add another country
                    multiple = TRUE),
        
        # show description country
        uiOutput("description"),
        # show country
        uiOutput("countries"),
        
        # choises chart type 
        radioButtons(
          inputId = "chartType",
          label = "Choose chart type!",
          choices = c("line","bar","scatter"),
          selected = "line"
          
        )),
    # add chart to your profil 
    actionButton("add_my_page", 
                 "Add this plot to your page"),
    br(),
    br(),
    # save button add chart to quiz database
    actionButton("save", "Add this chart to quiz")
    
  ),    
  
  
  
  
  mainPanel(
    # load plot with render_plotly
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

